<template>
  <div class="container" :class="{ 'mt-4': formMode !== 'editing' }">
    <form class="container mb-4">
      <base-input-group-component
        v-model.trim="category.title"
        field="title"
        :error="getErrorMessage('title')"
        v-focus
        >{{ $t("label.newCategoryName") }}
      </base-input-group-component>

      <base-input-group-component
        v-model="category.description"
        type="textarea"
        field="description"
        :error="getErrorMessage('description')"
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

    <entity-list-component
      v-if="isCreatingMode"
      enType="category"
      :entities="categories"
    />
  </div>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";
import EntityListComponent from "./EntityListComponent.vue";
import validationMixin from "../../mixins/validationMixin.js";
import { categorySchema } from "../../validate.js";

export default {
  name: "category-component",
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
      category: {
        title: this.entityForEdit.title || "",
        description: this.entityForEdit.description || "",
      },

      categories: [],

      loading: true,
      processing: false,
    };
  },

  computed: {
    isCreatingMode() {
      return this.formMode === "creating";
    },
  },

  methods: {
    async createNewCategory() {
      const isError = await this.validate(categorySchema, this.category);
      if (isError) return;

      const fData = new FormData();
      for (const param in this.category) {
        fData.append(param, this.category[param]);
      }

      this.processing = true;
      new RequestBuilder("category")
        .create(fData)
        .then(({ data }) => {
          this.categories = [data, ...this.categories];
          this.clearForm();
        })
        .catch((error) => {
          this.handleServerError(error, "добавить категорию");
        })
        .finally(() => {
          this.processing = false;
        });
    },

    clearForm() {
      for (const key in this.category) {
        this.category[key] = "";
      }
    },
  },
};
</script>
