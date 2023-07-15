import React, {useState} from 'react';
import Select from "../UI/Select";
import Button from "../UI/Button";
import s from './KanbanHeader.module.css'


const KanbanHeader = () => {
    return (
        <div className={s.container}>
            <div className={s.elements}>
                <div className={s.selects}>
                    <Select dis={"Мои задачи"}/>
                    <Select dis={"Название проекта"}/>
                </div>
                <div className={s.buttons}>
                    <Button children={"Убрать завершенные задачи"} width={250}/>
                </div>
            </div>
        </div>
    );
};

export default KanbanHeader;
