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
            getUser()
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

            authLogin(params)
                .then(() => dispatch('getUser'))
                .catch(error => {
                    commit('setLoginErrors', error.response.data.errors)
                })
        },

        logout({ commit }) {
            commit('clearUser')
        },

        getCartProducts({ commit }) {
            getCart()
                .then(({ data }) => {
                    commit('setCartProducts', data)
                })
        },

        changeCartProductQuantity({ commit }, params) {
            changeOrderProductsQuantity(params)
                .then(({ data }) => {
                    if (data.quantity === 0) {
                        commit('deleteCartProduct', data)
                    } else {
                        commit('setCartProductQuantity', data)
                    }
                })
        },
    },
    mutations: {
        setUser(state, user) {
            state.user = user;
            state.isAuthenticated = true;
        },
        clearUser(state) {
            state.user = null;
            state.isAuthenticated = false;
        },
        setLoginErrors(state, errors) {
            state.loginErrors = errors
        },
        clearLoginErrors(state) {
            state.loginErrors = []
        },
        setCartProductQuantity(state, data) {
            const product = state.cartProducts.find(product => {
                return product.id === data.id;
            })
            if (!product) {
                state.cartProducts = [data, ...state.cartProducts];
            } else {
                product.quantity = data.quantity;
            }
        },
        deleteCartProduct(state, data) {
            state.cartProducts = state.cartProducts.filter(product => {
                return product.id !== data.id;
            })
        },
        setCartProducts(state, products) {
            state.cartProducts = products;
        },
    }
})

export default store