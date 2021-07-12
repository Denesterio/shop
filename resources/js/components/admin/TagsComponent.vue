<template>
  <div class="container mt-5">
    <form class="container-xl mb-4">
      <h1>Добавить тэг</h1>
      <p>
        <router-link :to="{ name: 'categories' }"
          >на страницу добавления категорий</router-link
        >
      </p>
      <p>
        <router-link :to="{ name: 'subcategories' }"
          >на страницу добавления подкатегорий</router-link
        >
      </p>
      <p>
        <router-link :to="{ name: 'products' }"
          >на страницу добавления товаров</router-link
        >
      </p>

      <div class="form-group">
        <input
          v-model.trim="tagName"
          v-focus
          @keydown.enter.prevent="createNewTag"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.name }"
          placeholder="Название тэга"
        />

        <p v-if="validationErrors.name" class="invalid-feedback fsw-italic">
          {{ validationErrors.name }}
        </p>
      </div>

      <create-button-component
        @click.native="createNewTag"
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
import { isValid, fillErrors } from "../../validate.js";
export default {
  components: { CreateButtonComponent, SvgLoadingComponent },
  data() {
    return {
      tagName: "",
      tags: [],
      loading: true,
      processing: false,
      validationErrors: {
        name: null,
      },
    };
  },

  mounted() {
    getTags()
      .then(({ data }) => (this.tags = data))
      .finally(() => (this.loading = false));
  },

  methods: {
    createNewTag() {
      const params = {
        name: this.tagName,
      };

      if (!isValid(params)) {
        fillErrors(this.validationErrors, params);
        this.processing = false;
        return;
      }

      this.processing = true;
      createTag(params)
        .then(({ data }) => {
          this.tags.push(data.tag);
          this.tagName = "";
        })
        .finally(() => {
          this.processing = false;
        });
    },
    removeTag(tagId) {
      deleteTag(tagId).then(() => {
        this.tags = this.tags.filter((tag) => tag.id !== tagId);
      });
    },
  },
  watch: {
    tagName() {
      this.validationErrors.name = null;
    },
  },
};
</script>

<style scoped>
.tagList {
  column-count: 3;
}
</style>
