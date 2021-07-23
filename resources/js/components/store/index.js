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
        isUserLoading: false,
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
        getUser({ commit, dispatch, state }) {
            if (!state.user && state.isUserLoading === false) {
                state.isUserLoading = true;
                return getUser()
                    .then(response => {
                        return new Promise((resolve) => {
                            dispatch('getCartProducts');
                            commit('setUser', response.data);
                            resolve();
                        })
                    })
                    .finally(() => state.isUserLoading = false);
            }
        },

        setUser({ commit }, data) {
            commit('setUser', data);
        },

        login({ commit, dispatch }, params) {
            return authLogin(params)
                .then((response) => {
                    return new Promise((resolve) => {
                        dispatch('getCartProducts');
                        commit('setUser', response.data);
                        resolve();
                    });
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
        setCartProducts(state, products) {
            state.cartProducts = products;
        },
        clearCart(state) {
            state.cartProducts = [];
        }
    }
})

export default store;