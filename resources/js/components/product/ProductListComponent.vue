<template>
  <div>
    <products-view-settings
      :selectedView.sync="selectedView"
      :countOnPage.sync="countOnPage"
      :searchQuery.sync="searchQuery"
      :searchType.sync="searchType"
      @search-products="fetchSearchedProducts"
    />
    <div v-if="products.length">
      <ul class="row justify-content-evently">
        <component
          v-bind:is="currentComponent"
          v-for="product in products"
          :product="product"
          :key="product.id"
          :authors="product.authors"
        >
        </component>
      </ul>
      <BasePagination
        :current="currentPage"
        :total="totalPages"
        :onPage="countOnPage"
        @change-page="changePage"
      />
    </div>
    <div v-else class="text-center p-3">
      <h5 v-t="'message.noProductsInCategory'"></h5>
    </div>
  </div>
</template>

<script>
import ProductCardComponent from "./ProductCardComponent.vue";
import ProductPointComponent from "./ProductPointComponent.vue";
import ProductsViewSettings from "./ProductsViewSettings.vue";
import BasePagination from "../BasePagination.vue";
import RequestBuilder from "../../api/requestBuilder.js";
import paginationSettings from "../../mixins/paginationSettings.js";

const makeRequest = (to, vm) => {
  const id = to.params.id;
  const splitterIndex = to.name.indexOf(".");
  const name = to.name.substring(0, splitterIndex);
  if (vm) {
    const params = {
      limit: parseInt(vm.$data.countOnPage, 10),
      page: vm.$data.nextPage,
    };
    return new RequestBuilder(name).withQueryParams(params).get(id);
  }
  return new RequestBuilder(name)
    .withQueryParams({ limit: 24, page: 1 })
    .get(id);
};

export default {
  components: {
    ProductCardComponent,
    ProductPointComponent,
    ProductsViewSettings,
    BasePagination,
  },
  // mixins: [paginationSettings], // data field paginationSettings, method fillDataFromResponse(response.data)
  data() {
    return {
      selectedView: "Card",
      searchQuery: "",
      searchType: "title",

      countOnPage: "24",
      currentPage: 1,
      nextPage: null,
      totalPages: null,

      products: [],
      authors: {},
      loading: true,
      error: "",
    };
  },

  computed: {
    user() {
      return this.$store.state.user;
    },
    currentComponent() {
      return `Product${this.selectedView}Component`;
    },
  },

  beforeRouteUpdate(to, _from, next) {
    makeRequest(to)
      .then((data) => {
        this.products = data.products;
        this.totalPages = data.total;
      })
      .finally(() => (this.loading = false));
    next();
  },

  beforeRouteEnter(to, _from, next) {
    makeRequest(to)
      .then((data) =>
        next((vm) => {
          vm.products = data.products;
          vm.totalPages = data.total;
          vm.loading = false;
        })
      )
      .catch((err) => {
        alert(err);
      });
  },

  methods: {
    fetchSearchedProducts() {
      this.loading = true;
      const params = {
        limit: parseInt(this.countOnPage, 10),
        query: this.searchQuery,
        type: this.searchType,
      };
      new RequestBuilder("products")
        .withQueryParams(params)
        .get()
        .then(({ data }) => (this.products = data))
        .finally(() => (this.loading = false));
    },

    changePage(nextPage) {
      this.loading = true;
      this.nextPage = nextPage;
      makeRequest(this.$route, this)
        .then((data) => {
          this.products = data.products;
          this.totalPages = data.total;
          this.currentPage = nextPage;
        })
        .catch((error) => (this.error = error.response.data.message))
        .finally(() => (this.loading = false));
    },
  },

  watch: {
    countOnPage(newValue, oldValue) {
      this.loading = true;
      makeRequest(this.$route, this)
        .then((data) => this.fillDataFromResponse(data, "products"))
        .finally(() => (this.loading = false));
    },
  },
};
</script>

<style scoped>
.product-list {
  margin: 0;
  padding: 0;
  list-style: none;
}
ul {
  list-style: none;
  padding: 0;
}
</style>
