import React from 'react';
import s from './gant.module.css'
import GanttHeader from "../../components/GanttHeader/GanttHeader";
import GanttChart from "../../components/GanttChart/GanttChart";

const Gant = () => {
    return (
        <div className={s.container}>
            <GanttHeader/>
            <div className={s.gant}>
                <GanttChart />
            </div>
        </div>
    );
};

export default Gant;
