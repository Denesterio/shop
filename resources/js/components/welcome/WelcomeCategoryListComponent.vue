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

export default {
  props: {
    categories: {
      type: Array,
      required: true,
    },
  },
  components: { WelcomeCategoryCardComponent, SvgLoadingComponent },
  computed: {
    loading() {
      return this.categories.length === 0;
    },
  },
};
</script>
