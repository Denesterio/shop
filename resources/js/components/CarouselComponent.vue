<template>
    <VueSlickCarousel v-bind="settings" class="carousel border border-info">
        <template v-slot:prevArrow="arrowOption">
            <button class="carousel-control-prev bg-info" type="button">
              {{ arrowOption.currentSlide }}/{{ arrowOption.slideCount }}
            </button>
        </template>
        <div
            v-for="product in products"
            :key="product.id"
            class="card border-info"
        >
            <img
                :src="product.picture ? '/storage/' + product.picture : '/img/cap.png'"
                :alt="product.title"
                class="card-img-top image"
            >
            <div class="card-body text-center">
              <p class="title">
                <a @click.prevent="openModal(product.id)" class="text-reset">{{ product.title }}</a>
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
    <!-- <modal-product-component v-if="isModalOpen">
      <template v-slot:title> {{ product.title }}</template>
      <template v-slot:footer>
        <button @click="closeModal" type="button" class="btn btn-secondary">Close</button>
      </template>
    </modal-product-component> -->
</template>

<script>
  import ModalProductComponent from "./ModalProductComponent.vue";
  import VueSlickCarousel from 'vue-slick-carousel';
  import 'vue-slick-carousel/dist/vue-slick-carousel.css';
  import 'vue-slick-carousel/dist/vue-slick-carousel-theme.css'

  export default {
    name: 'MyComponent',
    components: { VueSlickCarousel, ModalProductComponent },
    props: ['products', 'authors'],
    data() {
        return {
            product: {},
            isModalOpen: false,
            settings: {
                "infinite": true,
                "slidesToShow": 4,
                "slidesToScroll": 1,
                "autoplay": true,
                "autoplaySpeed": 3000,
                "pauseOnDotsHover": true,
                "pauseOnFocus": true,
                "pauseOnHover": true,
                "speed": 1000,
                "responsive": [
                    {
                      "breakpoint": 1024,
                      "settings": {
                        "slidesToShow": 3,
                        "slidesToScroll": 3,
                      }
                    },
                    {
                      "breakpoint": 720,
                      "settings": {
                        "slidesToShow": 2,
                        "slidesToScroll": 1,
                        "initialSlide": 2
                      }
                    },
                    {
                      "breakpoint": 480,
                      "settings": {
                        "slidesToShow": 1,
                        "slidesToScroll": 1
                      }
                    }
                ],
            },
        };
    },

    methods: {
      formattedAuthorsHtml(id) {
        return this.authors[id].map(
          (author) => `<a class="text-muted text-small" href="/authors/${author.id}"><em>${author.title}</em></a>`
        ).join(' / ');
      },
      openModal(id) {
        this.isModalOpen = true;
        this.product = this.products.find(product => product.id === id);
      },
      closeModal() {
        this.isModalOpen = false;
      }
    }
  }
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