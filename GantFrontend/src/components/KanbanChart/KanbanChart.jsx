import React, {useState} from 'react';
import s from './KanbanChart.module.css'
import Column from "./Column/Column";

const KanbanChart = () => {
    const [boards, setBoards] = useState([
        {id: 1, title:'В РАБОТУ', status:"inwork", items: [{id: 1, name: 'пойтиddd dwdw dwdw frgr  r gr gr dfe efe ', project:"ЛК Планировщик", team:"команда grgr htht grgr", user:"Власов Игорь Александрвич", deadline:'2023-07-24'}, {id: 6, name: 'а теперь знаю'}, {id: 7, name: 'не знаю'}]},
        {id: 2, title:'ВЫПОЛНЯЮТСЯ', status:"except", items: [{id: 2, name: 'уйти'}]},
        {id: 3, title:'ТЕСТИРОВАНИЕ', status:"test", items: [{id: 3, name: 'присесть'}]},
        {id: 4, title:'ПРОВЕРКА', status:"check", items: [{id: 4, name: 'нюхнуть'}]},
        {id: 5, title:'ЗАВЕРШЕННЫЕ', status:"complete", items: [{id: 5, name: 'поржать'}]},
    ])

    return (
        <div className={s.container}>
            <Column boards={boards} setBoards={setBoards}/>
        </div>
    );
};

export default KanbanChart;
