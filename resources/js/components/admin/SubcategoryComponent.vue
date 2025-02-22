<template>
  <div class="container" :class="{ 'mt-4': formMode !== 'editing' }">
    <form class="container mb-4">
      <base-input-group-component
        v-model.trim="subcategory.title"
        field="title"
        :error="getErrorMessage('title')"
        v-focus
        >{{ $t("label.newSubcatName") }}
      </base-input-group-component>

      <base-input-group-component
        v-if="isEditingMode"
        v-model.trim="editedSlug"
        field="subcategorySlug"
        :error="getErrorMessage('slug')"
        >{{ $t("label.slug") }}
      </base-input-group-component>

      <base-input-group-component
        v-else
        v-model.trim="subcategorySlug"
        :readonly="true"
        field="subcategorySlug"
        :error="getErrorMessage('slug')"
        :placeholder="$t('label.clickEdit')"
        @click.native.ctrl="editingModeOn"
        >{{ $t("label.slug") }}
      </base-input-group-component>

      <base-select-group-component
        v-model.number="subcategory.categoryId"
        field="categoryId"
        :error="getErrorMessage('categoryId')"
        :entities="categories"
        >{{ $t("label.category") }}
      </base-select-group-component>

      <base-button-component
        @click.native.prevent="submitSubcategory"
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

    <entity-list-component
      v-if="this.formMode === 'creating'"
      enType="subcategory"
      :entities="subcategories"
    />
  </div>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";
import transliterate from "../../services/transliterate.js";
import EntityListComponent from "./EntityListComponent.vue";
import validationMixin from "../../mixins/validationMixin.js";
import { subcategorySchema } from "../../validate.js";

export default {
  name: "subcategory-component",
  components: { EntityListComponent },
  mixins: [validationMixin], // data: errors: [], methods: getErrorMessage(field), async validate, validateServerErrors
  props: {
    formMode: {
      type: String,
      required: false,
      default: "creating",
    },
    entityForEdit: {
      type: Object,
      required: false,
      default: () => ({}),
    },
  },

  data() {
    return {
      subcategory: {
        title: this.entityForEdit.title || "",
        categoryId: this.entityForEdit["category_id"],
      },
      editedSlug: this.entityForEdit.slug || "",

      isEditingMode: this.formMode === "editing",
      categories: [],
      subcategories: [],

      processing: false,
      loading: true,
    };
  },

  created() {
    new RequestBuilder("categories")
      .get()
      .then((data) => {
        this.categories = data.data;
      })
      .finally(() => (this.loading = false));
  },

  computed: {
    subcategorySlug() {
      if (!this.isEditingMode) {
        return transliterate.fromCyrillic(this.subcategory.title);
      }
    },
  },

  methods: {
    editingModeOn() {
      this.editedSlug = this.subcategorySlug;
      this.isEditingMode = true;
    },

    async submitSubcategory() {
      const params = {
        ...this.subcategory,
        slug: this.isEditingMode ? this.editedSlug : this.subcategorySlug,
      };

      const isError = await this.validate(subcategorySchema, params);
      if (isError) return;

      const fData = new FormData();
      for (const param in params) {
        fData.append(param, params[param]);
      }

      if (this.isCreatingMode) {
        this.createNewSubcategory(fData);
      } else {
        this.editSubcategory(fData);
      }
    },

    createNewSubcategory(data) {
      this.processing = true;
      new RequestBuilder("subcategories")
        .create(data)
        .then(({ data }) => {
          this.subcategories = [data, ...this.subcategories];
          this.clearForm();
        })
        .catch((error) => {
          this.handleServerError(error, "добавить раздел");
        })
        .finally(() => {
          this.processing = false;
        });
    },

    editSubcategory(data) {
      this.processing = true;
      new RequestBuilder("subcategory")
        .edit(this.entityForEdit.id, data)
        .then(({ data }) => {
          this.$emit("update-entity", data);
        })
        .catch((error) => {
          this.handleServerError(error, "обновить раздел");
        })
        .finally(() => {
          this.processing = false;
        });
    },

    clearForm() {
      for (const key in this.subcategory) {
        this.subcategory[key] = "";
      }
      this.editedSlug = "";
      this.isEditingMode = false;
    },
  },
};
</script>
