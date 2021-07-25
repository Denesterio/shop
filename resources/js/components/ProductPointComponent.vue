<template>
  <li class="col-sm-12">
    <p class="point font-weight-bold mb-1 mt-3">
      <a class="text-reset" :href="`/products/${product.id}`">{{
        product.title
      }}</a>
      |
      <span
        class="font-italic font-weight-light"
        v-html="formattedAuthorsHtml.join(' / ')"
      ></span>
      |&nbsp;<span class="text-secondary">{{ product.price }}&nbsp;руб. </span>
    </p>
    <addto-cart-button-component
      :title="product.title"
      :product-id="product.id"
      :order-products="orderProducts"
      class="align-items-start"
    >
      <template v-slot:start>
        <button
          @click="isModalOpen = true"
          class="btn btn-outline-primary btn-sm mx-3 in-cart-buttons"
        >
          Быстрый просмотр
        </button>
      </template>
    </addto-cart-button-component>
    <b-modal
      v-model="isModalOpen"
      centered
      id="modal-lg"
      size="lg"
      :title="product.title"
      hide-backdrop
      content-class="shadow"
    >
      <img :src="picturePath" :alt="product.title" class="modal-image" />
      {{ product.description }}
      <template v-slot:modal-footer>
        <addto-cart-button-component
          :title="product.title"
          :product-id="product.id"
          :order-products="orderProducts"
          :size="'md'"
          style="width: 240px"
          class="justify-content-between mr-3"
        >
          <template v-slot:start>
            <span class="text-secondary font-weight-bold product-price">
              {{ product.price }}&nbsp;&#8381;
            </span>
          </template>
        </addto-cart-button-component>
      </template>
    </b-modal>
  </li>
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

  data() {
    return {
      isModalOpen: false,
      showAlert: false,
    };
  },

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
.point {
  font-size: 1.1rem;
  line-height: 1.5;
}
.modal-image {
  width: 25%;
  float: left;
  margin-right: 20px;
}
.product-price {
  font-size: 1.4rem;
}
</style>