<template>
  <div>
    <div v-if='products.length'>
      <product-card-component
        v-for="product in products"
        :product="product"
        :key="product.id"
        :orderProducts="orderProducts"
        :tags="tags.filter((tag) => tag['product_id'] === product.id)"
        :authors="authors[product.id]"
      >
      </product-card-component>
    </div>
    <div v-else class="text-center p-3">
      <h5>В данной категории товаров пока нет, но они обязательно появятся</h5>
    </div>
  </div>
</template>

<script>
  import ProductCardComponent from './ProductCardComponent.vue';
  export default {
    props: {
      products: {
        type: Array,
        required: true,
      },
      orderProducts: {
        type: Array,
        required: true,
      },
      tags: {
        type: Array,
        required: false,
        default: () => [],
      },
      authors: {
        type: Object,
        required: false,
        default: () => {},
      }
    },
    components: { ProductCardComponent },
  };
</script>
