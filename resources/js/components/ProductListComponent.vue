<template>
  <div>
    <product-card-component
      v-for="product in products"
      :product="product"
      :key="product.id"
      :orderProducts="orderProducts"
    >
    </product-card-component>
  </div>
</template>

<script>
  import ProductCardComponent from './ProductCardComponent.vue';
  // import { getOrders } from '../api/get.js';
  export default {
    props: ['products', 'orderProducts'],
    components: { ProductCardComponent },

    mounted() {
      // getOrders().then((data) => {
      //   this.orderProducts = data.orders;
      // });
    },
  };
</script>
