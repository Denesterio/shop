<template>
    <main>
        <product-list-component
            :products='products'
            :order-products='orderProducts'
            :tags='tags'
            :authors='authors'
            >
        </product-list-component>
    </main>
</template>

<script>
  import ProductListComponent from './ProductListComponent.vue';
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

    components: { ProductListComponent },
  };
</script>