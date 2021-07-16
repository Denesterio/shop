<template>
  <div class="container mt-5">
    <form class="container-xl mb-4">
      <h2>Добавить автора:</h2>
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
          $t("link.toAdminPage") + " " + $tc("message.product", 0)
        }}</router-link>
      </p>

      <div class="form-group">
        <input
          v-model.trim="currentAuthor"
          v-focus
          class="form-control"
          :class="{ 'is-invalid': error }"
          placeholder="Имя и фамилия автора полностью"
        />

        <p v-if="error" class="invalid-feedback fsw-italic">
          {{ error }}
        </p>
      </div>

      <create-button-component
        @click.native="createNewAuthor"
        :processing="processing"
      />
    </form>
    <svg-loading-component v-if="processing" />
    <div v-else class="container-xl">
      <ul class="list-group">
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
  </div>
</template>

<script>
import { createAuthor } from "../../api/create.js";
import { getAuthors } from "../../api/get.js";
import { deleteAuthor } from "../../api/delete.js";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
import CreateButtonComponent from "./CreateButtonComponent.vue";
export default {
  components: { SvgLoadingComponent, CreateButtonComponent },

  data() {
    return {
      authors: [],
      currentAuthor: "",
      error: "",
      processing: false,
    };
  },

  mounted() {
    getAuthors().then(({ data }) => (this.authors = data.reverse()));
  },

  methods: {
    createNewAuthor() {
      if (this.currentAuthor.length === 0) {
        this.error = "Поле не должно быть пустым";
        return;
      }
      this.processing = true;
      createAuthor(this.currentAuthor)
        .then(({ data }) => {
          this.authors = [data, ...this.authors];
          this.validationError = "";
          this.currentAuthor = "";
        })
        .finally(() => (this.processing = false));
    },

    removeAuthor(authorId) {
      deleteAuthor(authorId)
        .then(() => this.authors.filter((a) => a.id !== authorId))
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
      this.error = "";
    },
  },
};
</script>