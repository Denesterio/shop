<template>
  <article class="mb-12 m-3 border-right-0" :class="{ card: type === 'card' }">
    <div v-if="type === 'card'" class="row">
      <div
        class="
          image-bg
          col-md-3
          d-flex
          align-items-center
          justify-content-center
        "
      >
        <img
          :src="picturePath"
          :alt="product.title"
          class="my-auto card-image"
        /><img />
      </div>
      <div class="col-md-9">
        <div class="card border-0" style="height: 100%">
          <div
            class="m-1 p-1 font-italic"
            v-html="formattedAuthorsHtml.join(' / ')"
          ></div>
          <div class="mx-2 p-2 mb-2">
            <h4>
              <a class="text-reset" :href="`/products/${product.id}`">{{
                product.title
              }}</a>
            </h4>
            <p style="font-size: 1rem">
              <a class="text-reset" :href="`/products/${product.id}`">{{
                formattedDescription
              }}</a>
            </p>
          </div>
          <div class="card-footer bg-white">
            <addto-cart-button-component
              :quantity="quantity"
              :id="product.id"
              @add-to-order="addToOrder"
              @delete-from-order="deleteFromOrder"
              class="mt-2"
              :class="{ 'text-right': type === 'card' }"
            >
              <template v-slot:start>
                <span class="text-secondary"> {{ product.price }} руб. </span>
              </template>
            </addto-cart-button-component>
          </div>
        </div>
      </div>
    </div>

    <div v-else class="row">
      <div class="col-md-12">
        <div class="ms-2 me-auto">
          <div class="font-weight-bold font-size-point">
            <a class="text-reset" :href="`/products/${product.id}`">{{
              product.title
            }}</a>
            |
            <span
              class="font-italic font-weight-light"
              v-html="formattedAuthorsHtml.join(' / ')"
            ></span>
            |
            <span class="text-secondary"> {{ product.price }} руб. </span>
          </div>
          <addto-cart-button-component
            :quantity="quantity"
            :id="product.id"
            @add-to-order="addToOrder"
            @delete-from-order="deleteFromOrder"
            class="mt-2"
          >
            <template v-slot:start>
              <button
                @click="isModalOpen = true"
                class="btn btn-outline-primary btn-sm ml-3"
              >
                Быстрый просмотр
              </button>
            </template>
          </addto-cart-button-component>
        </div>
      </div>
    </div>

    <b-modal
      v-model="isModalOpen"
      centered
      id="modal-lg"
      size="lg"
      :title="product.title"
      hide-backdrop
      content-class="shadow"
    >
      <img :src="picturePath" :alt="product.title" class="modal-image" />
      {{ product.description }}
      <template v-slot:modal-footer>
        <addto-cart-button-component
          :quantity="quantity"
          :id="product.id"
          @add-to-order="addToOrder"
          @delete-from-order="deleteFromOrder"
          class="mt-2"
          :class="{ 'text-right': type === 'card' }"
        >
          <template v-slot:start>
            <span class="text-secondary"> {{ product.price }} руб. </span>
          </template>
        </addto-cart-button-component>
      </template>
    </b-modal>
  </article>
</template>

<script>
import AddtoCartButtonComponent from "./AddtoCartButtonComponent.vue";
import { deleteProductFromOrder } from "../api/delete";
import { addProductToOrder } from "../api/create";
export default {
  props: ["product", "orderProducts", "tags", "authors", "type"],
  components: { AddtoCartButtonComponent },

  data() {
    return {
      quantity: null,
      isModalOpen: false,
    };
  },

  mounted() {
    this.quantity =
      this.orderProducts.find(
        (prodInOrder) => prodInOrder["product_id"] === this.product.id
      )?.quantity ?? 0;
  },

  computed: {
    orderId() {
      return this.orderProducts.find(
        (prod) => prod["product_id"] === this.product.id
      )["order_id"];
    },

    formattedDescription() {
      if (this.product.description.length > 140) {
        return this.product.description.slice(0, 140) + "\u2026";
      }
      return this.product.description;
    },

    formattedAuthorsHtml() {
      return this.authors.map(
        (author) =>
          `<a class="text-muted" href="/authors/${author.id}">${author.title}</a>`
      );
    },

    picturePath() {
      return this.product.picture
        ? "/storage/img/" + this.product.picture
        : "/img/cap.png";
    },
  },

  methods: {
    addToOrder(productId) {
      addProductToOrder(productId)
        .then(() => {
          this.quantity += 1;
          Vue.swal.fire({
            position: "top-end",
            icon: "success",
            title: "Товар успешно добавлен",
            showConfirmButton: false,
            timer: 1100,
          });
        })
        .catch((error) => {
          if (error.response.status === 401) {
            Vue.swal
              .fire({
                icon: "error",
                title: "Товар не добавлен",
                text: "Пожалуйста, авторизуйтесь, чтобы совершать заказы",
                showDenyButton: true,
                showCancelButton: true,
                confirmButtonText: `Войти`,
                denyButtonText: "Регистрация",
                denyButtonColor: "#29AF4F",
                cancelButtonText: "Отмена",
              })
              .then((result) => {
                if (result.isConfirmed) {
                  this.moveToLogin();
                } else if (result.isDenied) {
                  this.$router.push({ name: "register" });
                }
              });
          }
        });
    },

    deleteFromOrder(productId) {
      deleteProductFromOrder(productId)
        .then(() => {
          this.quantity -= 1;
          Vue.swal.fire({
            position: "top-end",
            icon: "success",
            title: "Товар удален",
            showConfirmButton: false,
            timer: 1100,
          });
        })
        .catch(() => {
          Vue.swal.fire({
            icon: "error",
            title: "Товар не удалось удалить",
            showConfirmButton: true,
          });
        });
    },
    moveToLogin() {
      this.$router.push({
        name: "login",
        query: { redirect: this.$route.path },
      });
    },
  },
};
</script>

<style scoped>
.image-bg {
  background-color: #eef5fc;
}
.card-image {
  width: 95%;
  height: 96%;
}
.font-size-point {
  font-size: 1.1rem;
}
.modal-image {
  width: 25%;
  float: left;
  margin-right: 20px;
}
</style>