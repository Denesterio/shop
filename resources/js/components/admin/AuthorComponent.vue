<template>
  <div class="container py-4" :class="{ 'mt-4': formMode !== 'editing' }">
    <form class="container mb-4">
      <base-input-group-component
        v-model.trim="author.title"
        field="title"
        :error="getErrorMessage('title')"
        v-focus
        >Имя и фамилия автора полностью
      </base-input-group-component>

      <base-button-component
        @click.native.prevent="submitAuthor"
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
      enType="author"
      :entities="authors"
    />
  </div>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";
import EntityListComponent from "./EntityListComponent.vue";
import validationMixin from "../../mixins/validationMixin.js";
import { onlyTitleSchema } from "../../validate.js";
export default {
  name: "author-component",
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
      author: {
        title: this.entityForEdit.title || "",
      },

      authors: [],
      processing: false,
    };
  },

  computed: {
    isCreatingMode() {
      return this.formMode === "creating";
    },
  },

  methods: {
    async submitAuthor() {
      const isError = await this.validate(onlyTitleSchema, this.author);
      if (isError) return;

      const fData = new FormData();
      for (const param in this.author) {
        fData.append(param, this.author[param]);
      }

      if (this.isCreatingMode) {
        this.createNewAuthor(fData);
      } else {
        this.editAuthor(fData);
      }
    },

    createNewAuthor(data) {
      this.processing = true;
      new RequestBuilder("authors")
        .create(data)
        .then(({ data }) => {
          this.authors = [data, ...this.authors];
          this.clearForm();
        })
        .catch((error) => {
          this.handleServerError(error, "добавить автора");
        })
        .finally(() => {
          this.processing = false;
        });
    },

    editAuthor(data) {
      this.processing = true;
      new RequestBuilder("author")
        .edit(this.entityForEdit.id, data)
        .then(({ data }) => {
          this.$emit("update-entity", data);
        })
        .catch((error) => {
          this.handleServerError(error, "обновить автора");
        })
        .finally(() => {
          this.processing = false;
        });
    },

    clearForm() {
      for (const key in this.author) {
        this.author[key] = "";
      }
    },
  },
};
</script>