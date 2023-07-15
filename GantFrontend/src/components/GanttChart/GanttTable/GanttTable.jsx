import React, {useState} from 'react';
import TaskRow from './TaskRow/TaskRow';
import s from './GanttTable.module.css';
import GanttTaskRow from './GanttTaskRow/GanttTaskRow';

const GanttTable = ({
                        tasks,
                        indentLevel = 0,
                        collapsedTasks,
                        toggleTaskCollapse,
                    }) => {
    const taskStartDates = tasks.map((task) => new Date(task.planned_start_date));
    const taskEndDates = tasks.map((task) => new Date(task.planned_final_date));

    const earliestDate = new Date(Math.min(...taskStartDates));
    const latestDate = new Date(Math.max(...taskEndDates));

    const projectDurationInDays =
        Math.ceil(
            (latestDate.getTime() - earliestDate.getTime()) / (1000 * 60 * 60 * 24)
        ) + 1;

    const startDate = new Date(earliestDate);
    const endDate = new Date(startDate);
    endDate.setDate(endDate.getDate() + projectDurationInDays - 1);

    const dateArray = [];
    for (let d = new Date(startDate); d <= endDate; d.setDate(d.getDate() + 1)) {
        dateArray.push(new Date(d));
    }

    const groupedDates = dateArray.reduce((acc, date) => {
        const monthString = date.toLocaleString("default", {month: "long"});
        acc[monthString] = acc[monthString] || [];
        acc[monthString].push(date);
        return acc;
    }, {});

    const monthArrays = Object.keys(groupedDates).map(
        (month) => groupedDates[month]
    );

    const numDays = projectDurationInDays || 0;
    const dayCellWidth = 100;
    const tableWrapperWidth = numDays * dayCellWidth;

    return (
        <div className={s.container}>
            <div className={s.table}>
                <div className={s.collapse}>
                    <div className={s.titleRow}>
                        <span>Задачи</span>
                    </div>
                    <div>
                        {tasks.map((task) => (
                            <TaskRow
                                key={task.id}
                                task={task}
                                indentLevel={indentLevel}
                                collapsedTasks={collapsedTasks}
                                toggleTaskCollapse={toggleTaskCollapse}
                                onAddButtonClick={() => console.log('Add button clicked')}
                            />
                        ))}
                    </div>
                </div>
            </div>

            <div className={`${s.row} ${s.ganttTable}`}>
                <div className={s.tableWrapper} style={{ width: `${tableWrapperWidth}px` }}>
                    <div className={s.tableHeader}>
                        {monthArrays.map((monthArray, index) => (
                            <div className={s.tableMonth} style={{ width: `${monthArray.length * dayCellWidth}px` }} key={index}>
                                {monthArray[0].toLocaleString('default', {
                                    month: 'long',
                                })}{' '}
                                {monthArray[0].getFullYear()}
                            </div>
                        ))}
                    </div>
                    <div className={s.tableBody}>
                        {dateArray.map((date, index) => (
                            <div className={s.dateCell} key={index}>
                                {date.getDate()}
                            </div>
                        ))}
                    </div>
                </div>
                <div className={s.tasksContainer}>
                    {tasks.map((task) => (
                        <GanttTaskRow
                            key={task.id}
                            task={task}
                            projectDurationInDays={projectDurationInDays}
                            startDate={startDate}
                            collapsedTasks={collapsedTasks}
                        />
                    ))}
                </div>
            </div>
        </div>
    );
};

export default GanttTable;
