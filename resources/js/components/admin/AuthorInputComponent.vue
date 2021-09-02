<template>
  <div class="form-group">
    <label for="authors">Автор:</label>
    <input
      list="authorDatalist"
      v-model="currentAuthor"
      @keydown.enter.prevent="addAuthorToAuthors"
      class="form-control"
      :class="{ 'is-invalid': error.length }"
      name="authors"
    />
    <p v-if="error.length" class="invalid-feedback">
      {{ error }}
    </p>
    <datalist v-if="filteredAuthors.length" id="authorDatalist">
      <option
        v-for="author in filteredAuthors"
        :key="author.id"
        :value="author.title"
      ></option>
    </datalist>
  </div>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";

export default {
  props: {
    error: {
      type: String,
      required: false,
      default: "",
    },
  },

  data() {
    return {
      currentAuthor: "",
      authors: [],
    };
  },

  computed: {
    filteredAuthors() {
      if (this.currentAuthor.length > 1) {
        const regular = "(^|\\s)" + this.currentAuthor.toLowerCase();
        const regExp = new RegExp(regular);
        return this.authors
          .filter((a) => {
            return regExp.test(a.title.toLowerCase());
          })
          .slice(0, 10);
      }
      return [];
    },
  },

  mounted() {
    new RequestBuilder("authors").get().then((data) => (this.authors = data));
  },

  methods: {
    addAuthorToAuthors() {
      if (this.currentAuthor.length > 0) {
        const addedAuthor = this.filteredAuthors.find(
          (a) => a?.title === this.currentAuthor
        );
        if (addedAuthor) {
          this.$emit("add-author", addedAuthor);
          this.currentAuthor = "";
        }
      }
    },
  },
};
</script>

<style scoped>
.error-msg {
  font-size: 0.9rem;
}
label {
  font-weight: bold;
  font-size: 1.1rem;
}
a {
  font-size: 0.9rem;
}
</style>