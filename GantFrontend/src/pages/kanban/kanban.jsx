import React from 'react';
import KanbanHeader from "../../components/KanbanHeader/KanbanHeader";
import s from './kanban.module.css'
import KanbanChart from "../../components/KanbanChart/KanbanChart";

const Kanban = () => {
    return (
        <div className={s.container}>
            <KanbanHeader/>
            <div className={s.kanban}>
                <KanbanChart/>
            </div>
        </div>
    );
};

export default Kanban;
