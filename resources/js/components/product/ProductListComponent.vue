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
    <ul class="row" v-if="products.length">
      <component
        v-bind:is="currentComponent"
        v-for="product in products"
        :product="product"
        :key="product.id"
        :authors="product.authors"
      >
      </component>
    </ul>
    <div v-else class="text-center p-3">
      <h5 v-t="'message.noProductsInCategory'"></h5>
    </div>
  </div>
</template>

<script>
import ProductCardComponent from "./ProductCardComponent.vue";
import ProductPointComponent from "./ProductPointComponent.vue";
import RequestBuilder from "../../api/requestBuilder.js";

const makeRequest = (to) => {
  const id = to.params.id;
  const splitterIndex = to.name.indexOf(".");
  const name = to.name.substring(0, splitterIndex);
  return new RequestBuilder(name).get(id);
};

export default {
  components: { ProductCardComponent, ProductPointComponent },
  data() {
    return {
      selectedView: "Card",
      optionsView: [
        { text: "Карточками", value: "Card" },
        { text: "Списком", value: "Point" },
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
    currentComponent() {
      return `Product${this.selectedView}Component`;
    },
  },

  beforeRouteUpdate(to, _from, next) {
    makeRequest(to)
      .then((data) => {
        this.products = data;
      })
      .finally(() => (this.loading = false));
    next();
  },

  beforeRouteEnter(to, _from, next) {
    makeRequest(to)
      .then((data) =>
        next((vm) => {
          vm.products = data;
          vm.loading = false;
        })
      )
      .catch((err) => {
        alert(err);
      });
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
