<template>
  <div class="burger-nav">
    <ul class="burger-menu-list">
      <template v-if="userName.length">
        <li class="nav-item">
          <router-link :to="{ name: 'cart' }"
            >корзина ({{ cartProductsQuantity }})</router-link
          >
        </li>
        <li class="nav-item">
          <router-link
            v-if="isAdmin"
            :to="{ name: 'admin' }"
            v-t="'label.productAdd'"
          ></router-link>
        </li>
        <li>
          <router-link :to="{ name: 'profile' }">{{
            $t("link.profile")
          }}</router-link>
        </li>
        <li>
          <a noreferrer nofollow @click="logout"> Выход </a>
        </li>
      </template>
      <template v-else>
        <li>
          <a @click.prevent="moveToLogin" href="">Авторизация</a>
        </li>
        <li>
          <router-link :to="{ name: 'register' }">Регистрация</router-link>
        </li>
      </template>
    </ul>
  </div>
</template>

<script>
import { authLogout } from "../api/auth.js";
export default {
  props: {
    userName: {
      type: String,
      required: false,
      default: "",
    },
    isAdmin: {
      type: Boolean,
      required: false,
      default: false,
    },
    cartProductsQuantity: {
      type: Number,
      required: false,
      default: null,
    },
  },

  methods: {
    logout() {
      authLogout().then(() => {
        this.$store.dispatch("logout");
        if (this.$route.name !== "welcome") {
          this.$router.push({ name: "welcome" });
        }
      });
    },
    moveToLogin() {
      this.$router.push({
        name: "login",
        query: { redirect: this.$route.path },
      });
    },
  },
};
</script>