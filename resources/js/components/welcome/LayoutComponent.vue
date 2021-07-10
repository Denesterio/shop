<template>
  <div class="container-xl mt-4">
    <div class="row">
      <aside class="col-md-3">
        <svg-loading-component v-if="loading" />
        <left-menu-component
          v-else
          :categories="categories"
          :subcategories="subcategories"
        ></left-menu-component>
      </aside>
      <main class="col-md-9">
        <router-view
          :categories="categories"
          :subcategories="subcategories"
        ></router-view>
      </main>
    </div>
    <svg-loading-component v-if="loading" />
    <section v-else class="mt-4">
      <h4>Новинки:</h4>
      <carousel-component
        :products="newProducts"
        :authors="authors"
      ></carousel-component>
    </section>
  </div>
</template>

<script>
import CarouselComponent from "./CarouselComponent.vue";
import LeftMenuComponent from "./LeftMenuComponent.vue";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
import {
  getCategories,
  getSubcategories,
  getNewProducts,
} from "../../api/get.js";
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
      newProducts: [],
      authors: [],
      loading: true,
    };
  },
  mounted() {
    const promises = [
      getNewProducts().then(({ data }) => {
        this.newProducts = data.products;
        this.authors = data.authors;
      }),
      getCategories().then(({ data }) => (this.categories = data)),
      getSubcategories().then(({ data }) => (this.subcategories = data)),
    ];
    Promise.all(promises).finally(() => (this.loading = false));
  },
};
</script>