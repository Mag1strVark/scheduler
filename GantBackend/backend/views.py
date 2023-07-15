from django.forms import model_to_dict
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.request import Request
from .models import *
from .utils import is_valid_date_term, DATE_FORMAT, is_in_parent_terms, get_tasks
from datetime import datetime


@api_view(['GET'])
def get_all_tasks(request):
    """Возвращает задачи во вложенном виде, с полями, необходимыми для диаграммы Ганта.
    В BODY запроса указывается поле {'project_id': <ID-проекта>}
    """
    fields = ['id', 'parent_id', 'name', 'description', 'is_on_kanban',
              'is_completed', 'planned_start_date', 'planned_final_date', 'deadline']
    project_filter = request.GET.get('project_id', None)
    tasks = Task.objects.using('default').filter(project_id=int(project_filter)).values(
        *fields) if project_filter else Task.objects.using('default').all().values(*fields)
    tasks = get_tasks(tasks, None, [])
    return Response(tasks)


@api_view(['GET'])
def get_task_by_id(request, id):
    """Выдает полную информацию по задаче. Если задачи с таким id нет, возвращается ошибка с 404-статус кодом."""
    task = Task.objects.using('default').filter(id=id).first()
    if not task:
        return Response({"msg": "Enter the correct data."}, status=404)
    comments = Comment.objects.using('default').filter(task_id=task.id).all().values('id', 'user_id', 'content')
    stages = Stage.objects.using('default').filter(task_id=task.id).all().values('id', 'description', 'is_ready')
    executor = Executor.objects.using('default').filter(task_id=id).values('id', 'task_id', 'user_id', 'role_id')
    return Response({'task': model_to_dict(task), 'comments': comments, 'stages': stages, 'executor': executor})


@api_view(['POST'])
def edit_dates(request: Request, id):
    """
    Изменение дат начала, окончания выполнения задачи и дедлайна: Если условие
    planned_start_date < planned_finish_date <= deadline не выполняется или нет задачи с таким id, выбрасывается ошибка с 404-статус кодом
    Структура body в запросе:
    { "planned_start_date":"str", "planned_final_date":"str", "deadline":"str" }
    """
    task = Task.objects.using('default').filter(id=id).first()
    if not task:
        return Response({"msg": "Enter the correct data."}, status=404)
    data: dict = request.data
    try:
        start_date = datetime.strptime(data.get('planned_start_date'), DATE_FORMAT).date()
        finish_date = datetime.strptime(data.get('planned_final_date'), DATE_FORMAT).date()
        deadline = datetime.strptime(data.get('deadline'), DATE_FORMAT).date()
    except:
        raise ValueError(f'Incorrect date format. Must be a "{DATE_FORMAT}" format')
    if not is_valid_date_term(start_date, finish_date):
        raise ValueError('Must be "start_date < finish_date"')
    parent = task.parent_id

    task.planned_start_date = start_date
    task.planned_final_date = finish_date
    task.deadline = deadline
    if is_in_parent_terms(parent, task):
        task.save(using='default')
        return Response(request.data)
    return Response({"msg": "Enter the correct data."}, status=404)


