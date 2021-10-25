<template>
  <li class="card m-1 p-2 col-lg-3 col-sm-6 product-card">
    <div>
      <img
        :src="picturePath"
        class="card-img-top card-image"
        :alt="product.title"
      />
    </div>

    <product-title-component
      :product="product"
      :authors="authors"
      class="card-body p-2"
    />

    <addto-cart-button-component
      :title="product.title"
      :product-id="product.id"
      size="sm"
      class="card-footer justify-content-between"
    >
      <template v-slot:start>
        <div class="text-secondary product-price">
          {{ product.price }}&nbsp;&#8381;
        </div>
      </template>
    </addto-cart-button-component>
  </li>
</template>

<script>
import AddtoCartButtonComponent from "../AddtoCartButtonComponent.vue";
import ProductTitleComponent from "./ProductTitleComponent.vue";
export default {
  props: {
    product: {
      type: Object,
      required: true,
    },
    authors: {
      type: Array,
      required: false,
      default: () => [],
    },
  },

  components: { AddtoCartButtonComponent, ProductTitleComponent },

  computed: {
    picturePath() {
      return this.product.picture
        ? "/storage/img/" + this.product.picture
        : "/img/cap.png";
    },
  },
};
</script>

<style scoped>
.product-card {
  display: grid;
  grid-template-rows: auto 1fr auto;
  max-width: 205px;
  min-width: 190px;
}
.card-image {
  max-width: 200px;
  aspect-ratio: auto;
}
.modal-image {
  width: 25%;
  float: left;
  margin-right: 20px;
}
.product-price {
  font-weight: bold;
}
</style>