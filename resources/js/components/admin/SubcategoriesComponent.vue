<template>
  <div class="container mt-5">
    <div class="container-xl mb-4">
      <h2>{{ `${$t("label.add")} ${$t("label.subcategory")}` }}</h2>
      <p>
        <router-link :to="{ name: 'categories' }">{{
          $t("link.toCategories")
        }}</router-link>
      </p>
      <p>
        <router-link :to="{ name: 'products' }">{{
          $t("link.toAdminPage") + " " + $tc("message.product", 0)
        }}</router-link>
      </p>

      <div class="form-group">
        <input
          v-model.trim="subcategoryName"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.name }"
          placeholder="Имя новой подкатегории"
        />

        <p v-if="validationErrors.name" class="invalid-feedback fsw-italic">
          {{ validationErrors.name }}
        </p>
      </div>

      <div class="form-group">
        <input
          v-if="slugStatus"
          v-model="slug"
          v-focus
          class="form-control"
          :class="{ 'is-invalid': validationErrors.slug }"
          placeholder="Заполнитель в строке адреса"
        />

        <div v-else @click="prepareForEditSlug" class="form-control text-muted">
          {{
            subcategorySlug ||
            "Заполнитель в строке адреса (кликните по полю для редактирования)"
          }}
        </div>

        <p v-if="validationErrors.slug" class="invalid-feedback">
          {{ validationErrors.slug }}
        </p>
      </div>

      <div class="form-group">
        <select
          v-model="categoryId"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.categoryId }"
        >
          <option value="" selected>Все</option>
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
        @click.native="createNewSubcategory"
        :processing="processing"
      />
    </div>

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
import { getCategories, getSubcategories } from "../../api/get.js";
import { createSubcategory } from "../../api/create.js";
import { deleteSubcategory } from "../../api/delete.js";
import transliterate from "../../transliterate.js";
import { isValid, fillErrors } from "../../validate.js";

export default {
  components: { CreateButtonComponent, SvgLoadingComponent },
  data() {
    return {
      categories: [],
      subcategories: [],
      subcategoryName: "",
      categoryId: "",
      slug: "",
      slugStatus: null,

      processing: false,
      loading: true,
      validationErrors: {
        name: "",
        categoryId: "",
        slug: "",
      },
    };
  },

  created() {
    const promises = [
      getCategories().then(({ data }) => (this.categories = data.reverse())),
      getSubcategories().then(
        ({ data }) => (this.subcategories = data.reverse())
      ),
    ];
    Promise.all(promises).finally(() => (this.loading = false));
  },

  computed: {
    subcategorySlug() {
      if (!this.slugStatus) {
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
      this.slug = this.subcategorySlug;
      this.slugStatus = "edited";
    },

    createNewSubcategory() {
      this.processing = true;
      const params = {
        name: this.subcategoryName,
        categoryId: this.categoryId,
        slug: this.slugStatus ? this.slug : this.subcategorySlug,
      };

      if (!isValid(params)) {
        fillErrors(this.validationErrors, params);
        this.processing = false;
        return;
      }

      createSubcategory(params)
        .then(({ data }) => {
          this.subcategories = [data, ...this.subcategories];
        })
        .finally(() => {
          this.processing = false;
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
      this.validationErrors.name = "";
    },
    categoryId() {
      this.validationErrors.categoryId = "";
    },
  },
};
</script>
