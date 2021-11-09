<template>
  <div class="container-xl mt-4">
    <h4 v-if="enType.length" v-t="`link.${enType}`" v-upfirst></h4>
    <svg-loading-component v-if="processing" />
    <span v-else-if="error" class="text-danger">{{ error }}</span>
    <div v-if="currentEntities.length">
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
        v-if="totalPages"
        @change-page="getEntities"
        :current="currentPage"
        :total="totalPages"
        :onPage="countOnPage"
        class="my-3"
      />
    </div>
  </div>
</template>

<script>
import BasePagination from "../BasePagination.vue";
import EntityListItem from "./EntityListItem.vue";
import RequestBuilder from "../../api/requestBuilder.js";
import paginationSettings from "../../mixins/paginationSettings.js";
export default {
  components: { BasePagination, EntityListItem },
  // data: countOnPage, currentPage, nextPage, totalPages
  // method fillDataFromResponse(response.data, field)
  // computed: numberOnPage
  mixins: [paginationSettings],
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
      processing: false,
      error: "",
    };
  },

  methods: {
    // используется в watch, type сущности передается во множественном числе,
    // полученном из enType через i18n
    getEntities(nextPage) {
      this.processing = true;
      this.nextPage = nextPage;
      new RequestBuilder(this.$t(`plurals.${this.enType}`))
        .withQueryParams({ page: nextPage || 1, limit: this.numberOnPage })
        .get()
        .then((data) => this.fillDataFromResponse(data, "currentEntities"))
        .catch((error) => (this.error = error.response.data.message))
        .finally(() => (this.processing = false));
    },

    remove(id) {
      new RequestBuilder(this.enType)
        .delete(id)
        .then(
          () =>
            (this.currentEntities = this.currentEntities.filter(
              (ent) => ent.id !== id
            ))
        )
        .catch((err) => (this.error = err.response.data.message));
    },

    showEditForm(id) {
      const entityForEdit = this.currentEntities.find((en) => en.id === id);
      this.$emit("show-edit-form", entityForEdit);
    },
  },

  watch: {
    enType(newVal) {
      if (newVal.length > 0) {
        this.getEntities();
      } else {
        this.currentEntities = [];
      }
      this.currentPage = 1;
      this.nextPage = 1;
      this.error = "";
    },

    entities() {
      this.currentEntities = this.entities;
      this.error = "";
    },

    editedEntity(newValue) {
      this.error = "";

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