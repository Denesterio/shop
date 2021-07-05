<template>
  <div class="container mt-5">
    <form class="container-xl mb-4">
      <h1>{{ title }}</h1>
      <p><a href="/admin/categories">на страницу добавления категорий</a></p>
      <p><a href="/admin/subcategories">на страницу добавления подкатегорий</a></p>
      <p><a href="/admin/products">на страницу добавления товаров</a></p>

      <div class="form-group">
        <input
          v-model.trim="tagName"
          v-focus
          class="form-control"
          :class="{ 'is-invalid': validationErrors.name }"
          placeholder="Название тэга"
        />

        <p v-if="validationErrors.name" class="invalid-feedback fsw-italic">
          {{ validationErrors.name }}
        </p>
      </div>

      <button
          @click.prevent="createNewTag"
          type="submit"
          :disabled="processing"
          class="btn btn-success">
        <div
          v-if="processing"
          class="spinner-border text-light spinner-border-sm"
          role="status">
          <span class="visually-hidden"></span>
        </div>
        <span v-else>Сохранить</span>
      </button>
    </form>
    <div class="container-xl">
      <svg-loading-component v-if="loading" />
      <ul v-else style="column-count: 3">
        <li
          v-for="tag in tags"
          :key="tag.id"
          class="m-1"
        >
          <span class="font-weight-bold">
              {{ tag.title }}
          </span>
          <a
            @click="removeTag(tag.id)"
            role="button"
            class="ml-3"
            aria-label="Close"
            noreferrer
          >
            Удалить
          </a>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import { getTags } from '../../api/get.js';
  import { deleteTag } from '../../api/delete.js';
  import { isValid, fillErrors } from '../../validate.js';
  export default {
    props: ['title'],
    data() {
      return {
        tagName: '',
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
        .then((data) => (this.tags = data))
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
        axios
          .post('/admin/tags/create', params)
          .then(({ data }) => {
            this.tags.push(data.tag);
            this.tagName = '';
          })
          .finally(() => {
            this.processing = false;
          });
      },
      removeTag(tagId) {
        deleteTag(tagId).then(() => {
          const removedIndex = this.tags.indexOf(this.tags.find((tag) => tag.id === tagId));
          this.tags.splice(removedIndex, 1);
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
