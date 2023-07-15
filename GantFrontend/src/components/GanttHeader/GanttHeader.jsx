import React, {useEffect, useState} from 'react';
import s from './GanttHeader.module.css'
import Select from "../UI/Select";
import Button from "../UI/Button";
import {useRecoilValue, useSetRecoilState} from "recoil";
import {projectsList, tasksState, teamsList} from "../../store/atom";
import {getAllProjects, getAllTeams} from "../../services/list";
import Modal from "../GanttTaskForm/Modal/Modal";
import {getAllTask, getAllTaskFilter} from "../../services/task";

const GanttHeader = () => {
    const [formType, setFormType] = useState('')
    const [showModal, setShowModal] = useState(false)
    const [projectId, setProjectId] = useState(0)
    const parentId = null

    const projectList = useRecoilValue(projectsList)
    const setProjectList = useSetRecoilState(projectsList)

    const teamList = useRecoilValue(teamsList)
    const setTeamsList = useSetRecoilState(teamsList)

    const setTasks = useSetRecoilState(tasksState);

    useEffect(() => {
        if (projectId === 1) {
            getAllTask()
                .then((response) => {
                    setTasks(response);
                })
                .catch((error) => {
                    console.log(error);
                });
        } else {
            getAllTaskFilter(projectId)
                .then((response) => {
                    setTasks(response);
                })
                .catch((error) => {
                    console.log(error);
                });
        }
    }, [projectId, setTasks]);

    const openForm = (type) => {
        setFormType(type);
        setShowModal(true);
    };

    // useEffect(()=>{
    //     getAllProjects()
    //         .then((response) => {
    //             setProjectList(response);
    //         })
    //         .catch((error) => {
    //             console.log(error);
    //         });
    //
    //     getAllTeams ()
    //         .then((response) => {
    //             setTeamsList(response);
    //         })
    //         .catch((error) => {
    //             console.log(error);
    //         });
    // }, [setProjectList])

    const options = [
        { id: '', name: 'Название проекта' },
        { id: 21, name: 'ЛК оценка' },
        { id: 22, name: 'ЛК Гант' },
        { id: 23, name: 'ЛК Канбан' },
    ];

    return (
        <div className={s.container}>
            <div className={s.elements}>
                <div className={s.selects}>
                    <Select options={projectList} dis={"Мои задачи"}/>
                    {/*<Select*/}
                    {/*    options={options.map(opt => ({value: opt.id, name: opt.name}))}*/}
                    {/*    onChange={(event) => setProjectId(event.target.value)}*/}
                    {/*/>*/}
                    <Select options={teamList} dis={"Команда"}/>
                </div>
                <div className={s.buttons}>
                    <Button children={"Создать задачу"} onClick={()=>openForm('create')}/>
                </div>
            </div>
            <Modal parentId={parentId} showModal={showModal} setShowModal={setShowModal} formType={formType} setFormType={setFormType}/>
        </div>
    );
};

export default GanttHeader;
