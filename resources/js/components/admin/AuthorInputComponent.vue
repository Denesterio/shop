<template>
  <div class="form-group">
    <label for="authors">Автор:</label>
    <input
      list="authorDatalist"
      v-model="currentAuthor"
      @keydown.enter.prevent="addAuthorToAuthors"
      class="form-control"
      :class="{ 'is-invalid': getErrorMessage('title') || error }"
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
    <p v-if="getErrorMessage('title')" class="error-msg invalid-feedback">
      {{ getErrorMessage("title") }}
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
import RequestBuilder from "../../api/requestBuilder.js";
import { onlyTitleSchema } from "../../validate.js";
import СreateError from "../../services/createError.js";
import validationMixin from "../../mixins/validationMixin.js";

export default {
  mixins: [validationMixin], // data: errors: [], methods: getErrorMessage(field)
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
    new RequestBuilder("authors").get().then((data) => (this.authors = data));
  },

  methods: {
    async createNewAuthor() {
      const isError = await this.validate(onlyTitleSchema, {
        title: this.currentAuthor,
      });
      if (isError) return;

      const fData = new FormData();
      fData.append("title", this.currentAuthor);

      this.processing = true;
      new RequestBuilder("author")
        .create(fData)
        .then(({ data }) => {
          this.authors = [data, ...this.authors];
          this.currentAuthor = "";
          this.productAuthors.push(data);
        })
        .catch((error) => {
          this.handleServerError(error, "добавить автора");
        })
        .finally(() => {
          this.processing = false;
        });
    },

    addAuthorToAuthors() {
      if (this.currentAuthor === this.filteredAuthors[0]?.title) {
        this.$emit("add-author", this.filteredAuthors[0]);
        this.productAuthors.push(this.filteredAuthors[0]);
        this.currentAuthor = "";
      } else {
        this.errors = [new СreateError("title", "Такого автора нет в базе")];
      }
    },

    clearAuthors() {
      this.productAuthors = [];
      this.$emit("clear-authors");
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