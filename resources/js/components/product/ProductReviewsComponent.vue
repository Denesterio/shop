<template>
  <section class="mb-4">
    <h4 class="d-inline-block">Отзывы</h4>
    ({{ reviews.length }})
    <p>
      <a v-if="canUserAddReview" href="#review-form">добавить отзыв</a>
      <span class="review-message" v-else-if="!user"
        >Только авторизованные пользователи могут оставлять отзывы</span
      >
    </p>
    <ul class="list-group">
      <li class="list-group-item" v-if="userReview">
        <details>
          <summary>Ваш отзыв:</summary>
          <product-review-component
            class="user-review p-3"
            :review="userReview"
          />
        </details>
      </li>
      <li
        is="product-review-component"
        class="list-group-item p-3"
        v-for="review in reviews"
        :key="review.id"
        :review="review"
      ></li>
    </ul>
    <product-review-form-component
      v-if="canUserAddReview"
      id="review-form"
      class="my-3"
      :productId="productId"
    />
  </section>
</template>

<script>
import ProductReviewComponent from "./ProductReviewComponent.vue";
import ProductReviewFormComponent from "./ProductReviewFormComponent.vue";
import RequestBuilder from "../../api/requestBuilder.js";
export default {
  components: { ProductReviewComponent, ProductReviewFormComponent },
  props: {
    productId: {
      type: Number,
      required: true,
    },
  },

  data() {
    return {
      reviews: [],
    };
  },

  created() {
    window.Echo.channel(`product-${this.productId}-review`).listen('.product.review', (data) => {
      console.dir(data);
      data.review.user = data.user;
      this.addReview(data.review);
    });
  },

  beforeDestroy() {
    window.Echo.leaveChannel(`product-${this.productId}-review`);
  },

  mounted() {
    new RequestBuilder("reviews").get(this.productId).then((data) => {
      this.reviews = data;
    });
  },

  computed: {
    user() {
      return this.$store.state.user;
    },

    userReview() {
      return this.reviews.find((rev) => rev.user_id === this.user?.id);
    },

    canUserAddReview() {
      return this.user && !this.userReview;
    },
  },

  methods: {
    addReview(review) {
      this.reviews = [review, ...this.reviews];
    },
  },
};
</script>>

<style scoped>
.review-message {
  font-size: 0.8rem;
  font-style: italic;
}
.user-review {
  list-style-type: none;
}
</style>