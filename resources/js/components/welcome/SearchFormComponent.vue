<template>
  <form
    @submit="fetchSearchedProducts"
    class="d-flex p-2 flex-column card justify-content-center"
  >
    <div class="">
      <label class="input-label" for="searchQuery">Поиск:</label>
      <div class="mb-3">
        <base-select-component
          :options="searchOptions"
          v-model="searchType"
          id="searchSelect"
          field="searchType"
          class="form-control-sm"
        />
      </div>
      <div class="input-group" ref="searchInput">
        <!-- фокус устанавливается по this.$refs.searchInput.firstElementChild; при смене верстки не забыть -->
        <base-input-component
          v-model="searchQuery"
          @keydown.native="moveFocusToSuggestions"
          id="searchInput"
          class="form-control-sm"
          field="searchQuery"
          autocomplete="off"
          placeholder="Искать..."
          >Поиск:</base-input-component
        ><button class="btn btn-outline-secondary btn-sm">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-search"
            viewBox="0 0 16 16"
          >
            <path
              d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"
            />
          </svg>
        </button>
      </div>
    </div>
    <search-results
      v-if="isResultsVisible"
      :searchQuery="searchQuery"
      :searchType="searchType"
      :activeSuggestion="activeSuggestion"
      @hide="moveFocusToInput"
      @clear-form="clearForm"
      ref="searchResultsContainer"
      class="search-results-container"
      :style="resultsContainerStyle"
    />
  </form>
</template>

<script>
import SearchResults from "./SearchResults.vue";
export default {
  components: { SearchResults },
  data() {
    return {
      searchQuery: "",
      searchType: "product",
      loading: false,
      searchOptions: [
        { value: "author", text: "По автору", disabled: false },
        { value: "product", text: "По названию", disabled: false },
      ],
      resultsContainerStyle: {},
      activeSuggestion: "",
      isResultsVisible: false,
    };
  },

  mounted() {
    this.resultsContainerStyle = {
      top:
        this.$refs.searchInput.offsetTop +
        this.$refs.searchInput.offsetHeight +
        "px",
      left: this.$refs.searchInput.offsetLeft + "px",
    };
  },

  methods: {
    fetchSearchedProducts(e) {
      e.preventDefault();
      this.loading = true;
      const params = {
        query: this.searchQuery,
        type: this.searchType,
      };
      this.$router.push({ name: "search.products", query: params });
      this.clearForm();
    },

    moveFocusToSuggestions(e) {
      if (e.key !== "ArrowDown" && e.key !== "ArrowUp") return;
      e.preventDefault();
      if (e.key === "ArrowDown") {
        this.activeSuggestion = "first";
      } else if (e.key === "ArrowUp") {
        this.activeSuggestion = "last";
      }
      this.$refs.searchResultsContainer.$el.focus();
    },

    moveFocusToInput() {
      this.hideResults();
      this.$refs.searchInput.firstElementChild.focus();
    },

    clearForm() {
      this.searchQuery = "";
    },

    showResults() {
      this.isResultsVisible = true;
      document.addEventListener("click", this.hideResultsByClick);
      document.addEventListener("keydown", this.hideResultsByEscape, {
        once: true,
      });
    },

    hideResultsByEscape(e) {
      if (e.key === "Escape") {
        this.hideResults();
      }
    },

    hideResultsByClick(e) {
      if (e.target.id !== "searchInput" && e.target.id !== "searchSelect") {
        this.hideResults();
      }
    },

    hideResults() {
      this.isResultsVisible = false;
      this.activeSuggestion = "";
      document.removeEventListener("click", this.hideResultsByClick);
      document.removeEventListener("keydown", this.hideResultsByEscape);
    },
  },

  watch: {
    searchQuery(newVal) {
      if (newVal.length > 1) {
        this.showResults();
      } else {
        this.hideResults();
      }
    },
  },
};
</script>

<style scoped>
.search-results-container {
  position: absolute;
  z-index: 999;
  width: 90vw;
  max-width: 700px;
}
</style>