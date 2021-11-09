<template>
  <li class="col-sm-12">
    <p class="point font-weight-bold mb-1 mt-3">
      <router-link
        class="text-reset"
        :to="{ name: 'product.show', params: { id: product.id } }"
        >{{ product.title }}</router-link
      >
      |
      <authors-link
        link-class="font-italic font-weight-light text-reset"
        :authors="product.authors"
      />
      |&nbsp;<span class="text-secondary">{{ product.price }}&nbsp;руб. </span>
    </p>
    <addto-cart-button-component
      :title="product.title"
      :product-id="product.id"
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

    <!-- modal window -->
    <b-modal
      v-model="isModalOpen"
      centered
      id="modal-lg"
      size="lg"
      :title="`${product.title} (${product.authors
        .map((a) => a.title)
        .join(', ')})`"
      hide-backdrop
      content-class="shadow"
    >
      <!-- modal-body -->
      <product-rating-component :productId="product.id" />

      <div class="row mb-3">
        <div class="col-6 d-flex justify-content-center align-items-center">
          <img :src="picturePath" :alt="product.title" class="modal-image" />
        </div>
        <div class="col-6"><product-properties-table :product="product" /></div>
      </div>
      <div class="mt-3 p-2 base-description">
        {{ product.description }}
      </div>
      <!-- modal-footer -->
      <template v-slot:modal-footer>
        <addto-cart-button-component
          :title="product.title"
          :product-id="product.id"
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
import AddtoCartButtonComponent from "../AddtoCartButtonComponent.vue";
import AuthorsLink from "./AuthorsLink.vue";
import ProductRatingComponent from "./ProductRatingComponent.vue";
import ProductPropertiesTable from "./ProductPropertiesTable.vue";
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
  },

  components: {
    AddtoCartButtonComponent,
    AuthorsLink,
    ProductRatingComponent,
    ProductPropertiesTable,
  },

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
        : "/img/cap.svg";
    },
  },
};
</script>
<style scoped>
.point {
  font-size: 1.1rem;
  line-height: 1.5;
}
.product-price {
  font-size: 1.4rem;
}
.modal-image {
  width: 50%;
}
</style>