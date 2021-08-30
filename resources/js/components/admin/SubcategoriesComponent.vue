<template>
  <div class="container mt-5">
    <form class="container mb-4">
      <h2 v-t="'label.subacategoryAdd'"></h2>
      <p>
        <router-link :to="{ name: 'categories' }">{{
          $t("link.toCategories")
        }}</router-link>
      </p>
      <p>
        <router-link :to="{ name: 'products' }">{{
          $t("link.toProducts")
        }}</router-link>
      </p>

      <div class="form-group">
        <input
          v-model.trim="subcategoryName"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.title }"
          :placeholder="$t('label.subcatName')"
        />

        <p v-if="validationErrors.title" class="invalid-feedback fsw-italic">
          {{ validationErrors.title }}
        </p>
      </div>

      <div class="form-group">
        <input
          v-if="editingStatus"
          v-model="editedSlug"
          v-focus
          class="form-control"
          :class="{ 'is-invalid': validationErrors.slug }"
          :placeholder="$t('label.slug')"
        />
        <div v-else @click="prepareForEditSlug" class="form-control text-muted">
          {{
            subcategorySlug || `${$t("label.slug")} (${$t("label.clickEdit")})`
          }}
        </div>

        <p v-if="validationErrors.slug.length" class="invalid-feedback">
          {{ validationErrors.slug }}
        </p>
      </div>

      <div class="form-group">
        <select
          v-model="categoryId"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.categoryId }"
        >
          <option value="" selected>{{ $t("label.all") }}</option>
          <option
            v-for="category in categories"
            :key="category.id"
            :value="category.id"
          >
            {{ category.title }}
          </option>
        </select>
        <p v-if="validationErrors.categoryId" class="invalid-feedback">
          {{ validationErrors.categoryId }}
        </p>
      </div>

      <create-button-component
        @click.native.prevent="createNewSubcategory"
        :processing="processing"
      />
    </form>

    <div class="container-xl">
      <svg-loading-component v-if="loading" />
      <ul v-else class="list-group">
        <li
          v-for="subcategory in filteredSubcategories"
          :key="subcategory.id"
          class="row justify-content-between mb-2 p-2"
        >
          <div class="col-11 p-2 border-bottom">
            {{ subcategory.title }}
          </div>
          <button
            @click="removeSubcategory(subcategory.id)"
            type="button"
            class="btn btn-outline-danger btn-sm col-1"
            aria-label="Close"
          >
            Удалить
          </button>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import CreateButtonComponent from "./CreateButtonComponent.vue";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
import { getMenu } from "../../api/get.js";
import { createSubcategory } from "../../api/create.js";
import { deleteSubcategory } from "../../api/delete.js";
import transliterate from "../../services/transliterate.js";
import {
  subcategorySchema,
  handleServerErrors,
  fillErrorsObject,
} from "../../validate.js";

export default {
  components: { CreateButtonComponent, SvgLoadingComponent },
  data() {
    return {
      categories: [],
      subcategories: [],
      subcategoryName: "",
      categoryId: "",
      editedSlug: "",
      editingStatus: null,

      processing: false,
      loading: true,
      validationErrors: {
        title: "",
        categoryId: "",
        slug: "",
      },
    };
  },

  created() {
    getMenu()
      .then((data) => {
        this.categories = data.categories;
        this.subcategories = data.subcategories;
      })
      .finally(() => (this.loading = false));
  },

  computed: {
    subcategorySlug() {
      if (!this.editingStatus) {
        return transliterate.fromCyrillic(this.subcategoryName);
      }
    },

    filteredSubcategories() {
      return this.subcategories.filter((subcat) =>
        this.categoryId ? subcat["category_id"] === this.categoryId : true
      );
    },
  },

  methods: {
    prepareForEditSlug() {
      this.editedSlug = this.subcategorySlug;
      this.editingStatus = "edited";
    },

    createNewSubcategory() {
      const params = {
        title: this.subcategoryName,
        categoryId: this.categoryId,
        slug: this.editingStatus ? this.editedSlug : this.subcategorySlug,
      };

      subcategorySchema
        .validate(params, { abortEarly: false })
        .then(() => {
          this.processing = true;
          createSubcategory(params)
            .then(({ data }) => {
              this.subcategories = [data, ...this.subcategories];
              this.subcategoryName = "";
              this.editedSlug = "";
              this.editingStatus = null;
            })
            .catch((error) => {
              handleServerErrors(this, error, "добавить раздел");
            })
            .finally(() => {
              this.processing = false;
            });
        })
        .catch((error) => {
          fillErrorsObject(this.validationErrors, error);
        });
    },

    removeSubcategory(subId) {
      deleteSubcategory(subId).then(
        () =>
          (this.subcategories = this.subcategories.filter(
            (subcat) => subcat.id !== subId
          ))
      );
    },
  },
  watch: {
    subcategoryName() {
      this.validationErrors.title = "";
    },
    categoryId() {
      this.validationErrors.categoryId = "";
    },
    editedSlug() {
      this.validationErrors.slug = "";
    },
  },
};
</script>
