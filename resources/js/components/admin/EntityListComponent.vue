<template>
  <div class="container-xl mt-4">
    <h4 v-if="enType.length" v-t="`link.${enType}`" v-upfirst></h4>
    <svg-loading-component v-if="processing" />
    <span v-else-if="error">{{ error }}</span>
    <div v-else-if="currentEntities.length">
      <ul class="list-group mt-4">
        <EntityListItem
          v-for="entity in currentEntities"
          :key="entity.id"
          :entity="entity"
          :enType="enType"
          @show-edit-form="showEditForm"
        >
        </EntityListItem>
      </ul>
      <BasePagination
        @change-page="getEntitiesByUrl"
        :settings="paginationSettings"
        class="my-3 mx-auto"
      />
    </div>
  </div>
</template>

<script>
import BasePagination from "../BasePagination.vue";
import EntityListItem from "./EntityListItem.vue";
import RequestBuilder from "../../api/requestBuilder.js";
export default {
  components: { BasePagination, EntityListItem },
  props: {
    enType: {
      type: String,
      required: false,
      default: "",
    },

    entities: {
      type: Array,
      required: false,
      default: () => [],
    },
  },

  data() {
    return {
      currentEntities: this.entities,
      paginationSettings: { links: [] },
      processing: false,
      error: "",
    };
  },

  paginationSettingsKeys: [
    "current_page",
    "next_page_url",
    "prev_page_url",
    "first_page_url",
  ],

  methods: {
    fillDataFromResponse(resData) {
      this.currentEntities = resData.data;
      this.paginationSettings = {
        links: resData.links.slice(1, resData.links.length - 1),
      };
      this.$options.paginationSettingsKeys.forEach(
        (key) => (this.paginationSettings[key] = resData[key])
      );
    },

    getEntities(type) {
      this.processing = true;
      new RequestBuilder(type)
        .get()
        .then((data) => this.fillDataFromResponse(data))
        .catch((error) => (this.error = error.response.data.message))
        .finally(() => (this.processing = false));
    },

    getEntitiesByUrl(url) {
      new RequestBuilder()
        .makeRequest(url)
        .then((data) => this.fillDataFromResponse(data))
        .catch((error) => (this.error = error.response.data.message));
    },

    remove(id) {
      new RequestBuilder(this.enType)
        .delete(id)
        .then(
          () =>
            (this.currentEntities = this.currentEntities.filter(
              (ent) => ent.id !== id
            ))
        );
    },

    showEditForm(id) {
      const entityForEdit = this.currentEntities.find((en) => en.id === id);
      this.$emit("show-edit-form", entityForEdit);
    },
  },

  watch: {
    enType(newVal) {
      if (newVal.length > 0) {
        this.getEntities(this.$t(`plurals.${this.enType}`));
      } else {
        this.currentEntities = [];
      }
    },

    entities() {
      this.currentEntities = this.entities;
    },
  },
};
</script>