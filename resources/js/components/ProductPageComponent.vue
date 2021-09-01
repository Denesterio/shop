<template>
  <div class="container mt-4">
    <svg-loading-component v-if="loading" />
    <template v-else>
      <base-breadcrumb-component
        class=""
        :slug="product.subcategory_slug"
        :title="product.title"
      />
      <div class="row">
        <section class="d-flex col-lg-5 col-md-4 justify-content-center">
          <product-picturies-component
            :pictures="product.pictures"
            :title="product.title"
          />
        </section>

        <section class="container col-lg-7 col-md-8">
          <p class="header_authors font-italic">
            <router-link
              v-for="author in product.authors"
              :key="author.id"
              :to="{ name: 'authorProducts', params: { id: author.id } }"
              >{{ author.title }}</router-link
            >
          </p>

          <h2>{{ product.title }}</h2>

          <product-rating-component :productId="product.id" />

          <router-link
            v-for="tag in product.tags"
            :key="tag.id"
            :to="{ name: 'tagProducts', params: { id: tag.id } }"
            class="badge bg-primary text-light mr-1"
            >{{ tag.title }}</router-link
          >

          <div class="row mt-2">
            <div class="col-md-7">
              <table class="table table-borderless">
                <tbody>
                  <tr
                    v-for="(prop, index) of secondaryProperties"
                    :key="index"
                    class="border-bottom"
                  >
                    <td>{{ $t(`keys.${prop}`) }}</td>
                    <td>{{ product[prop] }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
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
import RequestBuilder from "../api";
import AddtoCartButtonComponent from "./AddtoCartButtonComponent.vue";
import ProductPicturiesComponent from "./ProductPicturiesComponent.vue";
import BaseBreadcrumbComponent from "./BaseBreadcrumbComponent.vue";
import ProductRatingComponent from "./ProductRatingComponent.vue";
import ProductReviewsComponent from "./ProductReviewsComponent.vue";
export default {
  components: {
    AddtoCartButtonComponent,
    ProductPicturiesComponent,
    BaseBreadcrumbComponent,
    ProductRatingComponent,
    ProductReviewsComponent,
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
      .then((data) => (this.product = data))
      .finally(() => (this.loading = false));
  },

  computed: {
    secondaryProperties() {
      return ["year", "pages", "cover"];
    },
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
}
</style>