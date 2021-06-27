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
      <div v-if="loading" class="text-center">
        <svg
          xmlns:svg="http://www.w3.org/2000/svg"
          xmlns="http://www.w3.org/2000/svg"
          xmlns:xlink="http://www.w3.org/1999/xlink"
          version="1.0"
          width="64px"
          height="64px"
          viewBox="0 0 128 128"
          xml:space="preserve"
        >
          <g>
            <circle cx="16" cy="64" r="16" fill="#000" />
            <circle cx="16" cy="64" r="16" fill="#555" transform="rotate(45,64,64)" />
            <circle cx="16" cy="64" r="16" fill="#949494" transform="rotate(90,64,64)" />
            <circle cx="16" cy="64" r="16" fill="#ccc" transform="rotate(135,64,64)" />
            <animateTransform
              attributeName="transform"
              type="rotate"
              values="0 64 64;315 64 64;270 64 64;225 64 64;180 64 64;135 64 64;90 64 64;45 64 64"
              calcMode="discrete"
              dur="800ms"
              repeatCount="indefinite"
            ></animateTransform>
          </g>
        </svg>
      </div>
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
        this.processing = true;
        const params = {
          name: this.tagName,
        };

        if (!isValid(params)) {
          fillErrors(this.validationErrors, params);
          this.processing = false;
          return;
        }

        axios
          .post('/admin/tags/create', params)
          .then(() => {
            document.location.reload();
          })
          .finally(() => {
            this.processing = false;
          });
      },
      removeTag(tagId) {
        deleteTag(tagId).then(() => document.location.reload());
      },
    },
    watch: {
      tagName() {
        this.validationErrors.name = null;
      },
    },
  };
</script>
