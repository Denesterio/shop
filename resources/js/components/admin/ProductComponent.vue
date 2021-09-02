<template>
  <div class="container mt-5">
    <form class="container mb-5">
      <base-input-group-component
        v-model.trim="product.title"
        field="title"
        :error="getErrorMessage('title')"
        >{{ $t("label.newProduct") }}
      </base-input-group-component>

      <base-input-group-component
        v-model="product.description"
        type="textarea"
        field="description"
        :error="getErrorMessage('description')"
        >{{ $t("label.newProductDesc") }}
      </base-input-group-component>

      <author-input-component
        @add-author="addAuthorToAuthors"
        ref="authorsForm"
        :error="getErrorMessage('authors')"
      />

      <p class="font-weight-bolder m-1 p-1 font-italic">
        {{ formattedAuthors }}
        <a
          @click.prevent="clearAuthors"
          v-if="product.authors.length"
          href=""
          noreferrer
          nofollow
          class="font-weight-normal"
          v-t="'label.clear'"
        ></a>
      </p>

      <div class="form-group">
        <b-button
          v-b-toggle="'collapse-tags'"
          class="m-1 btn-primary"
          :class="{ 'is-invalid': false }"
          >Выбрать тэги</b-button
        >
        <b-collapse id="collapse-tags" class="mt-3">
          <b-form-group v-slot="{ ariaDescribedby }">
            <b-form-checkbox-group
              id="checkbox-group-tags"
              v-model="product.tags"
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

      <div class="row">
        <base-input-group-component
          v-model.number="product.price"
          field="price"
          type="number"
          :error="getErrorMessage('price')"
          class="col-md-4 col-xs-12"
          >{{ $t("keys.price") }}
        </base-input-group-component>

        <base-input-group-component
          v-model.number="product.pages"
          field="pages"
          type="number"
          :error="getErrorMessage('pages')"
          class="col-md-4 col-xs-12"
          >{{ $t("keys.pages") }}
        </base-input-group-component>

        <base-input-group-component
          v-model.number="product.year"
          field="year"
          type="number"
          :error="getErrorMessage('year')"
          class="col-md-4 col-xs-12"
          >{{ $t("keys.year") }}
        </base-input-group-component>
      </div>

      <div class="form-group mb-4">
        <label for="previewPicture" v-t="'label.pictureUpload'"></label>
        <input
          @change="getPicture"
          class="form-control-file"
          name="previewPicture"
          type="file"
          accept=".webp, .jpg, .jpeg"
        />
      </div>

      <div class="form-group mb-4">
        <label for="images" v-t="'label.imagesUpload'"></label>
        <p>
          <i18n path="label.filesToUpload" tag="span">
            <template v-slot:quantity>
              {{ `${$tc("label.file", product.images.length)}` }}
            </template>
          </i18n>
          <a
            @click.prevent="clearImages"
            v-if="product.images.length"
            href=""
            noreferrer
            nofollow
            class="font-weight-normal"
            >очистить</a
          >
        </p>
        <input
          @change="getImages"
          class="form-control-file"
          name="images[]"
          type="file"
          multiple
          accept=".webp, .jpg, .jpeg"
        />
      </div>

      <div class="row">
        <base-select-group-component
          v-model.number="product.cover"
          field="cover"
          :error="getErrorMessage('cover')"
          :entities="covers"
          class="col-md-4 col-xs-12"
          >{{ $t("keys.cover") }}
        </base-select-group-component>

        <base-select-group-component
          v-model.number="categoryId"
          field="category"
          :entities="categories"
          class="col-md-4 col-xs-12"
          >{{ $t("label.category") }}
        </base-select-group-component>

        <base-select-group-component
          v-model="product.subcategorySlug"
          field="subcategory"
          :error="getErrorMessage('subcategorySlug')"
          :entities="filteredSubcategories"
          class="col-md-4 col-xs-12"
          option-value="slug"
          >{{ $t("label.subcategory") }}
        </base-select-group-component>
      </div>

      <base-button-component
        @click.native.prevent="createNewProduct"
        :disabled="processing"
        bType="create"
        v-t="'label.create'"
      ></base-button-component>

      <base-button-component
        @click.native.prevent="clearForm"
        :disabled="processing"
        bType="clear"
        v-t="'label.clear'"
        class="ml-2"
      ></base-button-component>
    </form>

    <entity-list-component enType="product" :entities="products" />
  </div>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";
