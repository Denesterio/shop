<template>
  <div class="px-1 py-2 d-flex">
    <slot name="start"></slot>
    <div v-if="quantity">
      <button
        @click="changeProductQuantity(productId, 'descrease')"
        id="descreaseQuantityButton"
        :class="`btn btn-outline-${color} btn-${size} in-cart-buttons`"
      >
        -
      </button>
      <button
        :class="`btn btn-outline-${color} btn-${size} in-cart-buttons`"
        disabled
        id="quantityButton"
      >
        {{ quantity }}
      </button>
      <button
        @click="changeProductQuantity(productId, 'increase')"
        :class="`btn btn-outline-${color} btn-${size} in-cart-buttons`"
      >
        +
      </button>
    </div>
    <button
      v-else
      @click="changeProductQuantity(productId, 'increase')"
      id="addToCartButton"
      :class="`btn btn-primary btn-${size} in-cart-buttons`"
      v-t="'label.addToCart'"
    ></button>
    <template v-if="showAlert">
      <div
        ref="alert"
        id="alert"
        class="alert alert-info text-center"
        role="alert"
      >
        <strong>"{{ title }}"</strong
        ><span> ({{ alertsCount }}) {{ $t(`message.${change}`) }}</span>
      </div>
    </template>
  </div>
</template>

<script>
export default {
  props: {
    productId: {
      type: Number,
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
    size: {
      type: String,
      required: false,
      default: "sm",
    },
    color: {
      type: String,
      required: false,
      default: "dark",
    },
  },

  data() {
    return {
      change: null,
      showAlert: false,
      alertsCount: 0,
      timer: null,
    };
  },

  ALERT_TIMEOUT: 2000,

  computed: {
    quantity() {
      return (
        this.orderProducts.find((op) => {
          return op.id === this.productId;
        })?.quantity ?? 0
      );
    },
    orderProducts() {
      return this.$store.state.cartProducts;
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
          this.showAlert = true;
          if (this.change !== quantityChange) {
            this.alertsCount = 0;
          }
          this.alertsCount += 1;
          this.change = quantityChange;
          if (this.timer) {
            clearTimeout(this.timer);
          }
          this.timer = setTimeout(() => {
            this.showAlert = false;
            this.alertsCount = 0;
          }, this.$options.ALERT_TIMEOUT);
        })
        .catch((error) => {
          if (error.response.status === 401) {
            this.$swal
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
          } else {
            Vue.swal.fire({
              icon: "error",
              title: "Товар не добавлен",
              text: "Не удалось добавить товар, попробуйте снова",
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

<style scoped>
.alert {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  z-index: 20;
  font-size: 1.2rem;
  margin: 0;
}
.in-cart-buttons {
  font-weight: 700;
  line-height: 1rem;
}
.btn-outline-light {
  color: #333;
  border: 2px solid #fff;
}
.btn-outline-light:not([disabled]):hover {
  font-weight: bold;
  color: #333;
}
</style>