<template>
  <nav
    class="
      navbar navbar-expand-md navbar-light
      bg-white
      shadow
      border-bottom border-info
    "
  >
    <div class="container">
      <router-link
        class="logo-text"
        :to="{ name: 'welcome' }"
        aria-label="на главную"
        >BOOKSHOP</router-link
      >

      <input v-model="isMenuOpen" type="checkbox" id="burger-menu-switcher" />
      <label for="burger-menu-switcher" class="burger-menu d-md-none">
        <span class="burger-menu-span"></span>
        <span class="burger-menu-span"></span>
        <span class="burger-menu-span"></span>
      </label>

      <div class="burger-nav">
        <ul @click="isMenuOpen = false" class="burger-menu-list">
          <template v-if="user">
            <li class="nav-item">
              <router-link :to="{ name: 'cart' }"
                >корзина ({{ cartProductsQuantity }})</router-link
              >
            </li>
            <li class="nav-item">
              <router-link
                v-if="isUserAdmin"
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

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <!-- Left Side Of Navbar -->
        <ul class="left navbar-nav mr-auto"></ul>

        <!-- Right Side Of Navbar -->
        <ul class="right navbar-nav ml-auto">
          <li>
            <router-link
              :to="{ name: 'admin' }"
              class="nav-link text-center"
              v-t="'label.productAdd'"
            ></router-link>
          </li>
          <template v-if="user">
            <li class="nav-item p-1">
              <router-link class="nav-link p-0" :to="{ name: 'cart' }"
                ><svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="34"
                  height="34"
                  fill="currentColor"
                  class="bi bi-cart2"
                  viewBox="0 0 16 16"
                >
                  <path
                    d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"
                  /></svg
                ><sup class="label">{{
                  cartProductsQuantity
                }}</sup></router-link
              >
            </li>
            <li class="nav-item dropdown p-2">
              <a
                class="nav-link dropdown-toggle p-0"
                id="navbarDropdown"
                data-toggle="dropdown"
                href=""
                noreferrer
                nofollow
                @mouseover="showUsernameTooltip = true"
                @mouseout="showUsernameTooltip = false"
                @click="showUsernameTooltip = false"
              >
                <svg
                  id="user"
                  xmlns="http://www.w3.org/2000/svg"
                  width="34"
                  height="34"
                  fill="currentColor"
                  class="bi bi-person"
                  viewBox="0 0 16 16"
                >
                  <path
                    d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"
                  />
                </svg>
              </a>
              <base-tooltip-component
                v-show="showUsernameTooltip"
                ref="tooltip"
                :text="user.name"
              />
              <div
                class="dropdown-menu dropdown-menu-right"
                aria-labelledby="navbarDropdown"
              >
                <router-link
                  :to="{ name: 'profile' }"
                  class="dropdown-item nav-link text-center"
                  >{{ $t("link.profile") }}</router-link
                >
                <button
                  @click="logout"
                  class="btn btn-link dropdown-item nav-link text-center"
                >
                  Выход
                </button>
              </div>
            </li>
          </template>
          <template v-else>
            <!-- Authentication Links -->
            <li class="nav-item">
              <a @click.prevent="moveToLogin" class="nav-link" href=""
                >Авторизация</a
              >
            </li>
            <li class="nav-item">
              <router-link class="nav-link" :to="{ name: 'register' }"
                >Регистрация</router-link
              >
            </li>
          </template>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
import RequestBuilder from "../api/requestBuilder.js";
import BaseTooltipComponent from "./BaseTooltipComponent.vue";
export default {
  props: {
    appName: {
      type: String,
      required: true,
    },
  },

  components: { BaseTooltipComponent },

  data() {
    return {
      showUsernameTooltip: false,
      isMenuOpen: false,
    };
  },

  computed: {
    isUserAdmin() {
      return this.user?.admin === 1;
    },
    user() {
      return this.$store.state.user;
    },
    cartProductsQuantity() {
      return this.$store.getters.cartProductsQuantity;
    },
  },

  methods: {
    logout() {
      new RequestBuilder("logout").get().then(() => {
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
    makeItemActive(event) {
      this.activeItem = event.currentTarget;
    },
    makeItemInactive() {
      this.activeItem = null;
    },
  },

  created() {
    this.$store.dispatch("getUser");
  },
};
</script>

<style scoped>
a:hover {
  color: #3490dc;
}
.dropdown-item {
  color: rgba(0, 0, 0, 0.5);
}

.dropdown-item:hover {
  color: rgba(0, 0, 0, 0.7);
}

.nav-link {
  color: #5c5c5c;
}
</style>