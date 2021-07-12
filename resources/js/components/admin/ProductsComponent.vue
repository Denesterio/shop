<template>
  <div class="container mt-5">
    <div class="container-xl mb-5">
      <h2>Добавить товар</h2>

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
        <p
          v-if="validationErrors.description.length > 0"
          class="invalid-feedback"
        >
          {{ validationErrors.description }}
        </p>
      </div>

      <author-component
        class="form-group"
        @add-author="addAuthorToAuthors"
        @clear-authors="clearProductAuthors"
      />

      <div class="form-group">
        <b-button
          v-b-toggle="'collapse-tags'"
          class="m-1 btn-primary"
          :class="{ 'is-invalid': validationErrors.tags }"
          >Выбрать тэги</b-button
        >
        <router-link :to="{ name: 'tags' }"
          >на страницу добавления тэгов</router-link
        >
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
                :value="tag.id"
                >{{ tag.title }}</b-form-checkbox
              >
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
        <label for="picture">Загрузить изображение товара:</label>
        <input
          @change="getPicture"
          class="form-control-file"
          name="picture"
          type="file"
        />
      </div>

      <div class="form-group">
        <label for="category">Категория:</label>
        <p>
          <router-link :to="{ name: 'categories' }"
            >на страницу добавления категорий</router-link
          >
        </p>
        <select v-model="categoryId" class="form-control" name="category">
          <option value="" selected>Все</option>
          <option
            v-for="category in categories"
            :key="category.id"
            :value="category.id"
          >
            {{ category.title }}
          </option>
        </select>
      </div>

      <div class="form-group">
        <label for="subcategory">Подкатегория:</label>
        <p>
          <router-link :to="{ name: 'subcategories' }"
            >на страницу добавления подкатегорий</router-link
          >
        </p>
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

      <create-button-component
        @click.native="createNewProduct"
        :processing="processing"
      />
    </div>
    <div class="container-xl">
      <svg-loading-component v-if="loading" />
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
import {
  getProducts,
  getCategories,
  getSubcategories,
  getTags,
} from "../../api/get.js";
import { createProduct } from "../../api/create.js";
import { deleteProduct } from "../../api/delete.js";
import { isValid, fillErrors } from "../../validate.js";
import CreateButtonComponent from "./CreateButtonComponent.vue";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
import AuthorComponent from "./AuthorComponent.vue";
export default {
  components: { SvgLoadingComponent, AuthorComponent, CreateButtonComponent },

  data() {
    return {
      productName: "",
      productDescription: "",
      productPrice: "",
      picture: [],
      subcategorySlug: "",
      productAuthors: [], // массив авторов - объектов, связан с параграфом
      selected: [], // массив тэгов

      authors: [],
      products: [],
      categoryId: "",
      categories: [],
      subcategories: [],
      tags: [],

      loading: true,
      processing: false,
      validationErrors: {
        name: "",
        description: "",
        price: "",
        subcategorySlug: "",
        productAuthors: "", // если массив авторов пустой
        tags: "",
      },
    };
  },
  computed: {
    filteredSubcategories() {
      return this.subcategories.filter((subcat) =>
        this.categoryId ? subcat["category_id"] === this.categoryId : true
      );
    },

    filteredProducts() {
      return this.products.filter((prod) =>
        this.subcategorySlug
          ? prod["subcategory_slug"] === this.subcategorySlug
          : true
      );
    },
  },

  created() {
    const promises = [
      getCategories().then(({ data }) => (this.categories = data)),
      getSubcategories().then(({ data }) => (this.subcategories = data)),
      getProducts().then(({ data }) => (this.products = data.reverse())),
      getTags().then(({ data }) => (this.tags = data)),
    ];
    Promise.all(promises).finally(() => (this.loading = false));
  },

  methods: {
    addAuthorToAuthors(author) {
      this.productAuthors.push(author);
    },

    clearProductAuthors() {
      this.productAuthors = [];
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
        productAuthors:
          this.productAuthors.length > 0
            ? JSON.stringify(this.productAuthors.map((a) => a.id))
            : [],
        tags: this.selected.length > 0 ? JSON.stringify(this.selected) : [],
      };

      if (!isValid(params, ["picture"])) {
        fillErrors(this.validationErrors, params, ["picture"]);
        this.processing = false;
        return;
      }

      for (const param in params) {
        fData.append(param, params[param]);
      }

      createProduct(fData)
        .then(({ data }) => {
          this.products = [data, ...this.products];
        })
        .finally(() => {
          this.processing = false;
        });
    },

    removeProduct(productId) {
      deleteProduct(productId).then(
        () =>
          (this.products = this.products.filter(
            (prod) => prod.id !== productId
          ))
      );
    },
  },

  watch: {
    productName() {
      this.validationErrors.name = "";
    },
    subcategorySlug() {
      this.validationErrors.subcategorySlug = "";
    },
    productDescription() {
      this.validationErrors.description = "";
    },
    productPrice() {
      this.validationErrors.price = "";
    },
  },
};
</script>

<style scoped>
label {
  font-weight: bold;
  font-size: 1rem;
}
</style>
