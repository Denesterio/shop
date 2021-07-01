<template>
  <div class="container mt-5">
    <div class="container-xl mb-5">
      <h1>Добавить товар</h1>

      <div class="form-group">
        <input
          v-model="productName"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.name }"
          placeholder="Имя нового продукта"
        />
        <p v-if="validationErrors.name.length > 0" class="invalid-feedback">
          {{ validationErrors.name }}
        </p>
      </div>

      <div class="form-group">
        <textarea
          v-model="productDescription"
          rows="5"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.description }"
          placeholder="Описание товара"
        >
        </textarea>
        <p v-if="validationErrors.description.length > 0" class="invalid-feedback">
          {{ validationErrors.description }}
        </p>
      </div>

      <div class="form-group">
        <input
          list="authorDatalist"
          v-model="currentAuthor"
          @keyup.enter="addAuthorToAuthors"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.currentAuthor || validationErrors.productAuthors || validationErrors.currentAuthor }"
          placeholder="Автор"
        />
        <datalist v-if="filteredAuthors.length > 0" id="authorDatalist">
          <option
            v-for="author in filteredAuthors"
            :key="author.id"
            :value="author.title"
          ></option>
        </datalist>
        <p
          class="font-weight-bolder m-1 p-1 font-italic"
        > {{ formattedAuthors }}
        </p>
        <p v-if="validationErrors.productAuthors.startsWith('Поле ')" class="text-danger">
          {{ validationErrors.productAuthors }}
        </p>
        <p v-else-if="validationErrors.productAuthors === 'нет в базе'" class="text-danger">
          Такого автора нет в базе <a @click.prevent="createAuthor" href="" noreferrer>добавить</a>
        </p>
      </div>

      <div class="form-group">

        <b-button
          v-b-toggle="'collapse-tags'"
          class="m-1 btn-primary"
          :class="{ 'is-invalid': validationErrors.tags }"
        >Выбрать тэги</b-button>
        <a href="/admin/tags">На страницу добавления тэгов</a>
        <b-collapse id="collapse-tags" class="mt-3">
          <b-form-group v-slot="{ ariaDescribedby }">
            <b-form-checkbox-group
              id="checkbox-group-tags"
              v-model="selected"
              :aria-describedby="ariaDescribedby"
              name="productTags"
            >
              <b-form-checkbox
                v-for="tag in tags"
                :key="tag.id"
                :value="tag.id">{{ tag.title }}</b-form-checkbox>
            </b-form-checkbox-group>
          </b-form-group>
        </b-collapse>
        <p v-if="validationErrors.tags" class="invalid-feedback">
          {{ validationErrors.tags }}
        </p>
      </div>

      <div class="form-group">
        <input
          v-model="productPrice"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.price }"
          placeholder="Цена"
        />
        <p v-if="validationErrors.price.length > 0" class="invalid-feedback">
          {{ validationErrors.price }}
        </p>
      </div>

      <div class="form-group">
        <label style="font-weight: bold; font-size: 1rem" for="picture"
          >Загрузить изображение товара:</label
        >
        <input @change="getPicture" class="form-control-file" name="picture" type="file" />
      </div>

      <div class="form-group">
        <label style="font-weight: bold; font-size: 1rem" for="category">Категория:</label>
        <p><a href="/admin/categories">на страницу добавления категорий</a></p>
        <select v-model="categoryId" class="form-control" name="category">
          <option value="" selected>Все</option>
          <option v-for="category in categories" :key="category.id" :value="category.id">
            {{ category.title }}
          </option>
        </select>
      </div>

      <div class="form-group">
        <label style="font-weight: bold; font-size: 1rem" for="subcategory">Подкатегория:</label>
        <p><a href="/admin/subcategories">на страницу добавления подкатегорий</a></p>
        <select
          v-model="subcategorySlug"
          class="form-control"
          :class="{ 'is-invalid': validationErrors.subcategorySlug }"
          name="subcategory"
        >
          <option value="" selected>Все</option>
          <option
            v-for="subcategory in filteredSubcategories"
            :key="subcategory.id"
            :value="subcategory.slug"
          >
            {{ subcategory.title }}
          </option>
        </select>
        <p v-if="validationErrors.subcategorySlug" class="invalid-feedback">
          {{ validationErrors.subcategorySlug }}
        </p>
      </div>

      <button @click="createNewProduct" :disabled="processing" class="btn btn-success">
        <div v-if="processing" class="spinner-border text-light spinner-border-sm" role="status">
          <span class="visually-hidden"></span>
        </div>
        <span v-else>Сохранить</span>
      </button>
    </div>
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
      <ul v-else-if="filteredProducts.length > 0">
        <li
          v-for="product in filteredProducts"
          :key="product.id"
          class="row justify-content-between mb-2 p-2"
        >
          <div class="col-11 p-2 border-bottom">
            {{ product.title }} / {{ product.subcategory_slug }}
          </div>
          <button
            @click="removeProduct(product.id)"
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
  import { getProducts, getAuthors } from '../../api/get.js';
  import { deleteProduct } from '../../api/delete.js';
  import { isValid, fillErrors } from '../../validate.js';
  export default {
    props: ['categories', 'subcategories', 'tags'],
    data() {
      return {
        productName: '',
        productDescription: '',
        productPrice: '',
        picture: [],
        subcategorySlug: '',
        productAuthors: [], // массив авторов - объектов, связан с параграфом
        currentAuthor: '', // текущий автор связан с инпутом
        selected: [], // массив тэгов

        authors: [],
        products: [],
        categoryId: '',

        loading: true,
        processing: false,
        validationErrors: {
          name: '',
          description: '',
          price: '',
          subcategorySlug: '',
          productAuthors: '', // если массив авторов пустой
          tags: '',
        },
      };
    },
    computed: {
      filteredSubcategories() {
        return this.subcategories.filter((subcat) =>
          this.categoryId ? subcat['category_id'] === this.categoryId : true
        );
      },

      filteredProducts() {
        return this.products.filter((prod) =>
          this.subcategorySlug ? prod['subcategory_slug'] === this.subcategorySlug : true
        );
      },

      filteredAuthors() {
        if (this.currentAuthor.length > 1) {
          return this.authors
            .filter((a) =>
              a.title.toLowerCase().startsWith(this.currentAuthor.toLowerCase())
            )
            .slice(0, 10);
        }
        return [];
      },

      formattedAuthors() {
        return this.productAuthors.map((a) => a.title).join(', ');
      }
    },

    created() {
      getProducts()
        .then((data) => (this.products = data))
        .finally(() => (this.loading = false));
      getAuthors().then((data) => this.authors = data);
    },

    methods: {
      addAuthorToAuthors() {
        if (this.currentAuthor === this.filteredAuthors[0]?.title) {
          this.productAuthors.push(this.filteredAuthors[0]);
          this.currentAuthor = '';
        } else {
          this.validationErrors.productAuthors = 'нет в базе';
        }
      },

      getPicture(e) {
        this.picture = e.target.files[0];
      },

      createNewProduct() {
        this.processing = true;
        let fData = new FormData();
        const params = {
          name: this.productName,
          description: this.productDescription,
          price: this.productPrice,
          subcategorySlug: this.subcategorySlug,
          picture: this.picture,
          productAuthors: this.productAuthors.length > 0 ? JSON.stringify(this.productAuthors.map((a) => a.id)) : [],
          tags: this.selected.length > 0 ? JSON.stringify(this.selected) : [],
        };

        if (!isValid(params, ['picture'])) {
          fillErrors(this.validationErrors, params, ['picture']);
          this.processing = false;
          return;
        }

        for (const param in params) {
          fData.append(param, params[param]);
        }


        axios
          .post('/admin/products/create', fData)
          .then(() => {
            document.location.reload();
          })
          .finally(() => {
            this.processing = false;
          });
      },

      createAuthor() {
        if (this.currentAuthor.length === 0) {
          this.validationErrors.productAuthors = 'Поле не должно быть пустым';
          return;
        }

        this.processing = true;
        axios
          .post('/admin/authors/create', { name: this.currentAuthor })
          .then(({ data }) => {
            this.authors = [({ title: this.currentAuthor, id: data.id }), ...this.authors];
            this.validationErrors.productAuthors = '';
            this.addAuthorToAuthors();
          })
          .finally(() => (this.processing = false));
      },

      removeProduct(productId) {
        deleteProduct(productId).then(() => document.location.reload());
      },
    },

    watch: {
      productName() {
        this.validationErrors.name = '';
      },
      subcategorySlug() {
        this.validationErrors.subcategorySlug = '';
      },
      productDescription() {
        this.validationErrors.description = '';
      },
      productPrice() {
        this.validationErrors.price = '';
      },
      currentAuthor() {
        this.validationErrors.productAuthors = '';
      },
    },
  };
</script>
