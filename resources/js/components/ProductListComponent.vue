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
  export default {
    props: ['products', 'orderProducts'],
    components: { ProductCardComponent },
  };
</script>
