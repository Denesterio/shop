<template>
  <div class="m-2 row">
    <div
      @mouseover="showVoting"
      @mouseout="hideVoting"
      @keyup.enter="showVoting"
      class="stars-back mx-2"
      tabindex="0"
      :aria-label="
        ratingMessage ||
        `Рейтинг товара: ${rating}. Чтобы проголосовать, нажмите Enter`
      "
    >
      <div
        v-show="!showVotingComponent"
        class="stars-color"
        :style="{ width: ratingProgress }"
      ></div>
      <product-voting-component
        v-if="showVotingComponent"
        @closeVoting="hideVoting"
        :productId="productId"
      />
      <img v-else class="stars" src="/img/stars.png" alt="Рейтинг товара" />
    </div>
    <div id="rating-expl" class="rating-expl mx-2">
      {{ rating }} из {{ votes }} оценок
      <span v-if="isRated">({{ ratingMessage }})</span>
    </div>
  </div>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";
import ProductVotingComponent from "./ProductVotingComponent.vue";
export default {
  components: { ProductVotingComponent },
  props: {
    productId: {
      type: Number,
      required: true,
    },
  },

  data() {
    return {
      rating: 0,
      votes: 0,
      isRated: false,
      showVotingComponent: false,
    };
  },

  computed: {
    ratingMessage() {
      if (this.isRated) return "Ваша оценка учтена";
    },
    ratingProgress() {
      return this.rating * 20 + "px";
    },
  },

  created() {
    new RequestBuilder("ratings").get(this.productId).then((data) => {
      this.rating = data.rating.toFixed(2);
      this.votes = data.votes;
      this.isRated = data.isRated;
    });
  },

  methods: {
    showVoting() {
      if (!this.isRated) {
        this.showVotingComponent = true;
      }
    },

    hideVoting(rate) {
      this.showVotingComponent = false;
      if (typeof rate === "number") {
        this.rating = (
          (this.rating * this.votes + rate) /
          (this.votes + 1)
        ).toFixed(2);
        this.votes++;
        this.isRated = true;
      }
    },
  },
};
</script>

<style scoped>
.row {
  line-height: 20px;
}
.stars-back {
  height: 20px;
  width: 100px;
  line-height: inherit;
  position: relative;
}

.stars {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
}

.stars-color {
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
  background-color: gold;
}

.rating-expl {
  height: 20px;
  line-height: inherit;
  font-size: 0.9rem;
  font-style: italic;
}
</style>