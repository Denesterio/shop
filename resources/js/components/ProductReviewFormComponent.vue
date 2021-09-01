<template>
  <form @submit.prevent="addReview">
    <svg-loading-component v-if="processing" />
    <template v-else>
      <div class="input-group">
        <span class="input-group-text">Текст отзыва</span>
        <textarea
          v-model="reviewBody"
          class="form-control"
          aria-label="Текст отзыва"
          aria-describedby="reviewHelpBlock"
        ></textarea>
      </div>
      <div
        id="reviewHelpBlock"
        class="form-text"
        v-t="'message.reviewHelpBlock'"
      ></div>
      <button type="submit" class="btn btn-primary mt-3">Отправить</button>
    </template>
  </form>
</template>

<script>
import RequestBuilder from "../api";
export default {
  props: {
    productId: {
      type: Number,
      required: true,
    },
  },

  data() {
    return {
      reviewBody: "",
      processing: false,
    };
  },

  methods: {
    addReview() {
      if (this.reviewBody.length < 10) return;
      const params = {
        product_id: this.productId,
        review: this.reviewBody,
      };
      new RequestBuilder("review")
        .create(params)
        .then(({ data }) => {
          this.$emit("add-review", data);
        })
        .finally(() => {
          this.processing = false;
        });
    },
  },
};
</script>

<style scoped>
textarea {
  height: 10rem;
}
</style>