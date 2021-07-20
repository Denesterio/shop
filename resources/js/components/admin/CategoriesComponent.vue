<template>
  <div class="container mt-5">
    <div class="container-xl mb-4">
      <h2>{{ $t("label.categoryAdd") }}</h2>
      <p>
        <router-link :to="{ name: 'subcategories' }">{{
          $t("link.toSubcategories")
        }}</router-link>
      </p>
      <p>
        <router-link :to="{ name: 'products' }">{{
          $t("link.toAdminPage") + " " + $tc("message.product", 0)
        }}</router-link>
      </p>

      <div class="form-group">
        <input
          v-model.trim="categoryName"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.name }"
          :placeholder="$t('label.newCategoryName')"
        />

        <p v-if="validationErrors.name" class="invalid-feedback fsw-italic">
          {{ validationErrors.name }}
        </p>
      </div>

      <div class="form-group">
        <textarea
          v-model="categoryDesc"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.desc }"
          :placeholder="$t('label.newCategoryDesc')"
        >
        </textarea>
        <div v-if="validationErrors.desc" class="invalid-feedback">
          {{ validationErrors.desc }}
        </div>
      </div>

      <create-button-component
        @click.native="createNewCategory"
        :processing="processing"
      />
    </div>

    <div class="container-xl">
      <svg-loading-component v-if="loading" />
      <span v-else-if="error">{{ error }}</span>
      <ul v-else class="list-group">
        <li
          v-for="category in categories"
          :key="category.id"
          class="
            list-group-item
            d-flex
            justify-content-between
            align-items-start
          "
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
  </div>
</template>

<script>
import CreateButtonComponent from "./CreateButtonComponent.vue";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
import { createCategory } from "../../api/create.js";
import { getCategories } from "../../api/get.js";
import { deleteCategory } from "../../api/delete.js";
import { categorySchema } from "../../validate.js";
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
        name: null,
        desc: null,
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
      this.processing = true;
      const params = {
        name: this.categoryName,
        desc: this.categoryDesc,
      };

      categorySchema
        .validate(params, { abortEarly: false })
        .then(() => {
          createCategory(params).then(({ data }) => {
            this.categories = [data, ...this.categories];
          });
        })
        .catch((error) => {
          error.inner.forEach((err) => {
            this.validationErrors[err.path] = err.message;
          });
        })
        .finally(() => {
          this.processing = false;
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
      this.validationErrors.name = null;
    },
    categoryDesc() {
      this.validationErrors.desc = null;
    },
  },
};
</script>
