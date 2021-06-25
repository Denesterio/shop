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
  export default {
    props: ['products', 'orderProducts'],
    components: { ProductComponent },
  };
</script>
