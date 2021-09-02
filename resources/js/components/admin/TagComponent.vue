<template>
  <div class="container mt-5">
    <form class="container mb-4">
      <base-input-group-component
        v-model.trim="tag.title"
        field="title"
        :error="getErrorMessage('title')"
        v-focus
        >{{ $t("label.newTag") }}</base-input-group-component
      >

      <base-button-component
        @click.native.prevent="createNewTag"
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

    <entity-list-component enType="tag" :entities="tags" />
  </div>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";
import EntityListComponent from "./EntityListComponent.vue";
import validationMixin from "../../mixins/validationMixin.js";
import { onlyTitleSchema } from "../../validate.js";
export default {
  name: "tag-component",
  components: { EntityListComponent },
  mixins: [validationMixin], // data: errors: [], methods: getErrorMessage(field), async validate, validateServerErrors
  data() {
    return {
      tag: {
        title: "",
      },
      tags: [],
      loading: true,
      processing: false,
    };
  },

  methods: {
    async createNewTag() {
      const isError = await this.validate(onlyTitleSchema, this.tag);
      if (isError) return;

      const fData = new FormData();
      for (const param in this.tag) {
        fData.append(param, this.tag[param]);
      }

      this.processing = true;
      new RequestBuilder("tag")
        .create(fData)
        .then(({ data }) => {
          this.tags = [data, ...this.tags];
          this.clearForm();
        })
        .catch((error) => {
          this.handleServerError(error, "добавить тэг");
        })
        .finally(() => {
          this.processing = false;
        });
    },

    clearForm() {
      this.tag.title = "";
    },
  },
  watch: {
    tagName() {
      this.errors = [];
    },
  },
};
</script>

<style scoped>
.tagList {
  column-count: 3;
}
</style>
