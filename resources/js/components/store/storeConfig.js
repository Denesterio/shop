import RequestBuilder from '../../api/requestBuilder.js';
import { authLogin } from '../../api/auth.js';

export default {
  state: {
    isAuthenticated: false,
    user: null,
    isUserLoading: false,
    cartProducts: []
  },
  getters: {
    cartProductsQuantity(state) {
      return state.cartProducts.reduce((sum, cartProduct) => {
        return (sum += cartProduct.quantity);
      }, 0);
    }
  },
  actions: {
    getUser({ commit, dispatch, state }) {
      if (!state.user && state.isUserLoading === false) {
        state.isUserLoading = true;
        return new RequestBuilder('user')
          .get()
          .then(response => {
            return new Promise(resolve => {
              dispatch('getCartProducts');
              commit('setUser', response);
              resolve();
            });
          })
          .finally(() => (state.isUserLoading = false));
      }
    },

    setUser({ commit }, data) {
      console.dir(data);
      commit('setUser', data);
    },

    login({ commit, dispatch }, params) {
      return authLogin(params).then(response => {
        return new Promise(resolve => {
          dispatch('getCartProducts');
          commit('setUser', response.data);
          resolve();
        });
      });
    },

    logout({ commit }) {
      commit('clearUser');
    },

    getCartProducts({ commit }) {
      new RequestBuilder('cartProducts').get().then(data => {
        data.forEach(product => {
          product.quantity = product.pivot?.quantity;
          product.order_id = product.pivot?.order_id;
        });
        commit('setCartProducts', data);
      });
    },

    changeCartProductQuantity({ commit }, params) {
      return new RequestBuilder('ordersProducts').edit(params).then(data => {
        commit('setCartProducts', data);
      });
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
};
