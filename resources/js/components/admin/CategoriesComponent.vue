<template>
  <div class="container mt-5">
    <div class="container-xl mb-4">
      <h1>Добавить категорию</h1>
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
          v-model.trim="categoryName"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.name }"
          placeholder="Имя новой категории"
        />

        <p v-if="validationErrors.name" class="invalid-feedback fsw-italic">
          {{ validationErrors.name }}
        </p>
      </div>

      <div class="form-group">
        <textarea
          v-model="categoryDesc"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.desc }"
          placeholder="Описание новой категории"
        >
        </textarea>
        <div v-if="validationErrors.desc" class="invalid-feedback">
          {{ validationErrors.desc }}
        </div>
      </div>

      <create-button-component @click.native="createNewCategory" :processing="processing" />
    </div>

    <div class="container-xl">
      <svg-loading-component v-if="loading" />
      <ul v-else class="list-group">
        <li
          v-for="category in categories"
          :key="category.id"
          class="list-group-item d-flex justify-content-between align-items-start"
        >
          <div class="ms-2 me-auto font-weight-light">
            <div class="font-weight-bold">
              {{ category.title }}
            </div>
            {{ category.description }}
          </div>
          <button
            @click="removeCategory(category.id)"
            type="button"
            class="btn btn-danger"
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
  import CreateButtonComponent from './CreateButtonComponent.vue';
  import SvgLoadingComponent from '../svg/SvgLoadingComponent.vue';
  import { createCategory } from "../../api/create.js";
  import { getCategories } from '../../api/get.js';
  import { deleteCategory } from '../../api/delete.js';
  import { isValid, fillErrors } from '../../validate.js';
  export default {
    components: { CreateButtonComponent, SvgLoadingComponent },
    data() {
      return {
        categoryName: '',
        categoryDesc: '',

        categories: [],

        loading: true,
        processing: false,
        validationErrors: {
          name: null,
          desc: null,
        },
      };
    },
    mounted() {
      getCategories()
        .then(({ data }) => (this.categories = data))
        .finally(() => (this.loading = false));
    },
    methods: {
      createNewCategory() {
        this.processing = true;
        const params = {
          name: this.categoryName,
          desc: this.categoryDesc,
        };

        if (!isValid(params)) {
          fillErrors(this.validationErrors, params);
          this.processing = false;
          return;
        }

        createCategory(params)
          .then(() => {
            this.categories = [data, ...this.categories];
          })
          .finally(() => {
            this.processing = false;
          });
      },
      removeCategory(categoryId) {
        deleteCategory(categoryId).then(() => {
          this.categories = this.categories.filter((cat) => cat.id !== categoryId)
        });
      },
    },
    watch: {
      categoryName() {
        this.validationErrors.name = null;
      },
      categoryDesc() {
        this.validationErrors.desc = null;
      },
    },
  };
</script>
