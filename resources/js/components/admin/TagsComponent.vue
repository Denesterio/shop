<template>
  <div class="container mt-5">
    <form class="container mb-4">
      <h2 v-t="'label.tagAdd'">Добавить тэг</h2>
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
          v-model.trim="tagName"
          v-focus
          @keydown.enter.prevent="createNewTag"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.title.length }"
          placeholder="Название тэга"
        />

        <p v-if="validationErrors.title.length" class="invalid-feedback">
          {{ validationErrors.title }}
        </p>
      </div>

      <create-button-component
        @click.native.prevent="createNewTag"
        :processing="processing"
      />
    </form>
    <div class="container-xl">
      <svg-loading-component v-if="loading" />
      <ul v-else class="tagList">
        <li v-for="tag in tags" :key="tag.id" class="m-1">
          <span class="font-weight-bold">
            {{ tag.title }}
          </span>
          <a
            @click.prevent="removeTag(tag.id)"
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
import { getTags } from "../../api/get.js";
import { deleteTag } from "../../api/delete.js";
import { createTag } from "../../api/create.js";
import {
  onlyTitleSchema,
  handleServerErrors,
  fillErrorsObject,
} from "../../validate.js";
export default {
  components: { CreateButtonComponent, SvgLoadingComponent },
  data() {
    return {
      tagName: "",
      tags: [],
      loading: true,
      processing: false,
      validationErrors: {
        title: "",
      },
    };
  },

  mounted() {
    getTags()
      .then((data) => (this.tags = data))
      .finally(() => (this.loading = false));
  },

  methods: {
    createNewTag() {
      const params = {
        title: this.tagName,
      };

      onlyTitleSchema
        .validate(params, { abortEarly: false })
        .then(() => {
          this.processing = true;
          createTag(params)
            .then(({ data }) => {
              this.tags = [data, ...this.tags];
              this.tagName = "";
            })
            .catch((error) => {
              handleServerErrors(this, error, "тэг");
            })
            .finally(() => {
              this.processing = false;
            });
        })
        .catch((error) => fillErrorsObject(this.validationErrors, error));
    },

    removeTag(tagId) {
      deleteTag(tagId).then(() => {
        this.tags = this.tags.filter((tag) => tag.id !== tagId);
      });
    },
  },
  watch: {
    tagName() {
      this.validationErrors.title = "";
    },
  },
};
</script>

<style scoped>
.tagList {
  column-count: 3;
}
</style>
