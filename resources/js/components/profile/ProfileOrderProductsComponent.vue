<template>
  <div class="text-right m-2">
    <svg-loading-component v-if="loading" />
    <template v-else>
      <table
        class="table bordered text-center"
        :class="{ 'table-success': isConfirmed, 'table-primary': !isConfirmed }"
      >
        <thead>
          <tr>
            <th>Наименование</th>
            <th>Количество</th>
            <th>Цена</th>
            <th>Сумма</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="product in products" :key="product.id">
            <td>{{ product.title }}</td>
            <td>{{ product.quantity }}</td>
            <td>{{ product.price }}</td>
            <td>{{ product.price * product.quantity }}</td>
          </tr>
        </tbody>
      </table>
      <i18n path="message.inOrder" tag="p">
        <template v-slot:quantity>
          <strong>
            {{ `${$tc("message.product", commonQuantity)}` }}
          </strong>
        </template>
      </i18n>
      <i18n path="message.sumProducts" tag="p">
        <template v-slot:sum>
          <strong>
            {{ commonPrice }}
          </strong>
        </template>
      </i18n>
    </template>
  </div>
</template>

<script>
import RequestBuilder from "../../api/requestBuilder.js";
export default {
  props: ["orderId", "status"],
  data() {
    return {
      products: [],
      loading: true,
    };
  },
  computed: {
    commonQuantity() {
      return this.products.reduce((sum, product) => {
        return (sum += product.quantity);
      }, 0);
    },

    commonPrice() {
      return this.products.reduce((sum, product) => {
        return (sum += product.price * product.quantity);
      }, 0);
    },

    isConfirmed() {
      return this.status === 1;
    },
  },
  mounted() {
    new RequestBuilder("orderProducts")
      .get(this.orderId)
      .then((data) => {
        data.forEach((product) => {
          if (this.isConfirmed) {
            product.price = product.pivot.price;
          }
          product.quantity = product.pivot.quantity;
        });
        this.products = data;
      })
      .finally(() => (this.loading = false));
  },
};
</script>