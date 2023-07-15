from django.urls import path
from .views import *


urlpatterns = [
    path('tasks', get_all_tasks),
    path('task/<int:id>', get_task_by_id),
    path('task/create', create_task),
    path('task/<int:id>/edit_dates', edit_dates),
    path('task/<int:id>/kanban_view', change_kanban_view),
    path('task/<int:id>/del', delete_task),
    path('task/<int:id>/edit', edit_task),
    path('projects', get_project_info),
    path('teams', get_teams_info),
    path('users', get_users_info),
]
