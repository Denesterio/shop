import Vue from 'vue';
import VueRouter from 'vue-router';
import store from '../store';

Vue.use(VueRouter);

// auth pages
import LoginComponent from '../auth/LoginComponent.vue';
import RegisterComponent from '../auth/RegisterComponent.vue';
// main layout
import LayoutComponent from '../welcome/LayoutComponent.vue';
import WelcomeCategoryListComponent from '../welcome/WelcomeCategoryListComponent.vue';
import ProductListComponent from '../ProductListComponent.vue';
// functional
import CartComponent from '../CartComponent.vue';
import ProfileComponent from '../profile/ProfileComponent.vue';
import ProductPageComponent from '../ProductPageComponent.vue';
// admin page
import AdminLayoutComponent from '../admin/AdminLayoutComponent.vue';
// 404
import PageNotFoundComponent from '../PageNotFoundComponent.vue';

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
      },
      {
        path: '/tags/:id',
        name: 'tagProducts',
        component: ProductListComponent
      }
    ]
  },
  {
    path: '/admin',
    component: AdminLayoutComponent,
    name: 'admin',
    meta: {
      adminOnly: true
    }
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
