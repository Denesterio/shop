import Vue from 'vue';
import VueRouter from 'vue-router';
import store from '../store';

Vue.use(VueRouter);

import ProductListComponent from '../ProductListComponent.vue';
import WelcomeCategoryListComponent from '../welcome/WelcomeCategoryListComponent.vue';
import LoginComponent from '../auth/LoginComponent.vue';
import RegisterComponent from '../auth/RegisterComponent.vue';
import CartComponent from '../CartComponent.vue';
import LayoutComponent from '../welcome/LayoutComponent.vue';
import ProfileComponent from '../profile/ProfileComponent.vue';
import CategoriesComponent from '../admin/CategoriesComponent.vue';
import SubcategoriesComponent from '../admin/SubcategoriesComponent.vue';
import ProductsComponent from '../admin/ProductsComponent.vue';
import TagsComponent from '../admin/TagsComponent.vue';
import AuthorsListComponent from '../admin/AuthorsListComponent.vue';
import PageNotFoundComponent from '../PageNotFoundComponent.vue';
import ProductPageComponent from '../ProductPageComponent.vue';

const routes = [
  {
    path: '/',
    component: LayoutComponent,
    children: [
      {
        path: '',
        component: WelcomeCategoryListComponent,
        name: 'welcome'
      },
      {
        path: '/categories/:id',
        name: 'categoryProducts',
        component: ProductListComponent
      },
      {
        path: '/subcategories/:id',
        name: 'subcategoryProducts',
        component: ProductListComponent
      },
      {
        path: '/authors/:id',
        name: 'authorProducts',
        component: ProductListComponent
      }
    ]
  },
  {
    path: '/login',
    component: LoginComponent,
    name: 'login'
  },
  {
    path: '/register',
    component: RegisterComponent,
    name: 'register'
  },
  {
    path: '/cart',
    component: CartComponent,
    name: 'cart',
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/profile',
    component: ProfileComponent,
    name: 'profile',
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/admin/categories',
    name: 'categories',
    component: CategoriesComponent,
    meta: {
      adminOnly: true
    }
  },
  {
    path: '/admin/subcategories',
    name: 'subcategories',
    component: SubcategoriesComponent,
    meta: {
      adminOnly: true
    }
  },
  {
    path: '/admin/products',
    name: 'products',
    component: ProductsComponent,
    meta: {
      adminOnly: true
    }
  },
  {
    path: '/admin/tags',
    name: 'tags',
    component: TagsComponent,
    meta: {
      adminOnly: true
    }
  },
  {
    path: '/admin/authors',
    name: 'authors',
    component: AuthorsListComponent,
    meta: {
      adminOnly: true
    }
  },
  {
    path: '/products/:id',
    name: 'productPage',
    component: ProductPageComponent
  },
  {
    path: '/notFound',
    alias: '*',
    name: '404',
    component: PageNotFoundComponent
  }
];

const router = new VueRouter({
  routes,
  mode: 'history',
  base: process.env.BASE_URL
});

router.beforeEach((to, _from, next) => {
  if (to.matched.some(route => route.meta?.requiresAuth)) {
    if (store.state.isAuthenticated) next();
    else {
      store
        .dispatch('getUser')
        .then(() => next())
        .catch(() => next({ name: 'login' }));
    }
  } else if (to.matched.some(route => route.meta?.adminOnly)) {
    if (store.state.user?.admin) next();
    else {
      store
        .dispatch('getUser')
        .then(() => {
          if (store.state.user?.admin) next();
          else next({ name: 'welcome' });
        })
        .catch(() => next({ name: 'welcome' }));
    }
  } else {
    next();
  }
});

export default router;
