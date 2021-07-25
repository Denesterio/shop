require("./bootstrap");
// import BootstrapVue from "bootstrap-vue";
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
window.Vue = require("vue").default;
// Vue.use(BootstrapVue);
Vue.use(VueSweetalert2);

import { BButtonClose } from 'bootstrap-vue';
import { BButton } from 'bootstrap-vue';
import { BCollapse } from 'bootstrap-vue';
import { BFormGroup } from 'bootstrap-vue';
import { BFormCheckboxGroup } from 'bootstrap-vue';
import { BFormCheckbox } from 'bootstrap-vue';
import { BModal } from 'bootstrap-vue';
import { BFormRadioGroup } from 'bootstrap-vue';
import { BCard } from 'bootstrap-vue';
import { BCardHeader } from 'bootstrap-vue';
import { BCardBody } from 'bootstrap-vue';
import { VBToggle } from 'bootstrap-vue';

Vue.component('b-button-close', BButtonClose);
Vue.component('b-button', BButton);
Vue.component('b-collapse', BCollapse);
Vue.component('b-form-group', BFormGroup);
Vue.component('b-form-checkbox-group', BFormCheckboxGroup);
Vue.component('b-form-checkbox', BFormCheckbox);
Vue.component('b-modal', BModal);
Vue.component('b-form-radio-group', BFormRadioGroup);
Vue.component('b-card', BCard);
Vue.component('b-card-header', BCardHeader);
Vue.component('b-card-body', BCardBody);


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
Vue.directive('b-toggle', VBToggle);

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
