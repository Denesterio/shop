require("./bootstrap");
import BootstrapVue from "bootstrap-vue";
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
window.Vue = require("vue").default;
Vue.use(BootstrapVue);
Vue.use(VueSweetalert2);

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

// admin
// Vue.component(
//     "categories-component",
//     require("./components/admin/CategoriesComponent.vue").default
// );
// Vue.component(
//     "subcategories-component",
//     require("./components/admin/SubcategoriesComponent.vue").default
// );
// Vue.component(
//     "products-component",
//     require("./components/admin/ProductsComponent.vue").default
// );
// Vue.component(
//     "tags-component",
//     require("./components/admin/TagsComponent.vue").default
// );
// Vue.component(
//     'authors-list-component',
//     require('./components/admin/AuthorsListComponent.vue').default
// );

// welcome
// Vue.component(
//     'welcome-category-list-component',
//     require('./components/welcome/WelcomeCategoryListComponent.vue').default
// );
// Vue.component(
//     'carousel-component',
//     require('./components/welcome/CarouselComponent.vue').default
// );
// Vue.component(
//     'left-menu-component',
//     require('./components/welcome/LeftMenuComponent.vue').default
// );
// Vue.component(
//     'layout-component',
//     require('./components/welcome/LayoutComponent.vue').default
// );

// Vue.component(
//     'product-list-component',
//     require('./components/ProductListComponent.vue').default
// );
// Vue.component(
//     "cart-component",
//     require("./components/CartComponent.vue").default
// );
// Vue.component(
//     'profile-component',
//     require('./components/profile/ProfileComponent.vue').default
// );
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
