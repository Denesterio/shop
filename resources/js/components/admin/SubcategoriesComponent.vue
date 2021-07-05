<template>
  <div class="container mt-5">
    <div class="container-xl mb-4">
      <h1>{{ title }}</h1>
      <p><a href="/admin/categories">На страницу добавления категорий</a></p>
      <p><a href="/admin/products">На страницу добавления товаров</a></p>

      <div class="form-group">
        <input
          v-model.trim="subcategoryName"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.name }"
          placeholder="Имя новой подкатегории"
        />

        <p v-if="validationErrors.name" class="invalid-feedback fsw-italic">
          {{ validationErrors.name }}
        </p>
      </div>

      <div class="form-group">
          <input
            v-if="slugStatus"
            v-model="slug"
            v-focus
            class="form-control"
            :class="{ 'is-invalid': validationErrors.slug }"
            placeholder="Заполнитель в строке адреса"
          />

          <div
            v-else
            @click="prepareForEditSlug"
            class="form-control text-muted"
          >
            {{ subcategorySlug || 'Заполнитель в строке адреса (кликните по полю для редактирования)' }}
          </div>

          <p v-if="validationErrors.slug" class="invalid-feedback">
            {{ validationErrors.slug }}
          </p>
      </div>

      <div class="form-group">
        <select
          v-model="categoryId"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.categoryId }"
        >
          <option value="" selected>Все</option>
          <option v-for="category in categories" :key="category.id" :value="category.id">
            {{ category.title }}
          </option>
        </select>
        <p v-if="validationErrors.categoryId" class="invalid-feedback">
          {{ validationErrors.categoryId }}
        </p>
      </div>

      <button @click="createNewSubcategory" :disabled="processing" class="btn btn-success">
        <div v-if="processing" class="spinner-border text-light spinner-border-sm" role="status">
          <span class="visually-hidden"></span>
        </div>
        <span v-else>Сохранить</span>
      </button>
    </div>

    <div class="container-xl">
      <ul class="list-group">
        <li
          v-for="subcategory in filteredSubcategories"
          :key="subcategory.id"
          class="row justify-content-between mb-2 p-2"
        >
          <div class="col-11 p-2 border-bottom">
            {{ subcategory.title }}
          </div>
          <button
            @click="removeSubcategory(subcategory.id)"
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
  import { deleteSubcategory } from '../../api/delete.js';
  import transliterate from '../../transliterate.js';
  import { isValid, fillErrors } from '../../validate.js';

  export default {
    props: ['title', 'subcategories', 'categories'],
    data() {
      return {
        subcategoryName: '',
        categoryId: '',
        slug: '',
        slugStatus: null,

        processing: false,
        validationErrors: {
          name: '',
          categoryId: '',
          slug: '',
        },
      };
    },

    computed: {
      subcategorySlug() {
        if (!this.slugStatus) {
          return transliterate.fromCyrillic(this.subcategoryName);
        }
      },

      filteredSubcategories() {
        return this.subcategories.filter((subcat) =>
          this.categoryId ? subcat['category_id'] === this.categoryId : true
        );
      },
    },

    methods: {
      prepareForEditSlug() {
        this.slug = this.subcategorySlug;
        this.slugStatus = 'edited';
      },

      createNewSubcategory() {
        this.processing = true;
        const params = {
          name: this.subcategoryName,
          categoryId: this.categoryId,
          slug: this.slugStatus ? this.slug : this.subcategorySlug,
        };

        if (!isValid(params)) {
          fillErrors(this.validationErrors, params);
          this.processing = false;
          return;
        }

        axios
          .post('/admin/subcategories/create', params)
          .then(() => {
            document.location.reload();
          })
          .finally(() => {
            this.processing = false;
          });
      },

      removeSubcategory(subId) {
        deleteSubcategory(subId).then(() => document.location.reload());
      },
    },
    watch: {
      subcategoryName() {
        this.validationErrors.name = '';
      },
      categoryId() {
        this.validationErrors.categoryId = '';
      },
    },
  };
</script>
