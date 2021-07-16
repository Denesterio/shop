<template>
  <div>
    <b-form-group label="Отобразить товары" v-slot="{ ariaDescribedby }">
      <b-form-radio-group
        id="btn-radios-1"
        v-model="selectedView"
        :options="optionsView"
        :aria-describedby="ariaDescribedby"
        name="radio-btn-outline"
        button-variant="outline-primary"
        buttons
        size="sm"
      ></b-form-radio-group>
    </b-form-group>
    <ul class="product-list" v-if="products.length">
      <li>
        <product-card-component
          v-for="product in products"
          :type="selectedView"
          :product="product"
          :order-products="orderProducts"
          :key="product.id"
          :authors="authors[product.id]"
        >
        </product-card-component>
      </li>
    </ul>
    <div v-else class="text-center p-3">
      <h5>В данной категории товаров пока нет, но они обязательно появятся</h5>
    </div>
  </div>
</template>

<script>
import ProductCardComponent from "./ProductCardComponent.vue";
import { getProductsByType } from "../api/get";
const makeRequest = (to) => {
  const id = to.params.id;
  const types = ["categories", "subcategories", "authors"];
  const type = to.path.split("/").find((type) => types.includes(type));
  return getProductsByType(type, id);
};
export default {
  components: { ProductCardComponent },
  data() {
    return {
      selectedView: "card",
      optionsView: [
        { text: "Карточками", value: "card" },
        { text: "Списком", value: "point" },
      ],

      products: [],
      authors: {},
      loading: true,
    };
  },

  computed: {
    user() {
      return this.$store.state.user;
    },
    orderProducts() {
      return this.$store.state.cartProducts;
    },
  },

  beforeRouteUpdate(to, from, next) {
    makeRequest(to)
      .then(({ data }) => {
        this.fillData(this, data);
      })
      .finally(() => (this.loading = false));
    next();
  },

  beforeRouteEnter(to, _from, next) {
    makeRequest(to)
      .then(({ data }) =>
        next((vm) => {
          vm.fillData(vm, data);
          vm.loading = false;
        })
      )
      .catch((err) => {
        alert(err);
      });
  },

  methods: {
    fillData(target, source) {
      target.products = source.products;
      target.authors = source.authors;
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
</style>
