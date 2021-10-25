import Vue from 'vue';
import Vuex from 'vuex';
import storeConfig from './storeConfig.js';

Vue.use(Vuex);

const store = new Vuex.Store(storeConfig);

export default store;
