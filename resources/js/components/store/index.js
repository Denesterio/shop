import axios from 'axios';
import Vue from 'vue'
import Vuex from 'vuex'
import { authLogin } from '../../api/auth.js';

Vue.use(Vuex)

const store = new Vuex.Store({
    state: {
        user: null,
        loginErrors: []
    },
    actions: {
        getUser({ commit }) {
            axios.get('/api/auth/getUser')
                .then(response => {
                    return new Promise((resolve, reject) => {
                        commit('setUser', response.data);
                        resolve();
                    })
                })
        },
        login({ commit }, params) {
            commit('clearLoginErrors');
            axios.get("sanctum/csrf-cookie").then(() => {
                axios.post('/api/auth/login', { params })
                    .then(response => {
                        this.dispatch('getUser');
                    })
                    .catch(error => {
                        commit('setLoginErrors', error.response.data.errors)
                    })
            });
        },
        logout({ commit }) {
            commit('clearUser')
        }
    },
    mutations: {
        setUser(state, user) {
            state.user = user
        },
        clearUser(state) {
            state.user = null
        },
        setLoginErrors(state, errors) {
            state.loginErrors = errors
        },
        clearLoginErrors(state) {
            state.loginErrors = []
        },
    }
})

export default store