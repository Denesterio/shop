<template>
  <nav aria-label="Page navigation example">
    <ul class="pagination">
      <li :class="{ disabled: isPageFirst }" class="page-item">
        <a
          @click="changePage(settings['prev_page_url'], $event)"
          class="page-link"
          href=""
          aria-label="Previous"
        >
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
      <li
        v-for="link in settings.links"
        :key="link.label"
        class="page-item"
        :class="{ active: link.active }"
      >
        <a @click="changePage(link.url, $event)" class="page-link" href="">{{
          link.label
        }}</a>
      </li>
      <li :class="{ disabled: isPageLast }" class="page-item">
        <a
          @click="changePage(settings['next_page_url'], $event)"
          class="page-link"
          href=""
          aria-label="Next"
        >
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
</template>

<script>
export default {
  props: {
    settings: {
      type: Object,
      required: true,
    },
  },

  computed: {
    isPageLast() {
      return this.settings["next_page_url"] === null;
    },
    isPageFirst() {
      return this.settings["prev_page_url"] === null;
    },
  },

  methods: {
    changePage(url, e) {
      e.preventDefault();
      this.$emit("change-page", url);
    },
  },
};
</script>