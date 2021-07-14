<template>
  <div class="accordion" role="tablist">
    <svg-loading-component v-if="loading" />
    <template v-else>
      <b-card
        v-for="category in categories"
        :key="category.id"
        no-body
        class="mb-1"
      >
        <b-card-header header-tag="header" class="p-1" role="tab">
          <b-button block v-b-toggle="`accordion` + category.id" variant="info">
            {{ category.title }}
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
                  name: 'subcategoryProducts',
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
                :to="{ name: 'categoryProducts', params: { id: category.id } }"
              >
                {{ category.title }}
              </router-link>
            </div>
          </b-card-body>
        </b-collapse>
      </b-card>
    </template>
  </div>
</template>

<script>
import { getCategories, getSubcategories } from "../../api/get.js";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
export default {
  components: { SvgLoadingComponent },
  data() {
    return {
      openedId: "",
      categories: [],
      subcategories: [],
      loading: true,
    };
  },

  created() {
    const promises = [
      getCategories().then(({ data }) => (this.categories = data)),
      getSubcategories().then(({ data }) => (this.subcategories = data)),
    ];
    Promise.all(promises).finally(() => (this.loading = false));
  },

  computed: {
    currentPage() {
      const path = this.$route.path;
      const [currentPage] = path.split("/").reverse();
      return (
        currentPage || String(Math.min(...this.categories.map((cat) => cat.id)))
      );
    },
    isCategoryPage() {
      return !Number.isNaN(parseInt(this.currentPage));
    },
  },

  methods: {
    isOpen(id) {
      if (this.isCategoryPage) {
        return this.currentPage === String(id);
      }
      const currentSubcategories = this.subcategories.filter(
        (sub) => sub["category_id"] === id
      );
      return !!currentSubcategories.find(
        (sub) => sub.slug === this.currentPage
      );
    },

    isActive(slug) {
      return this.currentPage === slug;
    },
  },
};
</script>

<style scoped href="../css/app.css"></style>
