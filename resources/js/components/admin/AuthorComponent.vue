<template>
  <div class="container mt-4 py-4">
    <form class="container mb-4">
      <base-input-group-component
        v-model.trim="author.title"
        field="title"
        :error="getErrorMessage('title')"
        v-focus
        >Имя и фамилия автора полностью
      </base-input-group-component>

      <base-button-component
        @click.native.prevent="createNewAuthor"
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

    <entity-list-component enType="author" :entities="authors" />
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
  mixins: [validationMixin], // data: errors: [], methods: getErrorMessage(field)
  data() {
    return {
      author: {
        title: "",
      },

      authors: [],
      processing: false,
    };
  },

  methods: {
    async createNewAuthor() {
      const isError = await this.validate(onlyTitleSchema, this.author);
      if (isError) return;

      const fData = new FormData();
      for (const param in this.author) {
        fData.append(param, this.author[param]);
      }

      this.processing = true;
      new RequestBuilder("author")
        .create(fData)
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

    clearForm() {
      for (const key in this.author) {
        this.author[key] = "";
      }
    },
  },
};
</script>