<template>
  <div>
    <product-component
      v-for="product in products"
      :product="product"
      :key="product.id"
      :orderProducts="orderProducts"
    >
    </product-component>
  </div>
</template>

<script>
  import ProductComponent from './ProductComponent.vue';
  import { getOrders } from '../api/get.js';
  export default {
    props: ['products'],
    components: { ProductComponent },
    data() {
      return {
        orderProducts: [],
      };
    },
    mounted() {
      getOrders().then((data) => {
        this.orderProducts = data.orders;
      });
    },
  };
</script>
