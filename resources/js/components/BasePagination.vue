<template>
  <nav
    class="d-flex justify-content-center"
    aria-label="Навигация по страницам"
  >
    <ul class="pagination">
      <li :class="{ disabled: current === 1 }" class="page-item">
        <a
          @click="changePage(1, $event)"
          class="page-link"
          href=""
          aria-label="First"
        >
          <span aria-hidden="true">&laquo;&laquo;</span>
        </a>
      </li>
      <li
        v-for="pageNumber in countOfPages"
        :key="pageNumber"
        class="page-item"
        :class="{ active: pageNumber === current }"
      >
        <a @click="changePage(pageNumber, $event)" class="page-link" href="">{{
          pageNumber
        }}</a>
      </li>
      <li :class="{ disabled: current === countOfPages }" class="page-item">
        <a
          @click="changePage(countOfPages, $event)"
          class="page-link"
          href=""
          aria-label="last"
        >
          <span aria-hidden="true">&raquo;&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
</template>

<script>
export default {
  props: {
    onPage: {
      type: String,
      required: true,
    },
    total: {
      type: Number,
      required: true,
    },
    current: {
      type: Number,
      required: false,
      default: 1,
    },
  },

  computed: {
    countOfPages() {
      return Math.ceil(this.total / parseInt(this.onPage, 10));
    },
  },

  methods: {
    changePage(nextPage, e) {
      e.preventDefault();
      this.$emit("change-page", nextPage);
    },
  },
};
</script>