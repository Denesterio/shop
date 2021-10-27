<template>
  <section class="row border shadow p-2 mb-4">
    <div class="col-md-6 border-bottom border-2 border-primary">
      <label for="btn-radios-1" class="products-view-label"
        >Отобразить товары</label
      >
      <b-form-group class="col-md-4" v-slot="{ ariaDescribedby }">
        <b-form-radio-group
          id="btn-radios-1"
          v-bind:checked="selectedView"
          @input="updateSelectedView"
          :options="optionsView"
          :aria-describedby="ariaDescribedby"
          name="radio-btn-outline"
          button-variant="outline-primary"
          buttons
          size="sm"
        ></b-form-radio-group>
      </b-form-group>
    </div>
    <div class="col-md-6 border-bottom border-2 border-primary">
      <label class="products-view-label" for="countOnPage"
        >Количество на странице</label
      >
      <base-select-component
        :options="countOnPageOptions"
        v-bind:value="countOnPage"
        field="countOnPage"
        @change.native="updateCountOnPage"
        class="form-control-sm"
        >Количество на странице:</base-select-component
      >
    </div>
    <div class="col-12 row p-3 align-items-end justify-content-evently">
      <div class="col-md-7">
        <label class="input-label" for="searchQuery">Поиск:</label>
        <base-input-component
          @input.native="updateSearchQuery"
          v-bind:value="searchQuery"
          class="form-control-sm"
          field="searchQuery"
          >Поиск:</base-input-component
        >
      </div>
      <div class="col-md-3">
        <label class="products-view-label" for="searchType">Искать по:</label>
        <base-select-component
          :options="searchOptions"
          v-bind:value="searchType"
          field="searchType"
          @change.native="updateSearchType"
          class="form-control-sm"
        />
      </div>
      <base-button-component
        @click.native="searchProducts"
        bSize="sm"
        class="col-md-2"
        >Найти</base-button-component
      >
    </div>
  </section>
</template>

<script>
export default {
  props: {
    selectedView: {
      type: String,
      required: true,
    },
    countOnPage: {
      type: String,
      required: true,
    },
    searchQuery: {
      type: String,
      required: true,
    },
    searchType: {
      type: String,
      required: true,
    },
  },

  data() {
    return {
      optionsView: [
        { text: "Карточками", value: "Card" },
        { text: "Списком", value: "Point" },
      ],
      countOnPageOptions: [{ value: "12" }, { value: "24" }, { value: "36" }],
      searchOptions: [
        { value: "author", text: "По автору" },
        { value: "title", text: "По названию" },
      ],
    };
  },

  methods: {
    updateSelectedView(view) {
      this.$emit("update:selectedView", view);
    },

    updateCountOnPage(e) {
      this.$emit("update:countOnPage", e.target.value);
    },

    updateSearchQuery(e) {
      this.$emit("update:searchQuery", e.target.value);
    },

    updateSearchType(e) {
      this.$emit("update:searchType", e.target.value);
    },

    searchProducts() {
      this.$emit("search-products");
    },
  },
};
</script>

<style scoped>
.products-view-label {
  font-size: 0.9rem;
}
</style>