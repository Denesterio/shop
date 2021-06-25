<template>
  <div class="card mb-12 m-3 border-right-0">
    <div class="row">
      <div class="col-md-3">
        <img
          :src="product.picture ? '/storage/' + product.picture : '/img/cap.png'"
          :alt="product.title"
          style="width: 100%"
          class="my-auto"
        /><img />
      </div>
      <div class="col-md-9">
        <div class="card border-0" style="height:100%">
          <div class="card-body">
            <h4>
              {{ product.title }}
            </h4>
            <p style="font-size: 1rem">
              {{ product.description }}
            </p>
          </div>
          <div class="card-footer bg-white">
            <p class="card-text text-right">
              <span class="text-secondary"> {{ product.price }} руб. </span>

              <span class="" v-if="productInOrder">
                <button
                  @click="deleteFromOrder(product.id)"
                  class="btn btn-outline-dark btn-sm ml-3 font-weight-bold"
                >
                  -
                </button>
                <button class="btn btn-outline-dark btn-sm font-weight-bold" disabled>
                  В корзине: {{ productInOrder.quantity }}
                </button>
                <button @click="addToOrder" class="btn btn-outline-dark btn-sm font-weight-bold">
                  +
                </button>
              </span>
              <button v-else @click="addToOrder" class="btn btn-info btn-sm ml-3">
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
  export default {
    props: ['product', 'orderProducts'],

    computed: {
      productInOrder() {
        return this.orderProducts.find(
          (prodInOrder) => prodInOrder['product_id'] === this.product.id
        );
      },
    },

    methods: {
      addToOrder() {
        const params = {
          productId: this.product.id,
        };

        axios
          .post('/order/addProduct', params)
          .then((response) => {
            Vue.swal.fire({
              position: 'center',
              icon: 'success',
              title: 'Товар успешно добавлен',
              showConfirmButton: false,
              timer: 1500,
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
        deleteProductFromOrder(productId, this.productInOrder['order_id'])
          .then(() => window.location.reload())
          .catch(() => {
            Vue.swal.fire({
              icon: 'error',
              title: 'Товар не удалось удалить',
            });
          });
      },
    },
  };
</script>
