import Vue from 'vue'
import Vuex from 'vuex'
import { authLogin } from '../../api/auth.js';
import { getUser, getCart } from '../../api/get.js';
import { changeOrderProductsQuantity } from '../../api/edit.js';

Vue.use(Vuex)

const store = new Vuex.Store({
    state: {
        isAuthenticated: false,
        user: null,
        loginErrors: [],
        cartProducts: [],
    },
    getters: {
        cartProductsQuantity(state) {
            return state.cartProducts.reduce((sum, cartProduct) => {
                return sum += cartProduct.quantity;
            }, 0)
        }
    },
    actions: {
        getUser({ commit, dispatch }) {
            return getUser()
                .then(response => {
                    return new Promise((resolve) => {
                        dispatch('getCartProducts');
                        commit('setUser', response.data);
                        resolve();
                    })
                })
        },

        login({ commit, dispatch }, params) {
            commit('clearLoginErrors');

            return authLogin(params)
                .then(() => {
                    return new Promise((resolve) => {
                        dispatch('getUser');
                        resolve();
                    });
                })
                .catch(error => {
                    commit('setLoginErrors', error.response.data.errors)
                })
        },

        logout({ commit }) {
            commit('clearUser')
        },

        getCartProducts({ commit }) {
            getCart()
                .then((data) => {
                    commit('setCartProducts', data)
                })
        },

        changeCartProductQuantity({ commit }, params) {
            const method = params.quantityChange === 'increase' ? 'addProduct' : 'deleteProduct';
            return changeOrderProductsQuantity(params, method)
                .then((data) => {
                    commit('setCartProducts', data);
                })
        },

        confirmOrder({ commit }) {
            commit('clearCart');
        }
    },
    mutations: {
        setUser(state, user) {
            state.user = user;
            state.isAuthenticated = true;
        },
        clearUser(state) {
            state.user = null;
            state.isAuthenticated = false;
            state.cartProducts = [];
        },
        setLoginErrors(state, errors) {
            state.loginErrors = errors
        },
        clearLoginErrors(state) {
            state.loginErrors = []
        },
        setCartProducts(state, products) {
            state.cartProducts = products;
        },
        clearCart(state) {
            state.cartProducts = [];
        }
    }
})

export default store