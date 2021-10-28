<template>
  <div class="container-xl mt-4">
    <div class="row">
      <aside class="col-lg-3 col-md-4" :class="{ error: 'text-center' }">
        <svg-loading-component v-if="loading" />
        <span class="d-block mt-4" v-else-if="error">{{ error }}</span>
        <left-menu-component
          v-else
          :categories="categories"
          :subcategories="subcategories"
        ></left-menu-component>
        <search-form-component />
      </aside>
      <main class="col-lg-9 col-md-7 col-sm-12">
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
import SearchFormComponent from "./SearchFormComponent.vue";
import RequestBuilder from "../../api/requestBuilder.js";
export default {
  components: {
    CarouselComponent,
    LeftMenuComponent,
    SearchFormComponent,
  },
  data() {
    return {
      categories: [],
      subcategories: [],
      loading: true,
      error: "",
    };
  },

  created() {
    new RequestBuilder("menu")
      .get()
      .then((data) => {
        this.categories = data.categories;
        this.subcategories = data.subcategories;
        sessionStorage.setItem("menu", JSON.stringify(data));
      })
      .catch((err) => {
        this.error = err.response.data.message;
      })
      .finally(() => (this.loading = false));
  },
};
</script>
