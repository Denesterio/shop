<template>
  <li class="card m-1 p-2 col-lg-3 col-sm-6 product-card">
    <div class="image-box d-flex justify-content-center align-items-center">
      <img
        :src="picturePath"
        class="card-img-top"
        :class="{
          'card-imgage': product.picture.length > 0,
          'card-cap': product.picture.length === 0,
        }"
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
        : "/img/cap.svg";
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
.image-box {
  height: fit-content;
  min-height: 200px;
  max-width: 200px;
}
.card-cap {
  width: 50%;
  height: auto;
}
.card-image {
  height: auto;
  width: 90%;
}
.product-price {
  font-weight: bold;
}
</style>