<template>
  <div class="container-xl mt-4">
    <div class="row">
      <aside ref="menu" class="menu col-md-3">
        <svg-loading-component v-if="loading" />
        <left-menu-component
          v-else-if="showMenu"
          :categories="categories"
          :subcategories="subcategories"
        ></left-menu-component>
      </aside>
      <main :class="showMenu ? 'col-md-9' : 'col-md-12'">
        <svg-loading-component v-if="loading" />
        <router-view :categories="categories" v-else></router-view>
      </main>
    </div>

    <carousel-component></carousel-component>
  </div>
</template>

<script>
import CarouselComponent from "./CarouselComponent.vue";
import LeftMenuComponent from "./LeftMenuComponent.vue";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
import { getMenu } from "../../api/get.js";
export default {
  components: {
    CarouselComponent,
    LeftMenuComponent,
    SvgLoadingComponent,
  },
  data() {
    return {
      categories: [],
      subcategories: [],
      loading: true,
      menuWidth: null,
    };
  },

  computed: {
    showMenu() {
      return this.menuWidth >= 250;
    },
  },

  created() {
    getMenu()
      .then(({ data }) => {
        this.categories = data.categories;
        this.subcategories = data.subcategories;
      })
      .finally(() => (this.loading = false));
    window.addEventListener("resize", this.watchMenu);
  },

  mounted() {
    this.menuWidth = this.$refs.menu.offsetWidth;
  },

  beforeUnmount() {
    window.removeEventListener("resize", this.watchMenu);
  },

  methods: {
    watchMenu() {
      this.menuWidth = this.$refs.menu.offsetWidth;
    },
  },
};
</script>

<style scoped>
/* .menu {
  min-width: 250px;
} */
</style>