require("./bootstrap");
import BootstrapVue from "bootstrap-vue";
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
window.Vue = require("vue").default;
Vue.use(BootstrapVue);
Vue.use(VueSweetalert2);

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component(
    'navbar-component',
    require('./components/NavbarComponent.vue').default
);
Vue.component(
    'page-not-found-component',
    require('./components/PageNotFoundComponent.vue').default
);

Vue.directive('focus', {
    inserted: function (el) {
        el.focus()
    }
});

import router from './components/router';
import store from './components/store';
import i18n from './lang';

Vue.config.productionTip = false;

const app = new Vue({
    el: "#app",
    router,
    store,
    i18n,
});
