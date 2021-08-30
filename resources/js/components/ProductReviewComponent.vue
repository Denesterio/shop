<template>
  <div class="my-2 p-2">
    <p class="mb-1">
      <b>{{ review.user.name }}:</b>
    </p>
    <p class="date-container">{{ createdDate }}</p>
    <p>{{ review.body }}</p>
  </div>
</template>

<script>
import DateFormatter from "../services/dateFormatter.js";
export default {
  props: {
    review: {
      type: Object,
      required: true,
    },
  },

  computed: {
    createdDate() {
      const dateFormatter = new DateFormatter(this.review.created_at);
      return dateFormatter.getFullTime();
    },
  },
};
</script>

<style scoped>
.date-container {
  font-size: 0.8rem;
}
</style>