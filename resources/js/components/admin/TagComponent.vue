<template>
  <div class="container mt-5">
    <form class="container mb-4">
      <base-input-group-component
        v-model.trim="tagName"
        field="tagName"
        :error="validationErrors.title"
        >{{ $t("label.newTag") }}</base-input-group-component
      >

      <base-button-component
        @click.native.prevent="createNewTag"
        :disabled="processing"
        bType="create"
        v-t="'label.create'"
      ></base-button-component>
    </form>
  </div>
</template>

<script>
import RequestBuilder from "../../api";
import {
  onlyTitleSchema,
  handleServerErrors,
  fillErrorsObject,
} from "../../validate.js";
export default {
  name: "tag-component",
  data() {
    return {
      tagName: "",
      tags: [],
      loading: true,
      processing: false,
      validationErrors: {
        title: "",
      },
    };
  },

  methods: {
    createNewTag() {
      const params = {
        title: this.tagName,
      };

      onlyTitleSchema
        .validate(params, { abortEarly: false })
        .then(() => {
          this.processing = true;
          new RequestBuilder("tag")
            .create(params)
            .then(({ data }) => {
              this.tags = [data, ...this.tags];
              this.tagName = "";
            })
            .catch((error) => {
              handleServerErrors(this, error, "добавить тэг");
            })
            .finally(() => {
              this.processing = false;
            });
        })
        .catch((error) => fillErrorsObject(this.validationErrors, error));
    },
  },
  watch: {
    tagName() {
      this.validationErrors.title = "";
    },
  },
};
</script>

<style scoped>
.tagList {
  column-count: 3;
}
</style>
