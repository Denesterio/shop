<template>
  <section class="mt-4">
    <svg-loading-component v-if="loading" />
    <template v-else-if="newProducts.length >= settings.slidesToShow && !error">
      <h4>Новинки:</h4>
      <VueSlickCarousel v-bind="settings" class="carousel border border-info">
        <template v-slot:prevArrow="arrowOption">
          <button class="carousel-control-prev bg-info" type="button">
            {{ arrowOption.currentSlide }}/{{ arrowOption.slideCount }}
          </button>
        </template>
        <div
          v-for="product in newProducts"
          :key="product.id"
          class="card border-info"
        >
          <img
            :src="
              product.picture
                ? '/storage/img/' + product.picture
                : '/img/cap.png'
            "
            :alt="product.title"
            class="card-img-top image"
          />
          <div class="card-body text-center">
            <p class="title">
              <a @click.prevent="openModal(product.id)" class="text-reset">{{
                product.title
              }}</a>
            </p>
            <p v-html="formattedAuthorsHtml(product.id)"></p>
          </div>
        </div>
        <template v-slot:nextArrow="arrowOption">
          <button class="carousel-control-next bg-info" type="button">
            {{ arrowOption.currentSlide }}/{{ arrowOption.slideCount }}
          </button>
        </template>
      </VueSlickCarousel>
    </template>
  </section>
</template>

<script>
import VueSlickCarousel from "vue-slick-carousel";
import "vue-slick-carousel/dist/vue-slick-carousel.css";
import "vue-slick-carousel/dist/vue-slick-carousel-theme.css";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
import { getNewProducts } from "../../api/get.js";

export default {
  name: "MyComponent",
  components: { VueSlickCarousel, SvgLoadingComponent },
  data() {
    return {
      loading: true,
      error: "",

      newProducts: [],
      authors: [],

      settings: {
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 3000,
        pauseOnDotsHover: true,
        pauseOnFocus: true,
        pauseOnHover: true,
        speed: 1000,
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 3,
            },
          },
          {
            breakpoint: 720,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 1,
              initialSlide: 2,
            },
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1,
            },
          },
        ],
      },
    };
  },

  created() {
    getNewProducts()
      .then((data) => {
        this.newProducts = data.products;
        this.authors = data.authors;
      })
      .catch((err) => {
        this.error = err.response.data.message;
      })
      .finally(() => (this.loading = false));
  },

  methods: {
    formattedAuthorsHtml(id) {
      return this.authors[id]
        .map(
          (author) =>
            `<a class="text-muted text-small" href="/authors/${author.id}"><em>${author.title}</em></a>`
        )
        .join(" / ");
    },
  },
};
</script>

<style scoped>
.image {
  width: 55%;
  height: 200px;
  margin: 5px auto;
}
.carousel {
  margin: 20px auto;
  width: 95%;
}
.card {
  border-radius: 0px;
}
.card-body {
  margin: 5px;
  padding: 5px;
  height: 120px;
}
.card-body p {
  margin-bottom: 5px;
  font-size: 0.9rem;
}
.title a {
  font-size: 1rem;
}
.title a:hover {
  cursor: pointer;
}
.carousel-control-prev,
.carousel-control-next {
  height: 101%;
  width: 25px;
}
</style>