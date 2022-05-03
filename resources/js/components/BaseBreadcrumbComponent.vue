<template>
  <b-breadcrumb class="crumbs" :items="items"></b-breadcrumb>
</template>

<script>
import requestBuilder from '../api/requestBuilder.js';
import SessionStorageService from '../services/sessionStorageService.js';
export default {
  props: {
    slug: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
  },

  data() {
    return {
      items: [],
    };
  },

  created() {
    new SessionStorageService(requestBuilder).asyncGet('menu')
      .then(result => {
        const subcat = result.subcategories.find((s) => s.slug === this.slug);
        const cat = result.categories.find((c) => c.id === subcat.category_id);
        this.items = [
          {
            text: "Главная",
            href: "/",
          },
          {
            text: cat.title,
            href: `/categories/${cat.id}`,
          },
          {
            text: subcat.title,
            href: `/subcategories/${this.slug}`,
          },
          {
            text: this.title,
            active: true,
          },
        ]
      });
  },
};
</script>

<style scoped>
.crumbs {
  font-size: 0.9rem;
  background-color: #f8fafc;
}
</style>