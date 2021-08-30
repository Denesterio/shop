<template>
  <b-breadcrumb class="crumbs" :items="items"></b-breadcrumb>
</template>

<script>
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

  computed: {
    items() {
      const menu = JSON.parse(sessionStorage.getItem("menu"));
      const subcat = menu.subcategories.find((s) => s.slug === this.slug);
      const cat = menu.categories.find((c) => c.id === subcat.category_id);
      return [
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
      ];
    },
  },
};
</script>

<style scoped>
.crumbs {
  font-size: 0.9rem;
  background-color: #f8fafc;
}
</style>