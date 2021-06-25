<template>
  <div>
    <div v-if='products.length'>
      <product-card-component
        v-for="product in products"
        :product="product"
        :key="product.id"
        :orderProducts="orderProducts"
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
    props: ['products', 'orderProducts'],
    components: { ProductCardComponent },
  };
</script>
