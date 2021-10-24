<template>
  <div class="container" :class="{ 'mt-4': formMode !== 'editing' }">
    <form class="container mb-4">
      <base-input-group-component
        v-model.trim="tag.title"
        field="title"
        :error="getErrorMessage('title')"
        v-focus
        >{{ $t("label.newTag") }}</base-input-group-component
      >

      <base-button-component
        @click.native.prevent="submitTag"
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
      enType="tag"
      :entities="tags"
    />
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
      tag: {
        title: this.entityForEdit.title || "",
      },
      tags: [],
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
    async submitTag() {
      const isError = await this.validate(onlyTitleSchema, this.tag);
      if (isError) return;

      const fData = new FormData();
      for (const param in this.tag) {
        fData.append(param, this.tag[param]);
      }

      if (this.isCreatingMode) {
        this.createNewTag(fData);
      } else {
        this.editTag(fData);
      }
    },

    createNewTag(data) {
      this.processing = true;
      new RequestBuilder("tags")
        .create(data)
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

    editTag(data) {
      this.processing = true;
      new RequestBuilder("tag")
        .edit(this.entityForEdit.id, data)
        .then(({ data }) => {
          this.$emit("update-entity", data);
        })
        .catch((error) => {
          this.handleServerError(error, "обновить тэг");
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
