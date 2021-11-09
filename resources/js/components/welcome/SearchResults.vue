<template>
  <div @keydown="handleKeydown" tabindex="0">
    <ul v-if="searchSuggestions.length > 0" class="list-group">
      <search-results-item
        v-for="(suggestion, i) in searchSuggestions"
        @click.native="goToResultsList(i)"
        :class="{ active: i === activeSuggestionIndex }"
        :key="suggestion.id"
      >
        <template v-slot:title
          ><router-link
            :to="{ name: `${searchType}.show`, params: { id: suggestion.id } }"
            class="text-reset"
            >{{ suggestion.title }}</router-link
          ></template
        >
        <template v-slot:right
          ><img
            :src="picturePath(suggestion.picture)"
            :alt="suggestion.title"
            :class="{
              'author-image': searchType === 'author',
              'product-image': searchType === 'product',
            }"
        /></template>
      </search-results-item>
    </ul>
  </div>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";
import SearchResultsItem from "./SearchResultsItem.vue";
export default {
  props: {
    searchQuery: {
      type: String,
      required: true,
    },

    searchType: {
      type: String,
      required: false,
      default: "",
    },

    activeSuggestion: {
      type: String,
      required: false,
      default: "",
    },
  },

  components: { SearchResultsItem },

  data() {
    return {
      searchSuggestions: [],
      activeSuggestionIndex: -1,
    };
  },

  builder: new RequestBuilder("search"),
  queryParams: {
    limit: 10,
    page: 1,
  },

  created() {
    this.fetchSearchResults();
  },

  methods: {
    fetchSearchResults() {
      if (this.searchQuery.length < 2) return;
      const params = {
        ...this.$options.queryParams,
        query: this.searchQuery,
        type: this.searchType,
      };
      this.$options.builder
        .withQueryParams(params)
        .get("preview")
        .then((data) => (this.searchSuggestions = data.data || []));
    },

    picturePath(picture) {
      if (picture) {
        return "/storage/img/" + picture;
      }

      if (this.searchType == "author") {
        return "/img/pen.svg";
      }

      return "/img/cap.svg";
    },

    handleKeydown(e) {
      switch (e.key) {
        case "ArrowDown":
          e.preventDefault();
          this.activeSuggestionIndex =
            this.activeSuggestionIndex === this.searchSuggestions.length - 1
              ? 0
              : this.activeSuggestionIndex + 1;
          break;
        case "ArrowUp":
          e.preventDefault();
          this.activeSuggestionIndex =
            this.activeSuggestionIndex === 0
              ? this.searchSuggestions.length - 1
              : this.activeSuggestionIndex - 1;
          break;
        case "Escape":
          this.$emit("hide");
          break;
        case "Enter":
          e.preventDefault();
          this.goToResultsList(this.activeSuggestionIndex);
          break;
        default:
          return;
      }
    },

    goToResultsList(i) {
      this.$router.push({
        name: `${this.searchType}.show`,
        params: {
          id: this.searchSuggestions[i].id,
        },
      });
      this.$emit("clear-form");
    },
  },

  watch: {
    searchQuery(newValue, oldValue) {
      if (newValue.length > oldValue.length) {
        this.fetchSearchResults();
      }
    },

    searchType() {
      this.fetchSearchResults();
    },

    activeSuggestion() {
      this.activeSuggestionIndex =
        this.activeSuggestion === "first"
          ? 0
          : this.searchSuggestions.length - 1;
    },
  },
};
</script>

<style scoped>
.product-image {
  height: 48px;
  width: auto;
}
.author-image {
  height: 24px;
  width: auto;
}
</style>