import React, {useEffect, useState} from 'react';
import s from './EditForm.module.css'
import {useRecoilState, useRecoilValue, useSetRecoilState} from "recoil";
import {projectsList, taskIdState, tasksState, teamsList} from "../../../store/atom";
import {createTask, deleteIdTask, getAllTask, updateIdTask} from "../../../services/task";
import Text from "../UI/Text";
import Select from "../UI/Select";
import {ReactComponent as Project} from  '../../../assets/img/projects.svg'
import {ReactComponent as Add} from  '../../../assets/img/addButtForm.svg'
import {ReactComponent as Del} from  '../../../assets/img/delButtForm.svg'
import {ReactComponent as Clock} from  '../../../assets/img/clock.svg'
import InputDate1 from "../UI/InputDate1";
import ButtonForm from "../UI/Button";
import TextArea from "../UI/TextArea";
import {toast} from "react-toastify";
import { Right } from '../../GanttChart/GanttTable/TaskRow/UI/Right';


const EditForm = ({id, setFormType, setShowModal}) => {
    // const [projectId, setProjectId] = useRecoilState(projectsList)
    const [projectId, setProjectId] = useState(0)
    // const [teamId, setTeamId] = useRecoilState(teamsList)
    const [teamId, setTeamId] = useState(0)
    const [name, setName] = useState('')
    const [description, setDescription] = useState('')
    const [startDate, setStartDate] = useState('')
    const [finalDate, setFinalDate] = useState('')
    const [deadline, setDeadline] = useState('')
    const [executorId, setExecutorId] = useState(0)
    // const [stages, setStages] = useState([])
    const [performers, setPerformers] = useState([]);
    const [taskId, setTaskId] = useRecoilState(taskIdState)
    const setTasks = useSetRecoilState(tasksState)
    const tasks = useRecoilValue(tasksState)

    const options = [
        { id: 1, name: 'Название проекта' },
        { id: 21, name: 'ЛК оценка' },
        { id: 22, name: 'ЛК Гант' },
        { id: 23, name: 'ЛК Канбан' }
    ];

    const handleAddPerformer = () => {
        setPerformers([...performers, options])
    };

    const handleDeletePerformer = (index) => {
        const newData = [...performers];
        newData.splice(index, 1);
        setPerformers(newData);
    };

    const handleAddStages = () => {
        const newStage = {
            id: taskId.stages.length > 0 ? taskId.stages[taskId.stages.length - 1].id + 1 : 1,
            checked: false,
            description: ''
        };
        const updatedStages = [...(taskId.stages ?? []), newStage];
        setTaskId({ ...taskId, stages: updatedStages });
    };

    const handleDeleteStages = (id) => {
        const newData = taskId.stages.filter(stage => stage.id !== id);
        setTaskId({ ...taskId, stages: newData });
    };

    const handleStageDescriptionChange = (index, description) => {
        const updatedStages = [...taskId.stages];
        if (updatedStages[index]) {
            const updatedStage = { ...updatedStages[index], description };
            updatedStages[index] = updatedStage;
            setTaskId({ ...taskId, stages: updatedStages });
        }
    };

    const validateDates = () => {
        if (!taskId.task.parent_id) {
            return true;
        }

        const parentStartDate = Date.parse(findTaskById(tasks, taskId.task.parent_id)?.planned_start_date);
        const parentFinalDate = Date.parse(findTaskById(tasks, taskId.task.parent_id)?.planned_final_date);

        if (Date.parse(startDate) === parentStartDate || Date.parse(finalDate) === parentFinalDate) {
            return true;
        } else if (Date.parse(startDate) < parentStartDate || Date.parse(finalDate) > parentFinalDate) {
            return false;
        }

        return true;
    };

    const handleSubmit = async (event) => {
        event.preventDefault();

        if (!validateDates()) {
            alert("Подзадача не может выходить за отрезок времени базовой задачи.");
            return
        }

        const taskList = {
            parent: taskId.task.parent_id !== null ? taskId.task.parent_id : null,
            projectId: projectId !== 0 ? projectId : taskId.task.project_id,
            teamId: teamId !== 0 ? teamId : taskId.task.team_id,
            name: name !== '' ? name : taskId.task.name,
            description: description !== '' ? description : taskId.task.description,
            startDate: startDate !== '' ? startDate : taskId.task.planned_start_date,
            finalDate: finalDate !== '' ? finalDate : taskId.task.planned_final_date,
            deadline: deadline !== '' ? deadline : taskId.task.deadline,
            // executorId: executorId !== 0 ? executorId : taskId.executor && taskId.executor[0].user_id,
        };

        const stagesList = taskId.stages.map((stage) => stage.description);

        try {
            await updateIdTask(id.id, taskList, stagesList);
            setShowModal(false);
            getAllTask()
                .then((response) => {
                    setTasks(response);
                })
                .catch((error) => {
                    console.log(error);
                });
            toast.success('Задача изменена!', {
                position: "top-right",
                autoClose: 1000,
                hideProgressBar: false,
                closeOnClick: true,
                pauseOnHover: true,
                draggable: true,
                progress: undefined,
                theme: "light",
            });
        } catch (e) {
            console.log(e);
        }
    };

    const Delete = async () => {
        try {

            const taskChild = findTaskById(tasks, taskId.task.id);

            if (taskChild.children.length !== 0 && taskChild.children.length > 0) {
                toast.error('Невозможно удалить задачу с подзадачами!', {
                    position: "top-right",
                    autoClose: 1000,
                    hideProgressBar: false,
                    closeOnClick: true,
                    pauseOnHover: true,
                    draggable: true,
                    progress: undefined,
                    theme: "light",
                });
                return
            }

            await deleteIdTask(taskId.task.id);
            setShowModal(false);
            const updatedTasks = await getAllTask();
            setTasks(updatedTasks);
            toast.success('Задача удалена!', {
                position: "top-right",
                autoClose: 1000,
                hideProgressBar: false,
                closeOnClick: true,
                pauseOnHover: true,
                draggable: true,
                progress: undefined,
                theme: "light",
            });
        } catch (e) {
            console.log(e);
        }
    }

    const findTaskById = (tasks, taskId) =>{
        for (let i = 0; i < tasks.length; i++) {
            const task = tasks[i];
            if (task.id === taskId) {
                return task;
            }
            if (task.children && task.children.length > 0) {
                const foundTask = findTaskById(task.children, taskId);
                if (foundTask) {
                    return foundTask;
                }
            }
        }
        return null;
    }

    return (
        <div className={s.container}>
            <form className={s.form} onSubmit={handleSubmit}>
                <div className={s.title}>
                    <Text defaultValue={taskId.task && taskId.task.name}  optional={true} width={"606px"} height={"36px"} padding={"10px"} border={"1px solid #ccc"} background={"#FFFFFF"} fontSize={"20px"} fontWeight={"700"} onChange={(event) => setName(event.target.value)}/>
                    <span style={{padding:'0px 4px'}}>
                        Базовая задача:
                        <span>&nbsp;</span>
                        <span style={{textDecoration:'underline'}}>
                        {taskId.task && taskId.task.parent_id !== null ?
                            findTaskById(tasks, taskId.task.parent_id)?.name : "Отсутствует"}
                        </span>
                    </span>
                </div>
                {/* <div className={s.info}> */}
                <div className={s.info}>
                    <div className={s.elements}>
                        <div className={s.project}>
                            <Select
                                label="Проект"
                                // icon={<Project/>}
                                defaultValue={taskId.task && taskId.task.project_id}
                                options={options.map(opt => ({value: opt.id, name: opt.name}))}
                                onChange={(event) => setProjectId(event.target.value)}
                            />
                        </div>
                        <div className={s.element}>
                            <Select
                                label="Тег команды"
                                // icon={<Project/>}
                                defaultValue={taskId.task && taskId.task.team_id}
                                options={options.map(opt => ({value: opt.id, name: opt.name}))}
                                onChange={(event) => setTeamId(event.target.value)}
                            />
                        </div>
                        <div className={s.element}>
                            <span>Дедлайн</span>
                                <InputDate1
                                    defaultValue={taskId.task && taskId.task.deadline}
                                    onChange={(event) => setDeadline(event.target.value)}
                                    icon={<Clock/>}
                                />
                        </div>
                    </div>
                    <div className={s.elements}>
                        <div className={`${s.element} ${s.deadlines}`}>
                            <span>Планируемые сроки выполнения</span>
                            <div className={s.elements}>
                                <InputDate1
                                        defaultValue={taskId.task && taskId.task.planned_start_date}
                                        onChange={(event) => setStartDate(event.target.value)}
                                        icon={<Clock/>}
                                    />
                                    <span style={{alignSelf:'center'}}>-</span>
                                <InputDate1
                                        defaultValue={taskId.task && taskId.task.planned_final_date}
                                        onChange={(event) => setFinalDate(event.target.value)}
                                        icon={<Clock/>}
                                    />
                            </div>
                            {/* <div className={s.date}>
                                <input
                                    type="date"
                                    defaultValue={taskId.task && taskId.task.planned_start_date}
                                    onChange={(event) => setStartDate(event.target.value)}
                                />
                                <span>- </span>
                                <input
                                    type="date"
                                    defaultValue={taskId.task && taskId.task.planned_final_date}
                                    onChange={(event) => setFinalDate(event.target.value)}
                                />
                            </div> */}
                        </div>
                    </div>
                    <div className={s.description}>
                        <TextArea
                            width={"606px"}
                            height={"128px"}
                            placeholder="Введите описание..."
                            defaultValue={taskId.task && taskId.task.description}
                            onChange={(event) => setDescription(event.target.value)}
                        />
                    </div>
                    <div className={s.important}>
                        <Select
                            label="Постановщик"
                            icon={<Project/>}
                            options={options.map(opt => ({value: opt.id, name: opt.name}))}
                            onChange={(e) => console.log(e.target.value)}
                        />
                        <Select
                            label="Ответственный"
                            icon={<Project/>}
                            disabled
                            defaultValue={taskId.executor && taskId.executor[0].user_id}
                            options={options.map(opt => ({value: opt.id, name: opt.name}))}
                            onChange={(event) => setExecutorId(event.target.value)}
                        />
                    </div>
                    <div className={s.unimportant}>
                        <div className={s.unimportantTop}>
                            <span className={s.label}>Исполнители</span>
                            <button type="button"  onClick={handleAddPerformer}>
                                <Add />
                            </button>
                        </div>
                        <div className={s.unimportantLists}>
                            {performers.map((performer, index) => (
                                <div className={s.unimportantList} key={index}>
                                    <Select  options={options.map(opt => ({value: opt.id, name: opt.name}))}/>
                                    <button className={s.deleteButton}  onClick={() => handleDeletePerformer(index)}>
                                        <Del style={{width: "16px", height: "16px"}} />
                                    </button>
                                </div>
                            ))}
                        </div>
                    </div>
                    <div className={s.checklist}>
                        <div className={s.checklistTop}>
                            <span className={s.label}>Чек-лист</span>
                            <button type="button"  onClick={() => handleAddStages('')}>
                                <Add />
                            </button>
                        </div>
                        <div className={s.checkLists}>
                            {taskId.stages && taskId.stages.map((stage, index) => (
                                <div className={s.checkList} key={index}>
                                    <Right>
                                        <input type="checkbox" defaultChecked={stage.is_ready}/>
                                    </Right>
                                    <Text
                                        width={"60%"}
                                        height={"21px"}
                                        padding={"10px"}
                                        border={"1px solid #ccc"}
                                        background={"#FFFFFF"}
                                        value={stage.description}
                                        onChange={(event) =>
                                            handleStageDescriptionChange(
                                                index,
                                                event.target.value
                                            )
                                        }
                                    />
                                    <button className={s.deleteButton} type="button" onClick={() => handleDeleteStages(stage.id)}>
                                        <Del style={{width: "16px", height: "16px"}} />
                                    </button>
                                </div>
                            ))}
                        </div>
                    </div>
                    <div className={s.timeSpent}>
                        <span className={s.label}>Затраченное время</span>
                        <div className={s.timeSpentElements}>
                                <span>00:00:00</span>
                                <Text
                                width={"fit-content"}
                                height={"32px"}
                                padding={"4px 8px"}
                                border={"1px solid #ccc"}
                                background={"#FFFFFF"}
                                value={'ФИО'} disabled/>
                            </div>
                    </div>
                    <div className={s.buttons}>
                        <ButtonForm type="submit">Сохранить</ButtonForm>
                        <ButtonForm onClick={() => setFormType('create')}>Создать подзадачу</ButtonForm>
                        <ButtonForm status='deleteTask' onClick={Delete}>Удалить задачу</ButtonForm>
                    </div>
                </div>
            </form>
        </div>
    );
};

export default EditForm;
