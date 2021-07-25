<template>
  <div class="container mt-5">
    <form class="container mb-5">
      <h2>{{ $t("label.productAdd") }}</h2>

      <div class="form-group">
        <input
          v-model="productName"
          class="form-control"
          :class="{
            'is-invalid': isFieldInvalid('title'),
          }"
          placeholder="Имя нового продукта"
        />
        <p class="invalid-feedback">
          {{ getErrorMessage("title") }}
        </p>
      </div>

      <div class="form-group">
        <textarea
          v-model="productDescription"
          rows="5"
          class="form-control"
          :class="{ 'is-invalid': isFieldInvalid('description') }"
          placeholder="Описание товара"
        >
        </textarea>
        <p class="invalid-feedback">
          {{ getErrorMessage("description") }}
        </p>
      </div>

      <author-component
        @add-author="addAuthorToAuthors"
        @clear-authors="clearProductAuthors"
        :error="getErrorMessage('productAuthors')"
      />

      <div class="form-group">
        <b-button
          v-b-toggle="'collapse-tags'"
          class="m-1 btn-primary"
          :class="{ 'is-invalid': false }"
          >Выбрать тэги</b-button
        >
        <router-link :to="{ name: 'tags' }">{{
          $t("link.toTags")
        }}</router-link>
        <b-collapse id="collapse-tags" class="mt-3">
          <b-form-group v-slot="{ ariaDescribedby }">
            <b-form-checkbox-group
              id="checkbox-group-tags"
              v-model="selectedTags"
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
        <p class="invalid-feedback">{{}}</p>
      </div>

      <div class="form-group">
        <input
          v-model="productPrice"
          class="form-control"
          :class="{ 'is-invalid': isFieldInvalid('price') }"
          placeholder="Цена"
        />
        <p class="invalid-feedback">
          {{ getErrorMessage("price") }}
        </p>
      </div>

      <div class="form-group">
        <label for="picture" v-t="'label.pictureUpload'"></label>
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
          <router-link :to="{ name: 'categories' }">{{
            $t("link.toCategories")
          }}</router-link>
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
        <label for="subcategory">Раздел:</label>
        <p>
          <router-link :to="{ name: 'subcategories' }">{{
            $t("link.toSubcategories")
          }}</router-link>
        </p>
        <select
          v-model="subcategorySlug"
          class="form-control"
          :class="{ 'is-invalid': isFieldInvalid('subcategorySlug') }"
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
        <p class="invalid-feedback">
          {{ getErrorMessage("subcategorySlug") }}
        </p>
      </div>

      <create-button-component
        @click.native.prevent="createNewProduct"
        :processing="processing"
      />
    </form>

    <svg-loading-component v-if="loading" />
    <ul v-else-if="filteredProducts.length">
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
          v-t="'label.delete'"
        ></button>
      </li>
    </ul>
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
import { productSchema, getErrors } from "../../validate.js";
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
      selectedTags: [], // массив тэгов

      authors: [],
      products: [],
      categoryId: "",
      categories: [],
      subcategories: [],
      tags: [],

      loading: true,
      processing: false,
      errors: [],
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
      getCategories().then((data) => (this.categories = data)),
      getSubcategories().then((data) => (this.subcategories = data)),
      getProducts().then((data) => (this.products = data)),
      getTags().then((data) => (this.tags = data)),
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

    async createNewProduct() {
      this.errors = [];
      const fData = new FormData();
      const params = {
        title: this.productName,
        description: this.productDescription,
        price: Number(this.productPrice),
        subcategorySlug: this.subcategorySlug,
        picture: this.picture,
        productAuthors: JSON.stringify(this.productAuthors.map((a) => a.id)),
        tags: JSON.stringify(this.selectedTags),
      };

      try {
        await productSchema.validate(params, {
          abortEarly: false,
        });
      } catch (error) {
        this.errors = getErrors(error);
        return;
      }

      for (const param in params) {
        fData.append(param, params[param]);
      }

      this.processing = true;
      createProduct(fData)
        .then(({ data }) => {
          this.products = [data, ...this.products];
        })
        .catch((error) => {
          try {
            this.errors = getErrors(error);
          } catch (err) {
            Vue.swal.fire({
              icon: "error",
              title: "Ошибка",
              text: this.$t("error.сreateError", { msg: "добавить продукт" }),
            });
          }
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

    isFieldInvalid(field) {
      return this.errors.some((error) => error.isFieldInvalid(field));
    },

    getErrorMessage(field) {
      return this.errors
        .find((error) => error.getField() === field)
        ?.getMessage();
    },
  },
};
</script>

<style scoped>
label {
  font-weight: bold;
  font-size: 1.1rem;
}
a {
  font-size: 0.9rem;
}
</style>
