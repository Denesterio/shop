<template>
  <div class="container mt-5">
    <form class="container mb-4">
      <base-input-group-component
        v-model.trim="categoryName"
        field="categoryName"
        :error="validationErrors.title"
        >{{ $t("label.newCategoryName") }}
      </base-input-group-component>

      <base-input-group-component
        v-model="categoryDesc"
        type="textarea"
        field="categoryDesc"
        :error="validationErrors.description"
        >{{ $t("label.newCategoryDesc") }}
      </base-input-group-component>

      <base-button-component
        @click.native.prevent="createNewCategory"
        :disabled="processing"
        bType="create"
        v-t="'label.create'"
      ></base-button-component>

      <base-button-component
        @click.native.prevent="clearForm"
        :disabled="processing"
        bType="clear"
        v-t="'label.clear'"
        class="ml-2"
      ></base-button-component>
    </form>
  </div>
</template>

<script>
import RequestBuilder from "../../api";
import {
  categorySchema,
  handleServerErrors,
  fillErrorsObject,
} from "../../validate.js";

export default {
  name: "category-component",
  data() {
    return {
      categoryName: "",
      categoryDesc: "",

      categories: [],
      error: "",

      loading: true,
      processing: false,
      validationErrors: {
        title: "",
        description: "",
      },
    };
  },

  methods: {
    createNewCategory() {
      const params = {
        title: this.categoryName,
        description: this.categoryDesc,
      };

      categorySchema
        .validate(params, { abortEarly: false })
        .then(() => {
          this.processing = true;
          new RequestBuilder("category")
            .create(params)
            .then(({ data }) => {
              this.categories = [data, ...this.categories];
              this.clearForm();
            })
            .catch((error) => {
              handleServerErrors(this, error, "добавить категорию");
            })
            .finally(() => {
              this.processing = false;
            });
        })
        .catch((error) => {
          fillErrorsObject(this.validationErrors, error);
        });
    },

    clearForm() {
      this.categoryName = "";
      this.categoryDesc = "";
    },
  },
  watch: {
    categoryName() {
      this.validationErrors.title = "";
    },
    categoryDesc() {
      this.validationErrors.description = "";
    },
  },
};
</script>
