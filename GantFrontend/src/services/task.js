import api from "./api";
import {setItem} from "../utils/storage";


export const getAllTask = async () => {
    try {
        const response = await api.get('/api/v1/gant/tasks')
        return response.data
    } catch (e) {
        console.log(e)
    }
}

export const getAllTaskFilter = async (id) => {
    try {
        const response = await api.get(`/api/v1/gant/tasks?project_id=${id}`);
        return response.data;
    } catch (e) {
        console.log(e);
    }
};

export const createTask = async (task, stages) => {
    const createTask = {
        parent_id: task.parent || null,
        project_id: task.projectId,
        team_id: task.teamId,
        name: task.name,
        description: task.description,
        planned_start_date: task.startDate,
        planned_final_date: task.finalDate,
        deadline: task.deadline,
        executor_id: task.executorId,
    };

    let stagesList = [];

    if (Array.isArray(stages)) {
        stagesList = stages.map((stage) => ({ description: stage }));
    }

    const data = {
        task: createTask,
        stages: stagesList,
    };

    try {
        await api.post('/api/v1/gant/task/create', data);
    } catch (e) {
        console.log(e);
    }
};


export const getIdTask = async (id) => {
    try {
        const response = await api.get(`/api/v1/gant/task/${id}`)
        return response.data
    } catch (e) {
        console.log(e)
    }
}

export const updateIdTask = async (id, task, stages) => {
    const updateTask = {
        parent_id: task.parent || null,
        project_id: task.projectId,
        team_id: task.teamId,
        name: task.name,
        description: task.description,
        planned_start_date: task.startDate,
        planned_final_date: task.finalDate,
        deadline: task.deadline,
        executor_id: task.executorId,
    };

    let stagesList = [];

    if (Array.isArray(stages)) {
        stagesList = stages.map((stage) => ({ description: stage }));
    }

    const data = {
        task: updateTask,
        stages: stagesList,
    };
    try {
        await api.post(`/api/v1/gant/task/${id}/edit`, data)
        console.log(data)
    }catch (e){
        console.log(e)
    }
}

export const deleteIdTask = async (id) => {
    try {
        await api.delete(`/api/v1/gant/task/${id}/del`)
    }catch (e){
        console.log(e)
    }
}


export const kanbanView = async (id) => {
    try {
        await api.post(`/api/v1/gant/task/${id}/kanban_view`)
    }catch (e){
        console.log(e)
    }
}


export const editDates = async (id, task) => {
    const data = {
        planned_start_date: task.planned_start_date,
        planned_final_date: task.planned_final_date,
        deadline: task.deadline,
    };
    try {
        await api.post(`http://127.0.0.1:8000/api/v1/gant/task/${id}/edit_dates`, data);
    } catch (e) {
        console.log(e);
        throw e
    }
};
