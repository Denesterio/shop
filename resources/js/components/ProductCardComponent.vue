<template>
  <article class="item m-3 border-right-0" :class="{ card: type === 'card' }">
    <div v-if="type === 'card'" class="row">
      <div
        class="
          col-lg-3 col-md-12
          d-flex
          align-items-center
          justify-content-center
        "
      >
        <img
          :src="picturePath"
          :alt="product.title"
          class="my-auto card-image"
        /><img />
      </div>
      <div class="col-lg-9 col-md-12">
        <div class="card border-0" style="height: 100%">
          <div
            class="authors mt-1 p-1 font-italic"
            v-html="formattedAuthorsHtml.join(' / ')"
          ></div>
          <div class="mx-2 p-2 mb-2">
            <h3>
              <a class="text-reset" :href="`/products/${product.id}`">{{
                product.title
              }}</a>
            </h3>
            <p>{{ formattedDescription }}</p>
          </div>
          <div class="card-footer bg-white">
            <addto-cart-button-component
              :title="product.title"
              :order-products="orderProducts"
              :product-id="product.id"
              size="sm"
              class="mt-2"
              :class="{ 'text-right': type === 'card' }"
            >
              <template v-slot:start>
                <span class="text-secondary"> {{ product.price }} руб. </span>
              </template>
            </addto-cart-button-component>
          </div>
        </div>
      </div>
    </div>

    <div v-else class="row">
      <div class="ms-2 me-auto">
        <p class="font-weight-bold mb-1 mt-3">
          <a class="text-reset" :href="`/products/${product.id}`">{{
            product.title
          }}</a>
          |
          <span
            class="font-italic font-weight-light"
            v-html="formattedAuthorsHtml.join(' / ')"
          ></span>
          |
          <span class="text-secondary"> {{ product.price }}&nbsp;руб. </span>
        </p>
        <addto-cart-button-component
          :title="product.title"
          :product-id="product.id"
          :order-products="orderProducts"
          class="mt-2"
        >
          <template v-slot:start>
            <button
              @click="isModalOpen = true"
              class="btn btn-outline-primary btn-sm ml-3"
            >
              Быстрый просмотр
            </button>
          </template>
        </addto-cart-button-component>
      </div>
    </div>

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
          class="mt-2"
          :class="{ 'text-right': type === 'card' }"
        >
          <template v-slot:start>
            <span class="text-secondary"> {{ product.price }} руб. </span>
          </template>
        </addto-cart-button-component>
      </template>
    </b-modal>
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
    type: {
      type: String,
      required: true,
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
    formattedDescription() {
      if (this.product.description.length > 140) {
        return this.product.description.slice(0, 140) + "\u2026";
      }
      return this.product.description;
    },

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
.item {
  min-width: 350px;
  font-size: 1rem;
}
.image-bg {
  background-color: #eef5fc;
}
.card-image {
  width: 95%;
  max-width: 300px;
  height: 96%;
  outline: 2px solid #000;
}
.font-size-point {
  font-size: 1.1rem;
}
.modal-image {
  width: 25%;
  float: left;
  margin-right: 20px;
}
.authors {
  font-size: 0.9rem;
}
</style>