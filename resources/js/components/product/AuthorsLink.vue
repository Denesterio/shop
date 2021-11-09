<template>
  <span>
    <router-link
      v-for="author in authors"
      :key="author.id"
      :to="{ name: 'author.show', params: { id: author.id } }"
      :class="linkClass"
      >{{ author.title }}</router-link
    >
  </span>
</template>

<script>
export default {
  props: {
    authors: {
      type: Array,
      required: true,
    },

    linkClass: {
      type: String,
      required: false,
      default: "",
    },
  },
};
</script>
