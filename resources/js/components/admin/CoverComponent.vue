<template>
  <div class="container" :class="{ 'mt-4': formMode !== 'editing' }">
    <form class="container mb-4">
      <base-input-group-component
        v-model.trim="cover.title"
        field="title"
        :error="getErrorMessage('title')"
        v-focus
        >{{ $t("label.newCover") }}</base-input-group-component
      >

      <base-button-component
        @click.native.prevent="createNewCover"
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
      enType="cover"
      :entities="covers"
    />
  </div>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";
import EntityListComponent from "./EntityListComponent.vue";
import validationMixin from "../../mixins/validationMixin.js";
import { onlyTitleSchema } from "../../validate.js";
export default {
  name: "cover-component",
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
      cover: {
        title: this.entityForEdit.title || "",
      },

      covers: [],

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
    async createNewCover() {
      const isError = await this.validate(onlyTitleSchema, this.cover);
      if (isError) return;

      const fData = new FormData();
      for (const param in this.cover) {
        fData.append(param, this.cover[param]);
      }

      this.processing = true;
      new RequestBuilder("cover")
        .create(fData)
        .then(({ data }) => {
          this.covers = [data, ...this.covers];
          this.clearForm();
        })
        .catch((error) => {
          this.handleServerError(error, "добавить обложку");
        })
        .finally(() => {
          this.processing = false;
        });
    },

    clearForm() {
      for (const key in this.cover) {
        this.cover[key] = "";
      }
    },
  },
};
</script>

<style scoped>
.coverList {
  column-count: 2;
}
</style>