<template>
  <div class="container mt-4">
    <div class="row">
      <section class="col-lg-3 col-md-4"></section>
      <section class="col-lg-9 col-md-8"></section>
    </div>
  </div>
</template>

<script>
import { getProduct } from "../api/get.js";
export default {
  data() {
    return {
      product: {},
      loading: true,
    };
  },
  created() {
    getProduct(this.$route.params.id)
      .then((data) => (this.product = data))
      .finally(() => (this.loading = false));
  },
};
</script>