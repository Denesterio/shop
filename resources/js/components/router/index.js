import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter);

import ProductListComponent from '../ProductListComponent.vue';
import WelcomeCategoryListComponent from '../welcome/WelcomeCategoryListComponent.vue';
import LoginComponent from '../auth/LoginComponent.vue';
import CartComponent from '../CartComponent.vue';
import LayoutComponent from '../welcome/LayoutComponent.vue';
import ProfileComponent from '../profile/ProfileComponent.vue';
import CategoriesComponent from '../admin/CategoriesComponent.vue';
import SubcategoriesComponent from '../admin/SubcategoriesComponent.vue';
import ProductsComponent from '../admin/ProductsComponent.vue';
import TagsComponent from '../admin/TagsComponent.vue';
import AuthorsListComponent from '../admin/AuthorsListComponent.vue';

const routes = [
    {
        path: '/',
        component: LayoutComponent,
        children: [
            {
                path: '',
                component: WelcomeCategoryListComponent,
                name: 'welcome',
            },
            {
                path: '/categories/:id',
                name: 'categoryProducts',
                component: ProductListComponent,
            },
            {
                path: '/subcategories/:id',
                name: 'subcategoryProducts',
                component: ProductListComponent,
            },
            {
                path: '/authors/:id',
                name: 'authorProducts',
                component: ProductListComponent,
            },
        ]
    },
    {
        path: '/login',
        component: LoginComponent,
        name: 'login',
    },
    {
        path: '/cart',
        component: CartComponent,
        name: 'cart',
    },
    {
        path: '/profile',
        component: ProfileComponent,
        name: 'profile',
    }
]

const router = new VueRouter({
    mode: 'history',
    routes,
})

export default router;