@api_view(['POST'])
def create_task(request: Request):
    """Создать задачу:
    {"task":
    {"parent_id":0, "project_id":0, "team_id":0, "name":"string", "description":"string",
    "planned_start_date":"%Y-%m-%d", "planned_final_date":"%Y-%m-%d", "deadline":"%Y-%m-%d", "executor_id": 0},
    "stages": [{"description": "string"}, {"description": "string"}]
    }
    """
    task_data, stages_data = request.data.get('task'), request.data.get('stages')
    parent_task = Task.objects.using('default').filter(id=task_data['parent_id']).first()
    try:
        start_date = datetime.strptime(task_data.get('planned_start_date'), DATE_FORMAT).date()
        final_date = datetime.strptime(task_data.get('planned_final_date'), DATE_FORMAT).date()
        deadline = datetime.strptime(task_data.get('deadline'), DATE_FORMAT).date()
    except:
        raise ValueError(f'Incorrect date format. Must be a "{DATE_FORMAT}" format')
    if not is_valid_date_term(start_date, final_date):
        raise ValueError('Must be "start_date < finish_date"')
    task = Task(
        parent_id=parent_task,
        project_id=task_data['project_id'],
        team_id=task_data['team_id'],
        name=task_data['name'],
        description=task_data.get('description', None),
        status_id=Status.objects.get_or_create(name='В Работу')[0],
        planned_start_date=start_date,
        planned_final_date=final_date,
        deadline=deadline
    )
    if is_in_parent_terms(parent_task, task):
        if parent_task:
            parent_task.is_on_kanban = False
            parent_task.save(using='default')
        task.save(using='default')
        Executor.objects.using('default').create(
            task_id_id=task.id,
            user_id=task_data.get('executor_id'),
            role_id=Role.objects.get_or_create(name='Ответственный')[0])
        for stage in stages_data:
            Stage.objects.using('default').create(
                task_id_id=task.id,
                description=stage.get('description')
            )
        return Response(model_to_dict(task))
    return Response({"msg": "Enter the correct data."}, status=404)


@api_view(['POST'])
def change_kanban_view(request: Request, id: int):
    task = Task.objects.using('default').filter(id=id).first()
    if not task:
        return Response({"msg": "Enter the correct data."}, status=404)
    parent_tasks = Task.objects.using('default').filter(parent_id=id).first()
    if parent_tasks:
        task.is_on_kanban = False
        task.save(using='default')
        return Response({'task': {'id': id, 'is_on_kanban': False}})
    flag = task.is_on_kanban
    task.is_on_kanban = not flag
    task.save(using='default')
    return Response({'task': {'id': id, 'is_on_kanban': task.is_on_kanban}})


@api_view(['DELETE'])
def delete_task(request: Request, id: int):
    """Удалить задачу"""
    task = Task.objects.using('default').filter(id=id).first()
    if not task:
        return Response({"msg": "Enter the correct data."}, status=404)
    context = {'task': task.id, 'status': 'deleted'}
    task.delete()
    return Response(context)


@api_view(['POST'])
def edit_task(request: Request, id: int):
    """{"task":
    {"name":"string", "description":"string",
    "planned_start_date":"%Y-%m-%d", "planned_final_date":"%Y-%m-%d", "deadline":"%Y-%m-%d"},
    "stages": [{"description": "string"}, {"description": "string"}]
    }"""
    task_data = request.data.get('task')
    stages_data = request.data.get('stages', [])
    task = Task.objects.using('default').filter(id=id).first()
    if not task:
        return Response({"msg": "Enter the correct data."}, status=404)
    for stage in Stage.objects.using('default').filter(task_id=id):
        stage.delete()
    for stage in stages_data:
        Stage.objects.using('default').create(
            task_id=task,
            description=stage.get('description')
        )
    task.update(
        name=task_data.get('name', task.name),
        description=task_data.get('description', task.description),
        planned_start_date=task_data.get('planned_start_date', task.planned_start_date),
        planned_final_date=task_data.get('planned_final_date', task.planned_final_date),
        deadline=task_data.get('deadline', task.deadline)
    )
    return Response({'task_id': task.id, 'status': 'updated'})


@api_view(['GET'])
def get_project_info(request: Request):
    projects = UralapiProject.objects.using('ocenka').all().values('id', 'title')
    return Response(projects)


@api_view(['GET'])
def get_teams_info(request: Request):
    teams = UralapiTeam.objects.using('ocenka').all().values('id', 'title', 'teg', 'id_project')
    return Response(teams)


@api_view(['GET'])
def get_users_info(request: Request):
    users = UralapiUser.objects.using('ocenka').all().values('id', 'first_name', 'last_name', 'patronymic', 'username')
    return Response(users)

