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
          @remove-entity="remove"
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
      // передача типа сущности для запроса из компонента
      type: String,
      required: false,
      default: "",
    },

    entities: {
      // передача сущностей снаружи
      type: Array,
      required: false,
      default: () => [],
    },

    editedEntity: {
      type: Object,
      required: false,
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
    "total",
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

    // используется в watch, type сущности передается во множественном числе,
    // полученном из enType через i18n
    getEntities(type) {
      this.processing = true;
      new RequestBuilder(type)
        .perPage(20)
        .get()
        .then((data) => this.fillDataFromResponse(data))
        .catch((error) => (this.error = error.response.data.message))
        .finally(() => (this.processing = false));
    },

    // используются сслыки из пагинации laravel
    getEntitiesByUrl(url) {
      new RequestBuilder()
        .makeRequest(url)
        .then((res) => this.fillDataFromResponse(res.data))
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

    editedEntity(newValue) {
      if (newValue) {
        const editedEntityIndex = this.currentEntities.findIndex(
          (entity) => entity.id === newValue.id
        );
        this.currentEntities = [
          ...this.currentEntities.slice(0, editedEntityIndex),
          newValue,
          ...this.currentEntities.slice(editedEntityIndex + 1),
        ];
      }
    },
  },
};
</script>