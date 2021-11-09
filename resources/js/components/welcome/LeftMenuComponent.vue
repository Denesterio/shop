<template>
  <div class="accordion" role="tablist">
    <b-card
      v-for="category in categories"
      :key="category.id"
      no-body
      class="mb-1"
    >
      <b-card-header header-tag="header" class="p-1" role="tab">
        <b-button block v-b-toggle="`accordion` + category.id" variant="info">
          <router-link
            :to="{ name: 'category.show', params: { id: category.id } }"
            >{{ category.title }}</router-link
          >
        </b-button>
      </b-card-header>
      <b-collapse
        :id="`accordion` + category.id"
        accordion="my-accordion"
        role="tabpanel"
        :visible="isOpen(category.id)"
      >
        <b-card-body>
          <div
            class="list-group list-group-flush"
            v-if="
              subcategories.filter(
                (subcat) => subcat['category_id'] === category.id
              ).length > 0
            "
          >
            <router-link
              class="list-group-item list-group-item-action"
              :class="{ active: isActive(subcategory.slug) }"
              v-for="subcategory in subcategories.filter(
                (subcat) => subcat['category_id'] === category.id
              )"
              :key="subcategory.id"
              :to="{
                name: 'subcategory.show',
                params: { id: subcategory.slug },
              }"
            >
              {{ subcategory.title }}
            </router-link>
          </div>
          <div v-else class="list-group list-group-flush">
            <router-link
              class="list-group-item list-group-item-action"
              :class="{ active: isOpen(category.id) }"
              :to="{ name: 'category.show', params: { id: category.id } }"
            >
              {{ category.title }}
            </router-link>
          </div>
        </b-card-body>
      </b-collapse>
    </b-card>
  </div>
</template>

<script>
export default {
  props: {
    categories: {
      type: Array,
      required: true,
    },
    subcategories: {
      type: Array,
      required: true,
    },
  },

  computed: {
    currentPageId() {
      return this.$route.params.id;
    },
    isCategoryPage() {
      return this.$route.name === "category.show";
    },
    isSubcategoryPage() {
      return this.$route.name === "subcategory.show";
    },
  },

  methods: {
    isOpen(id) {
      if (this.isCategoryPage) {
        return parseInt(this.currentPageId) === id;
      }
      if (this.isSubcategoryPage) {
        return (
          this.subcategories.find((sub) => sub.slug === this.currentPageId)[
            "category_id"
          ] === id
        );
      }
      return id === this.categories[0].id;
    },

    isActive(slug) {
      return this.currentPageId === slug;
    },
  },
};
</script>

<style scoped>
.active {
  background-color: #c8e2f8;
  color: #03437a;
}
a {
  color: #333333;
}
a:hover {
  text-decoration: underline;
}
</style>
