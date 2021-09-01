<template>
  <div class="container mt-5">
    <form class="container mb-4">
      <base-input-group-component
        v-model.trim="coverName"
        field="coverName"
        :error="validationErrors.title"
        >{{ $t("label.newCover") }}</base-input-group-component
      >

      <base-button-component
        @click.native.prevent="createNewCover"
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
  name: "cover-component",
  data() {
    return {
      coverName: "",
      covers: [],
      loading: true,
      processing: false,
      validationErrors: {
        title: "",
      },
    };
  },

  methods: {
    createNewCover() {
      const params = {
        title: this.coverName,
      };

      onlyTitleSchema
        .validate(params, { abortEarly: false })
        .then(() => {
          this.processing = true;
          new RequestBuilder("cover")
            .create(params)
            .then(({ data }) => {
              this.covers = [data, ...this.covers];
              this.coverName = "";
            })
            .catch((error) => {
              handleServerErrors(this, error, "добавить обложку");
            })
            .finally(() => {
              this.processing = false;
            });
        })
        .catch((error) => fillErrorsObject(this.validationErrors, error));
    },
  },
  watch: {
    coverName() {
      this.validationErrors.title = "";
    },
  },
};
</script>

<style scoped>
.coverList {
  column-count: 2;
}
</style>