<template>
  <div class="container mt-5">
    <form class="container mb-4">
      <h2>Добавить автора</h2>
      <p>
        <router-link :to="{ name: 'categories' }">{{
          $t("link.toCategories")
        }}</router-link>
      </p>
      <p>
        <router-link :to="{ name: 'subcategories' }">{{
          $t("link.toSubcategories")
        }}</router-link>
      </p>
      <p>
        <router-link :to="{ name: 'products' }">{{
          $t("link.toProducts")
        }}</router-link>
      </p>

      <div class="form-group">
        <input
          v-model.trim="currentAuthor"
          v-focus
          class="form-control"
          :class="{ 'is-invalid': validationErrors.title.length }"
          placeholder="Имя и фамилия автора полностью"
        />

        <p v-if="validationErrors.title.length" class="invalid-feedback">
          {{ validationErrors.title }}
        </p>
      </div>

      <create-button-component
        @click.native.prevent="createNewAuthor"
        :processing="processing"
      />
    </form>
    <svg-loading-component v-if="loading" />

    <ul v-else class="list-group">
      <li
        v-for="author in authors"
        :key="author.id"
        class="row justify-content-between mb-2 p-2"
      >
        <div class="col-11 p-2 border-bottom">
          <router-link
            :to="{ name: 'authorProducts', params: { id: author.id } }"
            >{{ author.title }}</router-link
          >
        </div>
        <button
          @click="removeAuthor(author.id)"
          type="button"
          class="btn btn-outline-danger btn-sm col-1"
          aria-label="Close"
        >
          Удалить
        </button>
      </li>
    </ul>
  </div>
</template>

<script>
import { createAuthor } from "../../api/create.js";
import { getAuthors } from "../../api/get.js";
import { deleteAuthor } from "../../api/delete.js";
import {
  onlyTitleSchema,
  handleServerErrors,
  fillErrorsObject,
} from "../../validate.js";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
import CreateButtonComponent from "./CreateButtonComponent.vue";
export default {
  components: { SvgLoadingComponent, CreateButtonComponent },

  data() {
    return {
      authors: [],
      currentAuthor: "",
      loading: true,
      processing: false,
      validationErrors: {
        title: "",
      },
    };
  },

  mounted() {
    getAuthors()
      .then((data) => (this.authors = data))
      .catch((error) => {})
      .finally(() => (this.loading = false));
  },

  methods: {
    createNewAuthor() {
      const params = {
        title: this.currentAuthor,
      };

      onlyTitleSchema
        .validate(params, { abortEarly: false })
        .then(() => {
          this.processing = true;
          createAuthor(params)
            .then(({ data }) => {
              this.authors = [data, ...this.authors];
              this.currentAuthor = "";
            })
            .catch(() => {
              handleServerErrors(this, error, "добавить автора");
            })
            .finally(() => (this.processing = false));
        })
        .catch((error) => {
          fillErrorsObject(this.validationErrors, error);
        });
    },

    removeAuthor(authorId) {
      deleteAuthor(authorId)
        .then(() => {
          this.authors = this.authors.filter((a) => {
            return a.id !== authorId;
          });
        })
        .catch((error) => {
          if (
            error.response.data.message.includes(
              "Integrity constraint violation"
            )
          ) {
            Vue.swal.fire({
              title: "Ошибка",
              text: "Нельзя удалить автора, на которого записаны книги",
              icon: "error",
              confirmButtonText: "OK",
            });
          }
        });
    },
  },

  watch: {
    currentAuthor() {
      this.validationErrors.title = "";
    },
  },
};
</script>