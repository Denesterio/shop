<template>
  <div class="card">
    <h5 id="title" class="card-header">{{ category.title }}</h5>
    <div class="card-body text-right">
      <p class="card-text text-left">
        {{ category.description }}
      </p>
      <router-link
        :id="category.id"
        :to="{ name: 'categoryProducts', params: { id: category.id } }"
        class="btn btn-primary"
        role="link"
        :aria-label="category.title"
      >
        Перейти
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  props: ["category"],
};
</script>

<style scoped>
.card {
  margin-bottom: 20px;
}
</style>