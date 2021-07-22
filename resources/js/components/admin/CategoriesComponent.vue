<template>
  <div class="container mt-5">
    <form class="container mb-4">
      <h2 v-t="'label.categoryAdd'"></h2>
      <p>
        <router-link :to="{ name: 'subcategories' }">{{
          $t("link.toSubcategories")
        }}</router-link>
      </p>
      <p>
        <router-link :to="{ name: 'products' }">{{
          $t("link.toProducts")
        }}</router-link>
      </p>

      <div class="form-group">
        <input
          v-model.trim="categoryName"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.title }"
          :placeholder="$t('label.newCategoryName')"
        />

        <p v-if="validationErrors.title" class="invalid-feedback fsw-italic">
          {{ validationErrors.title }}
        </p>
      </div>

      <div class="form-group">
        <textarea
          v-model="categoryDesc"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.description }"
          :placeholder="$t('label.newCategoryDesc')"
        >
        </textarea>
        <div v-if="validationErrors.description" class="invalid-feedback">
          {{ validationErrors.description }}
        </div>
      </div>

      <create-button-component
        @click.native.prevent="createNewCategory"
        :processing="processing"
      />
    </form>

    <svg-loading-component v-if="loading" />
    <span v-else-if="error">{{ error }}</span>
    <ul v-else class="list-group">
      <li
        v-for="category in categories"
        :key="category.id"
        class="list-group-item d-flex justify-content-between align-items-start"
      >
        <div class="ms-2 me-auto font-weight-light">
          <div class="font-weight-bold">
            {{ category.title }}
          </div>
          {{ category.description }}
        </div>
        <button
          @click="removeCategory(category.id)"
          type="button"
          class="btn btn-danger"
          aria-label="Close"
        >
          {{ $t("label.delete") }}
        </button>
      </li>
    </ul>
  </div>
</template>

<script>
import CreateButtonComponent from "./CreateButtonComponent.vue";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
import { createCategory } from "../../api/create.js";
import { getCategories } from "../../api/get.js";
import { deleteCategory } from "../../api/delete.js";
import {
  categorySchema,
  handleServerErrors,
  fillErrorsObject,
} from "../../validate.js";

export default {
  components: { CreateButtonComponent, SvgLoadingComponent },
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
  mounted() {
    getCategories()
      .then((data) => (this.categories = data))
      .catch((error) => (this.error = error.response.data.message))
      .finally(() => (this.loading = false));
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
          createCategory(params)
            .then(({ data }) => {
              this.categories = [data, ...this.categories];
              this.categoryName = "";
              this.categoryDesc = "";
            })
            .catch((error) => {
              handleServerErrors(this, error, "категорию");
            })
            .finally(() => {
              this.processing = false;
            });
        })
        .catch((error) => {
          fillErrorsObject(this.validationErrors, error);
        });
    },

    removeCategory(categoryId) {
      deleteCategory(categoryId).then(() => {
        this.categories = this.categories.filter(
          (cat) => cat.id !== categoryId
        );
      });
    },
  },
  watch: {
    categoryName() {
      this.validationErrors.title = null;
    },
    categoryDesc() {
      this.validationErrors.description = null;
    },
  },
};
</script>
