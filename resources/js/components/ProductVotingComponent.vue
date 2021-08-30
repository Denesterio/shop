<template>
  <form @submit.prevent="send" class="rating-group" ref="form">
    <input
      v-model="rating"
      class="rating-input"
      type="radio"
      name="book-rating"
      id="book-rating-1"
      value="1"
      @click="send"
    />
    <label class="rating-star" for="book-rating-1" aria-label="1 из 5"></label>

    <input
      v-model="rating"
      class="rating-input"
      type="radio"
      name="book-rating"
      id="book-rating-2"
      value="2"
      @click="send"
    />
    <label class="rating-star" for="book-rating-2" aria-label="2 из 5"></label>

    <input
      v-model="rating"
      class="rating-input"
      type="radio"
      name="book-rating"
      id="book-rating-3"
      value="3"
      @click="send"
    />
    <label class="rating-star" for="book-rating-3" aria-label="3 из 5"></label>

    <input
      v-model="rating"
      class="rating-input"
      type="radio"
      name="book-rating"
      id="book-rating-4"
      value="4"
      @click="send"
    />
    <label class="rating-star" for="book-rating-4" aria-label="4 из 5"></label>

    <input
      v-model="rating"
      class="rating-input"
      type="radio"
      name="book-rating"
      id="book-rating-5"
      value="5"
      @click="send"
    />
    <label class="rating-star" for="book-rating-5" aria-label="5 из 5"></label>

    <input type="submit" class="rating-input" tabindex="-1" />

    <div class="rating-focus"></div>
  </form>
</template>

<script>
import { sendRating } from "../api/create.js";
export default {
  props: {
    productId: {
      type: Number,
      required: true,
    },
  },

  data() {
    return {
      rating: 0,
    };
  },

  mounted() {
    this.$refs.form.firstElementChild.focus();
  },

  methods: {
    send(event) {
      if (event.type === "click" && event.x === 0) return;
      if (event.type === "submit" && this.rating === 0) return;
      const rating = event.type === "submit" ? this.rating : event.target.value;
      const params = {
        product_id: this.productId,
        rating,
      };
      sendRating(params).then(() => {
        this.$emit("closeVoting", Number.parseInt(rating));
      });
    },
  },
};
</script>

<style scoped>
.rating {
  margin: 0 0 0.1rem 0;
  padding: 0;
  border: none;
}

/* Group */

.rating-group {
  padding: 0;
  position: relative;
  width: 100px;
  height: 20px;
  background-image: url("data:image/svg+xml, %3Csvg xmlns='http://www.w3.org/2000/svg' height='20' width='20' class='star rating'%3E%3Cpolygon points='9.9, 1.1, 3.3, 21.78, 19.8, 8.58, 0, 8.58, 16.5, 21.78'/%3E%3C/svg%3E");
  background-size: 20px 20px;
  background-repeat: repeat-x;
}

/* Input */

.rating-input {
  position: absolute;
  width: 1px;
  height: 1px;
  overflow: hidden;
  clip: rect(0 0 0 0);
}

.rating-input:focus ~ .rating-focus {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: -1;
  outline: 0.2rem solid #3490dc;
  outline-offset: 0.2rem;
}

/* Star */

.rating-star {
  position: absolute;
  top: 0;
  left: 0;
  margin: 0;
  height: 20px;
  background-size: 20px 20px;
  background-repeat: repeat-x;
}

.rating-star:hover,
.rating-input:checked + .rating-star {
  background-image: url("data:image/svg+xml, %3Csvg xmlns='http://www.w3.org/2000/svg' height='20' width='20' class='star rating'%3E%3Cpolygon points='9.9, 1.1, 3.3, 21.78, 19.8, 8.58, 0, 8.58, 16.5, 21.78' fill='%23FFD700'/%3E%3C/svg%3E");
}

.rating-star:hover ~ .rating-star {
  background-image: url("data:image/svg+xml, %3Csvg xmlns='http://www.w3.org/2000/svg' height='20' width='20' class='star rating'%3E%3Cpolygon points='9.9, 1.1, 3.3, 21.78, 19.8, 8.58, 0, 8.58, 16.5, 21.78'/%3E%3C/svg%3E");
}

/* Options */

.rating-star:nth-of-type(1) {
  z-index: 5;
  width: 20px;
}

.rating-star:nth-of-type(2) {
  z-index: 4;
  width: 40px;
}

.rating-star:nth-of-type(3) {
  z-index: 3;
  width: 60px;
}

.rating-star:nth-of-type(4) {
  z-index: 2;
  width: 80px;
}

.rating-star:nth-of-type(5) {
  z-index: 1;
  width: 100px;
}
</style>