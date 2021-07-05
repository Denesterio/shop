<template>
  <div class="card mb-12 m-3 border-right-0">
    <div class="row">
      <div class=" bg-grey col-md-3 d-flex align-items-center justify-content-center">
        <img
          :src="product.picture ? '/storage/' + product.picture : '/img/cap.png'"
          :alt="product.title"
          style="width: 80%; height: 96%"
          class="my-auto"
        /><img />
      </div>
      <div class="col-md-9">
        <div class="card border-0" style="height:100%">
          <div class="m-1 p-1 font-italic" v-html="formattedAuthorsHtml.join(' / ')">
          </div>
          <div class="mx-2 p-2 mb-2">
            <h4>
              <a class="text-reset" :href="`/products/${product.id}`">{{ product.title }}</a>
            </h4>
            <p style="font-size: 1rem">
              <a class="text-reset" :href="`/products/${product.id}`">{{ formattedDescription }}</a>
            </p>
          </div>
          <div class="card-footer bg-white">
            <p class="card-text text-right">
              <span class="text-secondary"> {{ product.price }} руб. </span>

              <span class="" v-if="quantity">
                <button
                  @click="deleteFromOrder(product.id)"
                  class="btn btn-outline-dark btn-sm ml-3 font-weight-bold"
                >
                  -
                </button>
                <button class="btn btn-outline-dark btn-sm font-weight-bold" disabled>
                  В корзине: {{ quantity }}
                </button>
                <button
                  @click="addToOrder(product.id)"
                  class="btn btn-outline-dark btn-sm font-weight-bold"
                >
                  +
                </button>
              </span>
              <button v-else @click="addToOrder(product.id)" class="btn btn-info btn-sm ml-3">
                Добавить в корзину
              </button>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import { deleteProductFromOrder } from '../api/delete';
  import { addProductToOrder } from '../api/create';
  export default {
    props: ['product', 'orderProducts', 'tags', 'authors'],

    data() {
      return {
        quantity: null,
      }
    },

    mounted() {
      this.quantity = this.orderProducts.find(
        (prodInOrder) => prodInOrder['product_id'] === this.product.id
      )?.quantity ?? 0;
    },

    computed: {
      orderId() {
        return this.orderProducts.find(
          (prod) => prod['product_id'] === this.product.id
        )['order_id'];
      },

      formattedDescription() {
        if (this.product.description.length > 140) {
          return this.product.description.slice(0, 140) + '\u2026';
        }
        return this.product.description;
      },

      formattedAuthorsHtml() {
        return this.authors.map(
          (author) => `<a class="text-muted" href="/authors/${author.id}">${author.title}</a>`
        );
      }
    },

    methods: {
      addToOrder(productId) {
        addProductToOrder(productId)
          .then(() => {
            this.quantity += 1;
            Vue.swal.fire({
              position: 'top-end',
              icon: 'success',
              title: 'Товар успешно добавлен',
              showConfirmButton: false,
              timer: 1100,
            });
          })
          .catch((error) => {
            if (error.response.status === 401) {
              Vue.swal.fire({
                icon: 'error',
                title: 'Товар не добавлен',
                text: 'Пожалуйста, авторизуйтесь, чтобы совершать заказы',
                footer: '<a href="/login">Войти</a> / <a href="/register">Зарегистрироваться</a>',
              });
            }
          });
      },

      deleteFromOrder(productId) {
        deleteProductFromOrder(productId, this.orderId)
          .then(() => {
            this.quantity -= 1;
            Vue.swal.fire({
              position: 'top-end',
              icon: 'success',
              title: 'Товар удален',
              showConfirmButton: false,
              timer: 1100,
            });
          })
          .catch(() => {
            Vue.swal.fire({
              icon: 'error',
              title: 'Товар не удалось удалить',
              showConfirmButton: true,
            });
          });
      },
    },
  };
</script>

<style scoped>
  .bg-grey {
    background-color: #EEF5FC;
  }
</style>