<template>
  <div class="container mt-4">
    <template v-if="products.length">
      <h4>{{ $t("label.orderNum", { num: orderId }) }}</h4>
      <table class="table mt-4 text-center align-middle">
        <thead class="table-light">
          <tr>
            <th v-t="'table.title'"></th>
            <th v-t="'table.price'"></th>
            <th v-t="'table.quantity'"></th>
            <th v-t="'table.sum'"></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="product in products" :key="product.id">
            <td>
              {{ product.title }}
            </td>
            <td>{{ product.price }} руб.</td>
            <td>
              <addto-cart-button-component
                :product-id="product.id"
                :title="product.title"
                :order-products="products"
                size="md"
                class="justify-content-center"
              />
            </td>
            <td>{{ product.quantity * product.price }} руб.</td>
          </tr>
        </tbody>
      </table>
      <section class="text-right mt-4 p-2">
        <i18n path="message.inCart" tag="p">
          <template v-slot:quantity>
            <strong>
              {{
                `${commonQuantity} ${$tc("message.product", commonQuantity)}`
              }}
            </strong>
          </template>
        </i18n>
        <i18n path="message.sumProducts" tag="p">
          <template v-slot:sum>
            <strong>{{ commonPrice }}</strong>
          </template>
        </i18n>
        <button
          @click="confirm"
          class="btn btn-success"
          v-t="'label.orderConfirm'"
        ></button>
      </section>
    </template>
    <span v-else>
      <em v-t="'message.noProdCart'"></em>
    </span>
  </div>
</template>

<script>
import AddtoCartButtonComponent from "./AddtoCartButtonComponent.vue";
import { confirmOrder } from "../api/create.js";

export default {
  components: { AddtoCartButtonComponent },
  data() {
    return {
      processing: false,
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

    products() {
      return this.$store.state.cartProducts;
    },

    orderId() {
      return this.products[0]?.order_id;
    },
  },

  methods: {
    confirm() {
      confirmOrder()
        .then(() => {
          Vue.swal.fire({
            title: "Готово!",
            text: "Заказ успешно оформлен!",
            icon: "success",
            confirmButtonText: "OK",
          });
          this.$store.dispatch("confirmOrder");
          this.$router.push({ name: "welcome" });
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
  },
};
</script>