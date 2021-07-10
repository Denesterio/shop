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
      <router-link :to="{ name: 'welcome' }">{{ appName }}</router-link>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <!-- Left Side Of Navbar -->
        <ul class="navbar-nav mr-auto"></ul>

        <!-- Right Side Of Navbar -->
        <ul class="navbar-nav ml-auto">
          <template v-if="user">
            <li class="nav-item">
              <router-link class="nav-link" :to="{ name: 'cart' }"
                >Корзина</router-link
              >
            </li>

            <li class="nav-item dropdown">
              <a
                id="navbarDropdown"
                class="nav-link dropdown-toggle"
                href="#"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                {{ user.name }}
              </a>

              <div
                class="dropdown-menu dropdown-menu-right"
                aria-labelledby="navbarDropdown"
              >
                <router-link
                  v-if="isUserAdmin"
                  :to="{ name: 'products' }"
                  class="dropdown-item nav-link text-center"
                  >Добавить товар</router-link
                >
                <router-link
                  :to="{ name: 'profile' }"
                  class="dropdown-item nav-link text-center"
                >Личный кабинет</router-link>
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
              <router-link class="nav-link" to="/login"
                >Авторизация</router-link
              >
            </li>
            <li class="nav-item">
              <router-link class="nav-link" to="/register"
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
export default {
  props: {
    appName: {
      type: String,
      required: true,
    },
  },

  computed: {
    isUserAdmin() {
      return this.user?.admin === 1;
    },
    user() {
      return this.$store.state.user;
    },
  },

  methods: {
    logout() {
      axios.post("/api/auth/logout").then(() => {
        this.$store.dispatch("logout");
      });
    },
  },

  created() {
    this.$store.dispatch("getUser");
  },
};
</script>

<style scoped>
/* .dropdown-item {
  color: rgba(0, 0, 0, 0.5);
}
.dropdown-item:hover {
  color: rgba(0, 0, 0, 0.7);
} */
</style>