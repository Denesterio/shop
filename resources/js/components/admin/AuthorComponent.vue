<template>
  <div class="form-group">
    <label for="authors">Автор:</label>
    <p>
      <router-link :to="{ name: 'authors' }">{{
        $t("link.toAuthors")
      }}</router-link>
    </p>
    <input
      list="authorDatalist"
      v-model="currentAuthor"
      @keyup.enter="addAuthorToAuthors"
      class="form-control"
      :class="{ 'is-invalid': validationErrors.title || error }"
      :disabled="processing"
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
    <p v-if="validationErrors.title.length" class="error-msg invalid-feedback">
      {{ validationErrors.title }}
      <a
        @click.prevent="createNewAuthor"
        href=""
        :class="{ 'text-decoration-line-through': processing }"
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
import {
  onlyTitleSchema,
  handleServerErrors,
  fillErrorsObject,
} from "../../validate.js";

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
      authors: [],
      processing: false,
      validationErrors: {
        title: "",
      },
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
      onlyTitleSchema
        .validate({ title: this.currentAuthor })
        .then((params) => {
          this.processing = true;
          createAuthor(params)
            .then(({ data }) => {
              this.authors = [data, ...this.authors];
              this.addAuthorToAuthors();
            })
            .catch(() => {
              handleServerErrors(this, error, "автора");
            })
            .finally(() => (this.processing = false));
        })
        .catch((error) => fillErrorsObject(this.validationErrors, error));
    },

    addAuthorToAuthors() {
      if (this.currentAuthor === this.filteredAuthors[0]?.title) {
        this.$emit("add-author", this.filteredAuthors[0]);
        this.productAuthors.push(this.filteredAuthors[0]);
        this.currentAuthor = "";
      } else {
        this.validationErrors.title = "Такого автора нет в базе";
      }
    },

    clearAuthors() {
      this.productAuthors = [];
      this.$emit("clear-authors");
    },
  },

  watch: {
    currentAuthor() {
      this.validationErrors.title = "";
    },
  },
};
</script>

<style scoped>
.error-msg {
  font-size: 0.8rem;
}
label {
  font-weight: bold;
  font-size: 1rem;
}
</style>