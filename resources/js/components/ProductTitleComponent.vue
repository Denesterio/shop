<template>
  <div>
    <h5
      class="card-title my-2"
      @mouseover="showFullTitleTooltip"
      @mouseout="hideFullTitleTooltip"
    >
      <router-link
        class="text-reset"
        :to="{ name: 'productPage', params: { id: product.id } }"
        >{{ formattedTitle }}</router-link
      >
    </h5>
    <p
      class="card-text authors font-italic"
      v-html="formattedAuthorsHtml.join(' / ')"
    ></p>
    <base-tooltip-component
      v-show="isFullTitleTooltipVisible"
      ref="tooltip"
      :text="product.title"
      size="sm"
    />
  </div>
</template>

<script>
import BaseTooltipComponent from "./BaseTooltipComponent.vue";
export default {
  props: {
    product: {
      type: Object,
      required: true,
    },
    authors: {
      type: Array,
      required: false,
      default: () => [],
    },
  },

  components: { BaseTooltipComponent },

  data() {
    return {
      isFullTitleTooltipVisible: false,
    };
  },

  MAX_TITLE_LENGTH: 60,

  computed: {
    formattedTitle() {
      if (this.product.title.length < this.$options.MAX_TITLE_LENGTH)
        return this.product.title;
      const index = this.product.title.indexOf(" ", 45);
      return this.product.title.slice(0, index) + `\u2026`;
    },

    formattedAuthorsHtml() {
      return this.authors.map(
        (author) =>
          `<a class="text-muted" href="/authors/${author.id}">${author.title}</a>`
      );
    },
  },

  methods: {
    showFullTitleTooltip(e) {
      if (this.product.title.length >= this.$options.MAX_TITLE_LENGTH) {
        this.isFullTitleTooltipVisible = true;
        const coords = e.currentTarget.getBoundingClientRect();
        this.$refs.tooltip.$el.style.top = coords.bottom + 10 + "px";
      }
    },

    hideFullTitleTooltip() {
      this.isFullTitleTooltipVisible = false;
    },
  },
};
</script>
<style scoped>
.card-title {
  font-size: 0.9rem;
}
.authors {
  font-size: 0.8rem;
}
.authors::before {
  content: "";
  display: block;
  height: 1px;
  background: #ccc;
  margin: 5px 10px;
}
</style>