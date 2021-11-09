<template>
  <form @submit.prevent="addReview">
    <svg-loading-component v-if="processing" />
    <template v-else>
      <div class="input-group">
        <label class="input-group-text">Текст отзыва</label>
        <!-- <ckeditor
          v-model="reviewBody"
          :config="editorConfig"
          class="w-100"
          aria-describedby="reviewHelpBlock"
          aria-label="Текст отзыва"
        ></ckeditor> -->
        <textarea
          v-model="reviewBody"
          class="form-control"
          aria-label="Текст отзыва"
          aria-describedby="reviewHelpBlock"
        ></textarea>
      </div>
      <div
        id="reviewHelpBlock"
        class="small text-secondary"
        v-t="'message.reviewHelpBlock'"
      ></div>
      <button type="submit" class="btn btn-primary mt-3">Отправить</button>
    </template>
  </form>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";
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
      editorConfig: {
        toolbarGroups: [
          { name: "document", groups: ["document"] },
          { name: "clipboard", groups: ["clipboard", "undo"] },
          { name: "editing", groups: ["find", "selection"] },
          { name: "basicstyles", groups: ["basicstyles", "cleanup"] },
          { name: "font", groups: ["size"] },
          {
            name: "paragraph",
            groups: ["list", "blocks", "align", "bidi"],
          },
          { name: "colors" },
          { name: "links" },
          { name: "tools" },
        ],
        removeButtons: "Cut,Copy,Paste,Anchor",
      },
    };
  },

  methods: {
    addReview() {
      if (this.reviewBody.length < 10) return;
      const formData = new FormData();
      formData.append("product_id", this.productId);
      formData.append("review", this.reviewBody);

      new RequestBuilder("reviews")
        .create(formData, this.productId)
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