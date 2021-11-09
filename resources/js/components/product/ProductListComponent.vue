<template>
  <div>
    <products-view-settings
      :selectedView.sync="selectedView"
      :countOnPage.sync="countOnPage"
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

  if (name === "search") {
    const params = {
      limit: 12,
      page: vm?.nextPage || 1,
      query: to.query.query,
      type: to.query.type,
    };
    return new RequestBuilder(name).withQueryParams(params).get();
  }

  if (vm) {
    const params = {
      limit: parseInt(vm.$data.countOnPage, 10),
      page: vm.$data.nextPage,
    };
    return new RequestBuilder(name).withQueryParams(params).get(id);
  }

  return new RequestBuilder(name)
    .withQueryParams({ limit: 12, page: 1 })
    .get(id);
};

export default {
  components: {
    ProductCardComponent,
    ProductPointComponent,
    ProductsViewSettings,
    BasePagination,
  },
  // data: countOnPage, currentPage, nextPage, totalPages
  // method fillDataFromResponse(response.data, field)
  mixins: [paginationSettings],
  data() {
    return {
      selectedView: "",

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
        this.products = data.data || [];
        this.totalPages = data.total;
      })
      .finally(() => (this.loading = false));
    next();
  },

  beforeRouteEnter(to, _from, next) {
    makeRequest(to)
      .then((data) =>
        next((vm) => {
          vm.products = data.data || [];
          vm.totalPages = data.total;
          vm.loading = false;
        })
      )
      .catch((err) => {
        alert(err);
      });
  },

  mounted() {
    const view = sessionStorage.getItem("selectedView");
    if (view) {
      this.selectedView = view;
    } else {
      this.selectedView = "Card";
    }
  },

  methods: {
    changePage(nextPage) {
      this.loading = true;
      this.nextPage = nextPage;
      makeRequest(this.$route, this)
        .then((data) => {
          this.fillDataFromResponse(data, "products");
        })
        .catch((error) => (this.error = error.response.data.message))
        .finally(() => (this.loading = false));
    },
  },

  watch: {
    countOnPage() {
      this.loading = true;
      makeRequest(this.$route, this)
        .then((data) => this.fillDataFromResponse(data, "products"))
        .finally(() => (this.loading = false));
    },

    selectedView(newValue) {
      sessionStorage.setItem("selectedView", newValue);
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
