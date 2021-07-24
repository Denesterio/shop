<template>
  <article class="card m-1 p-2 col-lg-3 col-sm-6 product-card">
    <div>
      <img
        :src="picturePath"
        class="card-img-top card-image"
        :alt="product.title"
      />
    </div>
    <div class="card-body p-2">
      <h5 class="card-title my-2">{{ product.title }}</h5>
      <p
        class="card-text authors font-italic"
        v-html="formattedAuthorsHtml.join(' / ')"
      ></p>
    </div>

    <addto-cart-button-component
      :title="product.title"
      :order-products="orderProducts"
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
  </article>
</template>

<script>
import AddtoCartButtonComponent from "./AddtoCartButtonComponent.vue";
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
    orderProducts: {
      type: Array,
      required: false,
      default: () => [],
    },
  },

  components: { AddtoCartButtonComponent },

  computed: {
    formattedAuthorsHtml() {
      return this.authors.map(
        (author) =>
          `<a class="text-muted" href="/authors/${author.id}">${author.title}</a>`
      );
    },

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
}
.card-image {
  max-width: 200px;
  aspect-ratio: auto;
}
.card-title,
.product-price {
  font-size: 1rem;
}
.modal-image {
  width: 25%;
  float: left;
  margin-right: 20px;
}
.authors {
  font-size: 0.8rem;
}
.authors::before {
  content: "";
  display: block;
  height: 1px;
  background: #ccc;
  margin: 5px 10px;
}
.product-price {
  font-weight: bold;
}
</style>