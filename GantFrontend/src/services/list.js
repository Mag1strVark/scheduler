import api from "./api";
import {setItem} from "../utils/storage";

export const getAllUsers = async () =>{
    try {
        const response = await api.get('/api/v1/gant/users')
        return response.data
    }catch (e) {
        console.log(e)
    }
}

export const getAllProjects = async () =>{
    try {
        const response = await api.get('/api/v1/gant/projects')
        return response.data
    }catch (e) {
        console.log(e)
    }
}

export const getAllTeams = async () =>{
    try {
        const response = await api.get('/api/v1/gant/teams')
        return response.data
    }catch (e) {
        console.log(e)
    }
}
