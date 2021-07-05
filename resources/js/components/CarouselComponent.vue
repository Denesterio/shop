<template>
  <div class="carousel p-2 border">
    <VueSlickCarousel v-bind="settings">
        <div
            v-for="product in products"
            :key="product.id"
            class="card"
        >
            <img
                :src="product.picture ? '/storage/' + product.picture : '/img/cap.png'"
                :alt="product.title"
                class="card-img-top image"
            >
            <div class="card-body text-center">
              <p class="title">{{ product.title }}</p>
              <p v-html="formattedAuthorsHtml(product.id)"></p>
            </div>
        </div>
    </VueSlickCarousel>
  </div>
</template>

<script>
  import VueSlickCarousel from 'vue-slick-carousel';
  import 'vue-slick-carousel/dist/vue-slick-carousel.css';
  import 'vue-slick-carousel/dist/vue-slick-carousel-theme.css'

  export default {
    name: 'MyComponent',
    components: { VueSlickCarousel },
    props: ['products', 'authors'],
    data() {
        return {
            settings: {
                "infinite": true,
                "slidesToShow": 5,
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
      }
    }
  }
</script>

<style scoped>
    .image {
        width: 70%;
        height: 220px;
        margin: 5px auto;
    }
    .carousel {
        margin: 20px auto;
        width: 100%;
    }
    .card-body {
      margin: 5px;
      padding: 5px;
      height: 100px;
    }
    .card-body p {
      margin-bottom: 5px;
    }
    .title a {
      font-size: 1rem;
    }
</style>