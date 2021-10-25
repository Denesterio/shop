import RequestBuilder from '../../api/requestBuilder.js';

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
      commit('setUser', data);
    },

    login({ commit, dispatch }, params) {
      return new RequestBuilder('login').create(params).then(response => {
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
      const action =
        params.quantityChange === 'increase' ? 'addProduct' : 'deleteProduct';
      const formData = new FormData();
      formData.append('product_id', params.productId);
      return new RequestBuilder(action).edit(null, formData).then(response => {
        return new Promise(resolve => {
          response.data.forEach(product => {
            product.quantity = product.pivot?.quantity;
            product.order_id = product.pivot?.order_id;
          });
          commit('setCartProducts', response.data);
          resolve();
        });
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
