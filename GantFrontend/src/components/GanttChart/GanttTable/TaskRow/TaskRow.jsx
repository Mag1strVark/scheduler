import React, {useState} from 'react';
import {ReactComponent as Add} from '../../../../assets/img/addButton.svg'
import {ReactComponent as Path} from '../../../../assets/img/path.svg'
import {ReactComponent as Vector} from '../../../../assets/img/vector.svg'
import Modal from "../../../GanttTaskForm/Modal/Modal";
import {kanbanView} from "../../../../services/task";
import {useRecoilState, useRecoilValue} from "recoil";
import {tasksState} from "../../../../store/atom";
import {StyledTaskRow} from "./UI/StyledTaskRow";
import {Title} from "./UI/Title";
import {CollapseButton} from "./UI/CollapseButton";
import {Right} from "./UI/Right";
import {Buttons} from './UI/Buttons';

const TaskRow = ({
                     task,
                     indentLevel = 0,
                     collapsedTasks = [],
                     toggleTaskCollapse,
                     onAddButtonClick,
                 }) => {
    const hasChildren = task.children && task.children.length > 0;
    const isCollapsed = collapsedTasks.includes(task.id);
    const [formType, setFormType] = useState('')
    const [showModal, setShowModal] = useState(false)
    const [tasks, setTasks] = useRecoilState(tasksState);
    const [isHovered, setIsHovered] = useState(false);

    const openForm = (type) => {
        setFormType(type);
        setShowModal(true);
    };

    const toggleKanbanView = async (id, isOnKanban) => {
        try {
            await kanbanView(id);
            const updatedTasks = tasks.map((task) =>
                task.id === id ? {...task, is_on_kanban: !isOnKanban} : task
            );
            setTasks(updatedTasks)

            const updateChildTasks = (parentTask) => {
                if (parentTask.children && parentTask.children.length > 0) {
                    const updatedChildTasks = parentTask.children.map((childTask) =>
                        childTask.id === id ? {...childTask, is_on_kanban: !isOnKanban} : childTask
                    ).map(childTask => updateChildTasks(childTask));
                    return {...parentTask, children: updatedChildTasks};
                } else {
                    return parentTask;
                }
            };

            const updatedTasksWithChildren = updatedTasks.map((task) => {
                if (task.id === id) {
                    return task;
                } else {
                    return updateChildTasks(task);
                }
            });

            setTasks(updatedTasksWithChildren);
        } catch (error) {
            console.log(error);
        }
    };


    return (
        <>
            <StyledTaskRow>
                <div style={{paddingLeft: `${indentLevel * 20}px`}}>
                    <Title>
                        {hasChildren && (
                            <CollapseButton onClick={() => toggleTaskCollapse(task.id)}>
                                {isCollapsed ? <Path /> : <Vector />}
                            </CollapseButton>
                        )}
                        <span style={{cursor: "pointer"}} onClick={()=>openForm('view')}>{task.name}</span>
                    </Title>
                    <Right place = 'flex-end' width = '200px'>
                        {!hasChildren && (
                            <div style={{position: 'relative'}}>
                                <input
                                    type="checkbox"
                                    checked={task.is_on_kanban}
                                    onChange={() => toggleKanbanView(task.id, task.is_on_kanban)}
                                    onMouseEnter={() => setIsHovered(true)}
                                    onMouseLeave={() => setIsHovered(false)}
                                />
                                {isHovered && !task.is_on_kanban && <div className="banner">Отображать на канбане</div>}
                            </div>
                        )}
                        <Buttons>
                            <button onClick={()=>openForm('create')}><Add/></button>
                        </Buttons>
                    </Right>
                </div>
            </StyledTaskRow>

            {hasChildren &&
                !isCollapsed &&
                task.children.map((childTask) => (
                    <TaskRow
                        key={childTask.id}
                        task={childTask}
                        indentLevel={indentLevel + 1}
                        collapsedTasks={collapsedTasks}
                        toggleTaskCollapse={toggleTaskCollapse}
                        onAddButtonClick={onAddButtonClick}
                    />
                ))}
            <Modal id={task} parentId={task} showModal={showModal} setShowModal={setShowModal} formType={formType} setFormType={setFormType}/>
        </>
    );
};

export default TaskRow;
