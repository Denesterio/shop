<template>
  <div>
    <b-form-group label="Отбразить товары" v-slot="{ ariaDescribedby }">
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
    <ul class="product-list" v-if='products.length'>
      <li>
        <product-card-component
          v-for="product in products"
          :type="selectedView"
          :product="product"
          :key="product.id"
          :orderProducts="orderProducts"
          :tags="tags.filter((tag) => tag['product_id'] === product.id)"
          :authors="authors[product.id]"
        >
        </product-card-component>
      </li>
    </ul>
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
    data() {
      return {
        selectedView: 'card',
        optionsView: [
          { text: 'Карточками', value: 'card' },
          { text: 'Списком', value: 'point' },
        ],
      };
    },

    computed: {
      currentComponent() {
        return `product-${this.component}-component`;
      }
    }
  };
</script>

<style scoped>
  .product-list {
    margin: 0;
    padding: 0;
    list-style: none;
  }
</style>
