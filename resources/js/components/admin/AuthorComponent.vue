<template>
  <div class="form-group">
    <input
      list="authorDatalist"
      v-model="currentAuthor"
      @keyup.enter="addAuthorToAuthors"
      class="form-control"
      :class="{ 'is-invalid': validationError || error }"
      placeholder="Автор"
      :disabled="processing"
    />
    <p v-if="error.length > 0" class="invalid-feedback">
      {{ error }}
    </p>
    <datalist v-if="filteredAuthors.length" id="authorDatalist">
      <option
        v-for="author in filteredAuthors"
        :key="author.id"
        :value="author.title"
      ></option>
    </datalist>
    <p v-if="validationError.length" class="error-msg invalid-feedback">
      {{ validationError }}
      <a
        @click.prevent="createNewAuthor"
        href=""
        noreferrer
        nofollow
        :disabled="processing"
        >добавить</a
      >
    </p>
    <p class="font-weight-bolder m-1 p-1 font-italic">
      {{ formattedAuthors }}
      <a
        @click.prevent="clearAuthors"
        v-if="productAuthors.length"
        href=""
        noreferrer
        nofollow
        class="font-weight-normal"
        >очистить</a
      >
    </p>
  </div>
</template>

<script>
import { getAuthors } from "../../api/get.js";
import { createAuthor } from "../../api/create.js";
import { onlyNameSchema } from "../../validate.js";

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
      productAuthors: [],
      validationError: "",
      authors: [],
      processing: false,
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

    formattedAuthors() {
      return this.productAuthors.map((a) => a.title).join(", ");
    },
  },

  mounted() {
    getAuthors().then((data) => (this.authors = data));
  },

  methods: {
    createNewAuthor() {
      onlyNameSchema
        .validate(this.currentAuthor)
        .then(() => {
          this.processing = true;
          createAuthor(this.currentAuthor)
            .then(({ data }) => {
              this.authors = [data, ...this.authors];
              this.validationError = "";
              this.addAuthorToAuthors();
            })
            .finally(() => (this.processing = false));
        })
        .catch((error) => (this.validationError = error.message));
    },

    addAuthorToAuthors() {
      if (this.currentAuthor === this.filteredAuthors[0]?.title) {
        this.$emit("add-author", this.filteredAuthors[0]);
        this.productAuthors.push(this.filteredAuthors[0]);
        this.currentAuthor = "";
      } else {
        this.validationError = "Такого автора нет в базе";
      }
    },

    clearAuthors() {
      this.productAuthors = [];
      this.$emit("clear-authors");
    },
  },

  watch: {
    currentAuthor() {
      this.validationError = "";
    },
  },
};
</script>

<style scoped>
.error-msg {
  font-size: 0.8rem;
}
</style>