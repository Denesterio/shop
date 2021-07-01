/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require("./bootstrap");
import BootstrapVue from "bootstrap-vue";
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
window.Vue = require("vue").default;
Vue.use(BootstrapVue);
Vue.use(VueSweetalert2);

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component(
    "categories-component",
    require("./components/admin/CategoriesComponent.vue").default
);
Vue.component(
    "subcategories-component",
    require("./components/admin/SubcategoriesComponent.vue").default
);
Vue.component(
    "products-component",
    require("./components/admin/ProductsComponent.vue").default
);
Vue.component(
    'welcome-category-list-component',
    require('./components/WelcomeCategoryListComponent.vue').default
);
Vue.component(
    'product-list-component',
    require('./components/ProductListComponent.vue').default
);
Vue.component(
    'left-menu-component',
    require('./components/LeftMenuComponent.vue').default
);
Vue.component(
    "tags-component",
    require("./components/admin/TagsComponent.vue").default
);
Vue.component(
    "cart-component",
    require("./components/CartComponent.vue").default
);


Vue.directive('focus', {
  inserted: function (el) {
      el.focus()
  }
});

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: "#app"
});
