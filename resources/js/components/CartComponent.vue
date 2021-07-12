<template>
  <div class="container mt-4">
    <template v-if="products.length">
      <h4>Заказ №{{ products[0]["order_id"] }}</h4>
      <table class="table mt-4 text-center align-middle">
        <thead class="table-light">
          <tr>
            <th>Наименование товара</th>
            <th>Цена</th>
            <th>Количество</th>
            <th>Сумма</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="product in products" :key="product.id">
            <td>
              {{ product.title }}
            </td>
            <td>{{ product.price }} руб.</td>
            <td>
              <span>
                <button
                  @click="deleteFromOrder(product.id, product['order_id'])"
                  class="btn btn-outline-dark font-weight-bold"
                >
                  -
                </button>
                <button class="btn btn-outline-dark font-weight-bold" disabled>
                  {{ product.quantity }}
                </button>
                <button
                  @click="addToOrder(product.id, product['order_id'])"
                  class="btn btn-outline-dark font-weight-bold"
                >
                  +
                </button>
              </span>
            </td>
            <td>{{ product.quantity * product.price }} руб.</td>
          </tr>
        </tbody>
      </table>
      <section class="text-right mt-4 p-2">
        <p>Всего товаров в корзине: {{ commonQuantity }}</p>
        <p>На сумму: {{ commonPrice }} руб.</p>
        <button @click="confirmOrder" class="btn btn-success">
          Оформить заказ
        </button>
      </section>
    </template>
    <span v-else>
      <em>В корзине отсутствуют продукты</em>
    </span>
  </div>
</template>

<script>
import { addProductToOrder } from "../api/create.js";
import { deleteProductFromOrder } from "../api/delete.js";
import { getCart } from "../api/get.js";

export default {
  data() {
    return {
      products: [],
      processing: false,
    };
  },

  mounted() {
    getCart().then(({ data }) => {
      this.products = data;
    });
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
  },

  methods: {
    confirmOrder() {
      confirmOrder()
        .then(() => {
          Vue.swal.fire({
            title: "Готово!",
            text: "Заказ успешно оформлен!",
            icon: "success",
            confirmButtonText: "OK",
          });
        })
        .catch(() => {
          Vue.swal.fire({
            title: "Произошла ошибка",
            text: "Повторите попытку",
            icon: "error",
            confirmButtonText: "OK",
          });
        });
    },

    deleteFromOrder(productId, orderId) {
      this.processing = true;
      deleteProductFromOrder(productId, orderId)
        .then(({ data }) => {
          if (data.quantity === 0) {
            this.products = this.products.filter((product) => {
              return product.id !== data["product_id"];
            });
          } else {
            const product = this.products.find((product) => {
              return product.id === data["product_id"];
            });
            product.quantity = data.quantity;
          }
        })
        .finally(() => (this.processing = false));
    },

    addToOrder(productId, orderId) {
      this.processing = true;
      addProductToOrder(productId, orderId)
        .then(({ data }) => {
          const product = this.products.find((product) => {
            return product.id === data["product_id"];
          });
          product.quantity = data.quantity;
        })
        .finally(() => (this.processing = false));
    },
  },
};
</script>