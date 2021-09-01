<template>
  <div class="container mt-5">
    <form class="container mb-4">
      <base-input-group-component
        v-model.trim="subcategoryName"
        field="subcategoryName"
        :error="validationErrors.title"
        >{{ $t("label.newSubcatName") }}
      </base-input-group-component>

      <base-input-group-component
        v-if="isEditingMode"
        v-model.trim="editedSlug"
        field="subcategorySlug"
        :error="validationErrors.slug"
        >{{ $t("label.slug") }}
      </base-input-group-component>

      <base-input-group-component
        v-else
        v-model.trim="subcategorySlug"
        :readonly="true"
        field="subcategorySlug"
        :error="validationErrors.slug"
        :placeholder="$t('label.clickEdit')"
        @click.native.ctrl="editingModeOn"
        >{{ $t("label.slug") }}
      </base-input-group-component>

      <base-select-group-component
        v-model.number="categoryId"
        field="categoryId"
        :error="validationErrors.categoryId"
        :entities="categories"
        >{{ $t("label.category") }}
      </base-select-group-component>

      <base-button-component
        @click.native.prevent="createNewSubcategory"
        :disabled="processing"
        bType="create"
        v-t="'label.create'"
      ></base-button-component>
    </form>
  </div>
</template>

<script>
import RequestBuilder from "../../api";
import transliterate from "../../services/transliterate.js";
import {
  subcategorySchema,
  handleServerErrors,
  fillErrorsObject,
} from "../../validate.js";

export default {
  name: "subcategory-component",
  data() {
    return {
      categories: [],
      subcategories: [],
      subcategoryName: "",
      categoryId: "",
      editedSlug: "",
      isEditingMode: false,

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
    new RequestBuilder("categories")
      .get()
      .then((data) => {
        this.categories = data;
      })
      .finally(() => (this.loading = false));
  },

  computed: {
    subcategorySlug() {
      if (!this.isEditingMode) {
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
    editingModeOn() {
      this.editedSlug = this.subcategorySlug;
      this.isEditingMode = true;
    },

    createNewSubcategory() {
      const params = {
        title: this.subcategoryName,
        categoryId: this.categoryId,
        slug: this.isEditingMode ? this.editedSlug : this.subcategorySlug,
      };

      subcategorySchema
        .validate(params, { abortEarly: false })
        .then(() => {
          this.processing = true;
          new RequestBuilder("subcategory")
            .create(params)
            .then(({ data }) => {
              this.subcategories = [data, ...this.subcategories];
              this.subcategoryName = "";
              this.editedSlug = "";
              this.isEditingMode = false;
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
