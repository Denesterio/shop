<template>
  <p class="card-text">
    <slot name="start"></slot>
    <span class="" v-if="quantity">
      <button
        @click="changeProductQuantity(productId, -1)"
        :class="`btn btn-outline-dark btn-${size} ml-3 font-weight-bold`"
      >
        -
      </button>
      <button
        :class="`btn btn-outline-dark btn-${size} font-weight-bold`"
        disabled
      >
        {{ (size === "sm" ? "В корзине: " : "") + quantity }}
      </button>
      <button
        @click="changeProductQuantity(productId, 1)"
        :class="`btn btn-outline-dark btn-${size} font-weight-bold`"
      >
        +
      </button>
    </span>
    <button
      v-else
      @click="changeProductQuantity(productId, 1)"
      :class="`btn btn-info btn-${size} ml-3`"
    >
      Добавить в корзину
    </button>
  </p>
</template>

<script>
export default {
  props: {
    productId: {
      type: Number,
      required: true,
    },
    size: {
      type: String,
      required: false,
      default: "sm",
    },
    orderProducts: {
      type: Array,
      required: false,
      default: () => [],
    },
  },

  computed: {
    quantity() {
      return (
        this.orderProducts.find((op) => {
          return op.id === this.productId;
        })?.quantity ?? 0
      );
    },
  },

  methods: {
    changeProductQuantity(productId, quantityChange) {
      const params = {
        productId,
        quantityChange,
      };
      this.$store
        .dispatch("changeCartProductQuantity", params)
        .then(() => {
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
    moveToLogin() {
      this.$router.push({
        name: "login",
        query: { redirect: this.$route.path },
      });
    },
  },
};
</script>