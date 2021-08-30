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
          <product-title-component
            :product="product"
            :authors="product.authors"
            class="card-body text-center"
          />
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
// import "vue-slick-carousel/dist/vue-slick-carousel.css";
// import "vue-slick-carousel/dist/vue-slick-carousel-theme.css";
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
import ProductTitleComponent from "../ProductTitleComponent.vue";
import { getNewProducts } from "../../api/get.js";

export default {
  components: { VueSlickCarousel, SvgLoadingComponent, ProductTitleComponent },
  data() {
    return {
      loading: true,
      error: "",

      newProducts: [],
      authors: [],

      settings: {
        infinite: true,
        slidesToShow: 5,
        slidesToScroll: 2,
        autoplay: true,
        autoplaySpeed: 4000,
        pauseOnDotsHover: false,
        pauseOnFocus: true,
        pauseOnHover: true,
        speed: 1500,
        responsive: [
          {
            breakpoint: 1150,
            settings: {
              slidesToShow: 4,
              slidesToScroll: 2,
            },
          },
          {
            breakpoint: 920,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 1,
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
        this.newProducts = data;
      })
      .catch((err) => {
        this.error = err.response.data.message;
      })
      .finally(() => (this.loading = false));
  },
};
</script>

<style scoped>
.image {
  max-width: 120px;
  height: 180px;
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
  height: 125px;
}
.carousel-control-prev,
.carousel-control-next {
  height: 101%;
  width: 25px;
}
</style>