import {atom} from "recoil";

export const taskIdState = atom({
    key: 'taskIdState',
    default: []
})

export const tasksState = atom({
    key: 'tasksState',
    default: []
})


export const usersList = atom({
    key: 'usersList',
    default: []
})


export const projectsList = atom({
    key: 'usersList',
    default: []
})


export const teamsList = atom({
    key: 'usersList',
    default: []
})

export const timerState = atom({
    key: 'timerState',
    default: {
        time: 0,
        isRunning: false,
        timerId: null,
        taskId: null,
        taskName: '',
        task: null
    },
});

export const commentsState = atom({
    key: 'commentsState',
    default: [],
});

export const editDate = atom({
    key: 'editDates',
    default: false,
})