import { productSchema } from "../../validate.js";
import AuthorInputComponent from "./AuthorInputComponent.vue";
import validationMixin from "../../mixins/validationMixin.js";
import EntityListComponent from "./EntityListComponent.vue";
export default {
  name: "product-component",
  components: { AuthorInputComponent, EntityListComponent },
  mixins: [validationMixin], // data: errors: [], methods: getErrorMessage(field)
  data() {
    return {
      product: {
        title: "",
        description: "",
        price: "",
        picture: "",
        images: [],
        subcategorySlug: "",
        authors: [],
        tags: [],
        year: "",
        pages: "",
        cover: "",
      },

      authors: [],
      products: [],
      categoryId: "",
      categories: [],
      subcategories: [],
      tags: [],
      covers: [],

      loading: true,
      processing: false,
    };
  },
  computed: {
    filteredSubcategories() {
      return this.subcategories.filter((subcat) =>
        this.categoryId ? subcat["category_id"] === this.categoryId : true
      );
    },

    formattedAuthors() {
      if (this.product.authors.length > 0) {
        return this.product.authors.map((a) => a.title).join(", ");
      }
    },
  },

  created() {
    const promises = [
      new RequestBuilder("categories")
        .get()
        .then((data) => (this.categories = data)),
      new RequestBuilder("subcategories")
        .get()
        .then((data) => (this.subcategories = data)),
      new RequestBuilder("tags")
        .get()
        .then(
          (data) =>
            (this.tags = data.sort(({ title: a }, { title: b }) =>
              a < b ? -1 : 1
            ))
        ),
      new RequestBuilder("covers").get().then((data) => (this.covers = data)),
    ];
    Promise.all(promises).finally(() => (this.loading = false));
  },

  methods: {
    addAuthorToAuthors(author) {
      this.product.authors.push(author);
    },

    getPicture(e) {
      this.product.picture = e.target.files[0];
    },

    getImages(e) {
      if (e.target.files.length === 0) return;
      for (const file of e.target.files) {
        this.product.images.push(file);
      }
    },

    clearImages() {
      this.product.images = [];
    },

    async createNewProduct() {
      const params = {
        title: this.product.title,
        description: this.product.description,
        price: this.product.price,
        year: this.product.year,
        pages: this.product.pages,
        cover: this.product.cover,
        subcategorySlug: this.product.subcategorySlug,
        picture: this.product.picture,
        authors: JSON.stringify(this.product.authors),
        tags: JSON.stringify(this.product.tags),
      };

      const isError = await this.validate(productSchema, params);
      if (isError) return;

      const fData = new FormData();
      for (const param in params) {
        fData.append(param, params[param]);
      }

      for (const file of this.product.images) {
        fData.append("images[]", file);
      }

      this.processing = true;
      new RequestBuilder("product")
        .create(fData)
        .then(({ data }) => {
          this.products = [data, ...this.products];
          this.clearForm();
        })
        .catch((error) => {
          this.handleServerError(error, "добавить продукт");
        })
        .finally(() => {
          this.processing = false;
        });
    },

    clearForm() {
      for (const key in this.product) {
        if (key === "tags") {
          this.product[key] = [];
        } else {
          this.product[key] = "";
        }
      }
      this.clearAuthors();
    },

    clearAuthors() {
      this.product.authors = [];
    },
  },
};
</script>
