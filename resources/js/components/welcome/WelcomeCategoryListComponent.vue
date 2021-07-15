<template>
  <article>
    <welcome-category-card-component
      v-for="category in categories"
      :category="category"
      :key="category.id"
    >
    </welcome-category-card-component>
  </article>
</template>

<script>
import WelcomeCategoryCardComponent from "./WelcomeCategoryCardComponent.vue";

export default {
  props: {
    categories: {
      type: Array,
      required: true,
    },
  },

  components: { WelcomeCategoryCardComponent },
};
</script>
