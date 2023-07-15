import React, {useEffect, useState} from 'react';
import s from './ViewForm.module.css'
import {useRecoilState, useRecoilValue, useSetRecoilState} from "recoil";
import {commentsState, projectsList, taskIdState, tasksState, teamsList, timer, timerState} from "../../../store/atom";
import {createTask, deleteIdTask, getAllTask, getIdTask} from "../../../services/task";
import Text from "../UI/Text";
import Select from "../UI/Select";
import {ReactComponent as Project} from '../../../assets/img/projects.svg'
import InputDate1 from "../UI/InputDate1";
import ButtonForm from "../UI/Button";
import TextArea from "../UI/TextArea";
import {toast} from "react-toastify";
import { Right } from '../../GanttChart/GanttTable/TaskRow/UI/Right';
import {ReactComponent as Clock} from  '../../../assets/img/clock.svg';
import {ReactComponent as Timer} from  '../../../assets/img/timer.svg';
import {ReactComponent as StartTimerButton} from  '../../../assets/img/startTimerButton.svg';
import {ReactComponent as TrashTimerButton} from  '../../../assets/img/trashButton.svg';
import {ReactComponent as PauseTimerButton} from  '../../../assets/img/pauseTimerButton.svg';


const ViewForm = ({id, setFormType, setShowModal}) => {
    const taskId = useRecoilValue(taskIdState)
    const setTaskId = useSetRecoilState(taskIdState)
    const setTasks = useSetRecoilState(tasksState)
    const tasks = useRecoilValue(tasksState)
    const [timer, setTimer] = useRecoilState(timerState)
    const [comment, setComment] = useState('')
    const [comments, setComments] = useRecoilState(commentsState)

    const options = [
        {id: 1, name: 'Название проекта'},
        {id: 21, name: 'ЛК оценка'},
        {id: 22, name: 'ЛК Гант'},
        {id: 23, name: 'ЛК Канбан'}
    ];
    const addComments = () => {
        const newComment = {
            name: 'Имя пользователя',
            text: comment,
        };

        setComments((prevComments) => [...prevComments, newComment]);

        setComment('');
    };

    const formatTime = (totalSeconds) => {
        const hours = Math.floor(totalSeconds / 3600).toString().padStart(2, '0');
        const minutes = Math.floor((totalSeconds % 3600) / 60).toString().padStart(2, '0');
        const seconds = (totalSeconds % 60).toString().padStart(2, '0');
        return `${hours}:${minutes}:${seconds}`;
    };

    const startTimer = () => {
        if (!timer.isRunning && timer.taskId === null || !timer.isRunning && timer.taskId === id.id || !timer.isRunning && timer.taskId !== id.id && timer.timerId === null) {
            const timerId = setInterval(() => {
                setTimer((prevTimer) => ({
                    ...prevTimer,
                    time: prevTimer.time + 1,
                    taskId: id.id
                }));
            }, 1000);

            setTimer((prevTimer) => ({
                ...prevTimer,
                isRunning: true,
                timerId,
                taskId: id.id,
                taskName: id.name,
                task: id,
            }));
        }
    };


    const stopTimer = () => {
        if (timer.isRunning && timer.taskId === id.id) {
            clearInterval(timer.timerId);
            setTimer((prevTimer) => ({
                ...prevTimer,
                isRunning: false,
                taskId: id.id,
                taskName: id.name
            }));
        }
    };

    const resetTimer = () => {
        if (!timer.isRunning && timer.taskId === id.id){
            clearInterval(timer.timerId);
            setTimer((prevTimer) => ({
                ...prevTimer,
                time: 0,
                isRunning: false,
                timerId: null,
            }));
        }
    };

    const saveTimer = () =>{

    }


    useEffect(() => {
        getIdTask(id.id)
            .then((response) => {
                setTaskId(response)
            })
            .catch((error) => {
                console.log(error)
            })
    }, [setTaskId])

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

    const findTaskById = (tasks, taskId) => {
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
            <form className={s.form}>
                <div className={s.title}>
                <Text width={"606px"} height={"36px"} fontSize={"20px"} fontWeight={"700"} value={taskId.task && taskId.task.name} disabled/>
                    <span style={{padding:'0px 4px'}}>
                        Базовая задача:
                        <span>&nbsp;</span>
                        <span style={{textDecoration: 'underline'}}>
                        {taskId.task && taskId.task.parent_id !== null ?
                            findTaskById(tasks, taskId.task.parent_id)?.name : "Отсутствует"}
                        </span>
                    </span>
                </div>
                <div className={s.info}>
                    <div className={s.elements}>
                        <div className={s.project}>
                            <Select
                                label="Проект"
                                // icon={<Project/>}
                                options={options.map(opt => ({value: opt.id, name: opt.name}))}
                                value={taskId.task && taskId.task.project_id}
                                disabled
                            />
                        </div>
                        <div className={s.element}>
                            <Select
                                label="Тег команды"
                                // icon={<Project/>}
                                options={options.map(opt => ({value: opt.id, name: opt.name}))}
                                value={taskId.task && taskId.task.team_id}
                                disabled
                            />
                        </div>
                        <div className={s.element}>
                            <span>Дедлайн</span>
                            <InputDate1
                                value={taskId.task && taskId.task.deadline}
                                disabled
                                icon={<Clock/>}
                            />
                        </div>
                    </div>
                <div className={s.elements}>
                    <div className={`${s.element} ${s.deadlines}`}>
                        <span>Планируемые сроки выполнения</span>
                        <div className={s.elements}>
                            <InputDate1
                                    value={taskId.task && taskId.task.planned_start_date}
                                    disabled
                                    icon={<Clock/>}
                                />
                            <span style={{alignSelf:'center'}}>-</span>
                            <InputDate1
                                    value={taskId.task && taskId.task.planned_final_date}
                                    disabled
                                    icon={<Clock/>}
                                />
                        </div>
                        {/* <div className={s.date}>
                            <input
                                disabled
                                type="date"
                                value={taskId.task && taskId.task.planned_start_date}
                            />
                            <span> - </span>
                            <input
                                disabled
                                type="date"
                                value={taskId.task && taskId.task.planned_final_date}
                            />
                        </div> */}
                    </div>
                </div>
                    <div className={s.description}>
                        <TextArea
                            value={taskId.task && taskId.task.description}
                            placeholder="Введите комментарий..."
                            width={"606px"}
                            height={"128px"}
                            disabled
                        />
                    </div>
                    <div className={s.important}>
                        <Select
                            label="Постановщик"
                            icon={<Project/>}
                            options={options}
                            disabled
                        />
                        <Select
                            label="Ответственный"
                            icon={<Project/>}
                            options={options.map(opt => ({value: opt.id, name: opt.name}))}
                            value={taskId.executor && taskId.executor[0].user_id}
                            disabled
                        />
                    </div>
                    <div className={s.unimportant}>
                        <div className={s.unimportantTop}>
                            <span className={s.label}>Исполнители</span>
                        </div>
                        <div className={s.unimportantLists}>
                            {/*{taskId.executor.map((performer, index) => (*/}
                            {/*    <div className={s.unimportantList} key={index}>*/}
                            {/*        <Select disabled options={options} selectedValue={'1'} onChange={() => {*/}
                            {/*        }}/>*/}
                            {/*    </div>*/}
                            {/*))}*/}
                        </div>
                    </div>
                    {taskId.stages?.length === 0 ? null :
                        <div className={s.checklist}>
                            <div className={s.checklistTop}>
                                <span className={s.label}>Чек-лист</span>
                            </div>
                            <div className={s.checkLists}>
                                {taskId.stages && taskId.stages.map((stage, index) => (
                                    <div className={s.checkList} key={index}>
                                        <Right>
                                            <input type="checkbox" checked={stage.is_ready}/>
                                        </Right>
                                        <Text
                                        width={"60%"}
                                        height={"21px"}
                                        padding={"10px"}
                                        value={stage.description}
                                        disabled/>
                                    </div>
                                ))}
                            </div>
                        </div>
                    }
                    <div className={s.time}>
                        <div className={s.timer}>
                        <span className={s.label}>Таймер</span>
                            <div className={s.timerElements}>
                                <div className={s.timeElements}>
                                    <div className={s.timeContainer}>
                                        <span className={s.timerIcon}><Timer/></span>
                                        <span className={s.timeValue}>{timer.taskId === id.id ? formatTime(timer.time) : "00:00:00"}</span>
                                    </div>
                                    <div className={s.timerButtonsContainer}>
                                        <ButtonForm onClick={timer.isRunning ? stopTimer : startTimer} padding={'0 8px'} width={'32px'}>
                                            {timer.isRunning && timer.taskId === id.id  ? <PauseTimerButton/> : <StartTimerButton/>}
                                        </ButtonForm>
                                        <ButtonForm>Сохранить</ButtonForm>
                                        <ButtonForm onClick={resetTimer} status='notActive' padding={'0 8px'}><TrashTimerButton/></ButtonForm>
                                    </div>
                                </div>
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
                    </div>
                    <div className={s.buttons}>
                        <ButtonForm
                                    onClick={() => setFormType('edit')}>Редактировать</ButtonForm>
                        <ButtonForm onClick={() => setFormType('create')}>Создать
                            подзадачу</ButtonForm>
                        <ButtonForm status='deleteTask' onClick={Delete}>Удалить
                            задачу</ButtonForm>
                    </div>
                    <div className={s.comments}>
                        <div className={s.commentsInput}>
                            <span className={s.label}>Комментарии</span>
                            <div className={s.commentsInputElements}>
                                <TextArea
                                    value={comment}
                                    onChange={(event) => setComment(event.target.value)}
                                    placeholder="Введите комментарий..."
                                    height={"40px"}
                                />
                                <ButtonForm height={"40px"} onClick={addComments}>Отправить</ButtonForm>
                            </div>
                        </div>
                        <div className={s.commentsOutput}>
                            {comments.map((comment, index) => (
                                <div className={s.commentsOutputItem} key={index}>
                                    <div className={s.commentsOutputTitle}>
                                        <p className={s.commentsOutputName}>{comment.name}</p>
                                    </div>
                                    {/*<p className={s.commentsOutputText}>{comment.text}</p>*/}
                                    <TextArea
                                        value={comment.text}
                                        onChange={(event) => setComment(event.target.value)}
                                        height={"auto"}
                                        disabled
                                    />
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </form>
        </div>
    );
};

export default ViewForm;
