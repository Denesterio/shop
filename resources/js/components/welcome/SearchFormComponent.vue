<template>
  <div class="d-flex p-2 flex-column card justify-content-center">
    <div class="">
      <label class="input-label" for="searchQuery">Поиск:</label>
      <base-input-component
        v-model="searchQuery"
        class="form-control-sm"
        field="searchQuery"
        >Поиск:</base-input-component
      >
    </div>
    <div class="mt-3">
      <base-select-component
        :options="searchOptions"
        v-model="searchType"
        field="searchType"
        class="form-control-sm"
      />
    </div>
    <base-button-component
      @click.native="fetchSearchedProducts"
      class="mt-3 ml-auto col-xl-6 btn-info"
      >Найти</base-button-component
    >
  </div>
</template>

,<script>
export default {
  data() {
    return {
      searchQuery: "",
      searchType: "title",
      loading: false,
      searchOptions: [
        { value: "author", text: "По автору" },
        { value: "title", text: "По названию" },
      ],
    };
  },

  methods: {
    fetchSearchedProducts() {
      this.loading = true;
      const params = {
        query: this.searchQuery,
      };
      this.$router.push({ name: "search.products", query: params });
    },
  },
};
</script>