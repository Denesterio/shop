<template>
  <div class="container mt-5">
    <form class="container mb-4">
      <h2 v-t="'label.coverAdd'">Добавить</h2>
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
          v-model.trim="coverName"
          v-focus
          @keydown.enter.prevent="createNewCover"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.title.length }"
          placeholder="Тип обложки"
        />

        <p v-if="validationErrors.title.length" class="invalid-feedback">
          {{ validationErrors.title }}
        </p>
      </div>

      <create-button-component
        @click.native.prevent="createNewCover"
        :processing="processing"
      />
    </form>
    <div class="container-xl">
      <svg-loading-component v-if="loading" />
      <ul v-else class="coverList">
        <li v-for="cover in covers" :key="cover.id" class="m-1">
          <span class="font-weight-bold">
            {{ cover.title }}
          </span>
          <a
            @click.prevent="removeCover(cover.id)"
            role="button"
            class="ml-3"
            aria-label="Close"
            noreferrer
            nofollow
          >
            Удалить
          </a>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import CreateButtonComponent from "./CreateButtonComponent.vue";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
import { getCovers } from "../../api/get.js";
import { deleteCover } from "../../api/delete.js";
import { createCover } from "../../api/create.js";
import {
  onlyTitleSchema,
  handleServerErrors,
  fillErrorsObject,
} from "../../validate.js";
export default {
  components: { CreateButtonComponent, SvgLoadingComponent },
  data() {
    return {
      coverName: "",
      covers: [],
      loading: true,
      processing: false,
      validationErrors: {
        title: "",
      },
    };
  },

  mounted() {
    getCovers()
      .then((data) => (this.covers = data))
      .finally(() => (this.loading = false));
  },

  methods: {
    createNewCover() {
      const params = {
        title: this.coverName,
      };

      onlyTitleSchema
        .validate(params, { abortEarly: false })
        .then(() => {
          this.processing = true;
          createCover(params)
            .then(({ data }) => {
              this.covers = [data, ...this.covers];
              this.coverName = "";
            })
            .catch((error) => {
              handleServerErrors(this, error, "добавить обложку");
            })
            .finally(() => {
              this.processing = false;
            });
        })
        .catch((error) => fillErrorsObject(this.validationErrors, error));
    },

    removeCover(coverId) {
      deleteCover(coverId).then(() => {
        this.covers = this.covers.filter((tag) => cover.id !== coverId);
      });
    },
  },
  watch: {
    coverName() {
      this.validationErrors.title = "";
    },
  },
};
</script>

<style scoped>
.coverList {
  column-count: 2;
}
</style>