<template>
  <div class="container-xl mt-4">
    <h4 v-if="enType.length" v-t="`link.${enType}`" v-upfirst></h4>
    <svg-loading-component v-if="processing" />
    <span v-else-if="error">{{ error }}</span>
    <ul v-else class="list-group mt-4">
      <li
        v-for="entity in currentEntities"
        :key="entity.id"
        class="row justify-content-between mb-2 p-2"
      >
        <div class="col-8 col-sm-10 col-lg-11 p-2 border-bottom">
          {{ entity.title }}
        </div>
        <base-button-component
          @click.native="remove(entity.id)"
          :disabled="processing"
          bType="delete"
          v-t="'label.delete'"
          bSize="sm"
          class="col-4 col-sm-2 col-lg-1"
          aria-label="Удалить"
        ></base-button-component>
      </li>
    </ul>
  </div>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";
export default {
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
      processing: false,
      error: "",
    };
  },

  methods: {
    getEntities(type) {
      this.processing = true;
      new RequestBuilder(type)
        .get()
        .then((data) => (this.currentEntities = data))
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
        );
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