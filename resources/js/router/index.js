import Vue from 'vue';
import VueRouter from 'vue-router';
import store from '../store';

Vue.use(VueRouter);

// auth pages
const LoginComponent = () => import('../components/auth/LoginComponent.vue');
const RegisterComponent = () =>
  import('../components/auth/RegisterComponent.vue');
// main layout
import LayoutComponent from '../components/welcome/LayoutComponent.vue';
import WelcomeCategoryListComponent from '../components/welcome/WelcomeCategoryListComponent.vue';
import ProductListComponent from '../components/product/ProductListComponent.vue';
// functional
const CartComponent = () => import('../components/CartComponent.vue');
const ProfileComponent = () =>
  import('../components/profile/ProfileComponent.vue');
const ProductPageComponent = () =>
  import('../components/product/ProductPageComponent.vue');
// admin page
const AdminLayoutComponent = () =>
  import('../components/admin/AdminLayoutComponent.vue');
// 404
import PageNotFoundComponent from '../components/PageNotFoundComponent.vue';

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
        name: 'category.show',
        component: ProductListComponent
      },
      {
        path: '/subcategories/:id',
        name: 'subcategory.show',
        component: ProductListComponent
      },
      {
        path: '/authors/:id',
        name: 'author.show',
        component: ProductListComponent
      },
      {
        path: '/tags/:id',
        name: 'tag.show',
        component: ProductListComponent
      },
      {
        path: '/search',
        name: 'search.products',
        component: ProductListComponent
      }
    ]
  },
  {
    path: '/admin',
    component: AdminLayoutComponent,
    name: 'admin'
    // meta: {
    //   adminOnly: true
    // }
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
    name: 'product.show',
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
