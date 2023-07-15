import React, {useEffect, useState} from 'react'
import s from './main.module.css'
import GanttChart from "../../components/GanttChart/GanttChart";
import GanttHeader from "../../components/GanttHeader/GanttHeader";
import Header from "../../Header/Header";
import {Navigate, Route, Routes, useLocation, useNavigate} from "react-router-dom";
import Gant from "../gant/gant";
import Kanban from "../kanban/kanban";

const Main = () => {
    return (
        <div className={s.container}>
            <Header/>
            <Routes>
                <Route path="/kanban" element={<Kanban/>}/>
                <Route path="/gantt" element={<Gant/>}/>
            </Routes>
        </div>
    )
}

export default Main
