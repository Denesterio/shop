<template>
  <div class="container mt-4">
    <svg-loading-component v-if="loading" />
    <template v-else>
      <!-- breadcrumb -->
      <base-breadcrumb-component
        class=""
        :slug="product.subcategory_slug"
        :title="product.title"
      />
      <!-- main content, picture -->
      <div class="row">
        <section class="d-flex col-lg-5 col-md-4 justify-content-center">
          <product-picturies-component
            :pictures="product.pictures"
            :title="product.title"
          />
        </section>
        <!-- authors -->
        <section class="container col-lg-7 col-md-8">
          <p class="header_authors font-italic">
            <authors-link :authors="product.authors" />
          </p>
          <!-- title -->
          <h2>{{ product.title }}</h2>
          <!-- rating -->
          <product-rating-component :productId="product.id" />
          <!-- tags links -->
          <router-link
            v-for="tag in product.tags"
            :key="tag.id"
            :to="{ name: 'tag.show', params: { id: tag.id } }"
            class="badge bg-primary text-light mr-1"
            >{{ tag.title }}</router-link
          >

          <div class="row mt-2">
            <!-- table properties -->
            <div class="col-md-7">
              <product-properties-table :product="product" />
            </div>
            <!-- price block -->
            <div
              id="priceBadge"
              class="col-md-5 text-center p-4 d-flex flex-column mt-3"
            >
              <p class="price">{{ product.price }}&nbsp;руб.</p>
              <addto-cart-button-component
                size="lg"
                :productId="product.id"
                :title="product.title"
                class="justify-content-center"
              />
            </div>
          </div>
        </section>
      </div>
      <p id="productDescription" class="p-4">{{ product.description }}</p>
      <hr />
      <product-reviews-component :productId="product.id" />
    </template>
  </div>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";
import AddtoCartButtonComponent from "../AddtoCartButtonComponent.vue";
import ProductPicturiesComponent from "./ProductPicturiesComponent.vue";
import BaseBreadcrumbComponent from "../BaseBreadcrumbComponent.vue";
import ProductRatingComponent from "./ProductRatingComponent.vue";
import ProductReviewsComponent from "./ProductReviewsComponent.vue";
import AuthorsLink from "./AuthorsLink.vue";
import ProductPropertiesTable from "./ProductPropertiesTable.vue";
export default {
  components: {
    AddtoCartButtonComponent,
    ProductPicturiesComponent,
    BaseBreadcrumbComponent,
    ProductRatingComponent,
    ProductReviewsComponent,
    AuthorsLink,
    ProductPropertiesTable,
  },
  data() {
    return {
      product: {},
      loading: true,
    };
  },
  created() {
    new RequestBuilder("product")
      .get(this.$route.params.id)
      .then((data) => {
        this.product = data;
      })
      .finally(() => (this.loading = false));
  },
};
</script>

<style scoped>
h2 {
  font-family: "PT Sans", sans-serif;
  font-size: 1.5rem;
  font-weight: bold;
}
.header_authors {
  font-size: 0.9rem;
  margin-bottom: 0.5rem;
}

.header_authors a {
  margin: 0 0.5rem;
}

.table {
  font-size: 0.9rem;
}

#priceBadge {
  max-width: 230px;
  min-width: 190px;
  max-height: fit-content;
  box-shadow: inset 0 0 0px 5px rgba(52, 144, 220, 0.6);
}

.price {
  font-size: 1.7rem;
  color: #3490dc;
  font-weight: bold;
}

#productDescription {
  font-size: 0.9rem;
  white-space: pre-wrap;
}
</style>