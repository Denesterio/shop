<template>
  <div>
    <svg-loading-component v-if="loading" />
    <welcome-category-card-component
      v-else
      v-for="category in categories"
      :category="category"
      :key="category.id"
    >
    </welcome-category-card-component>
  </div>
</template>

<script>
import WelcomeCategoryCardComponent from "./WelcomeCategoryCardComponent.vue";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
import { getCategories } from "../../api/get.js";

export default {
  components: { WelcomeCategoryCardComponent, SvgLoadingComponent },
  data() {
    return {
      categories: [],
      loading: true,
    };
  },

  created() {
    getCategories()
      .then(({ data }) => (this.categories = data))
      .finally(() => (this.loading = false));
  },
};
</script>
