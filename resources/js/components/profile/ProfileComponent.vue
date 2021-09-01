<template>
  <div class="container mt-4">
    <profile-info-component :user="user" class="mb-4" />
    <div class="form-check mb-3">
      <input
        v-model="history"
        class="form-check-input"
        type="checkbox"
        value=""
        id="сheck"
      />
      <label class="form-check-label" for="сheck">
        Показать историю заказов
        <span v-if="!confirmedOrders.length"
          >({{ $t("message.noComfirmOrders") }})</span
        >
      </label>
    </div>
    <div v-if="currentOrder">
      <h5>Текущий заказ:</h5>
      <p>
        <button
          class="btn btn-primary"
          type="button"
          data-toggle="collapse"
          :data-target="`#collapse${currentOrder.id}`"
          aria-expanded="false"
          :aria-controls="`collapse${currentOrder.id}`"
        >
          Заказ #{{ currentOrder.id }} от {{ formatDate(currentOrder) }}
        </button>
      </p>
      <div class="collapse mb-3" :id="`collapse${currentOrder.id}`">
        <div class="card card-body">
          <profile-order-products-component
            :orderId="currentOrder.id"
            :status="currentOrder.status"
          />
        </div>
      </div>
    </div>
    <div v-if="history">
      <h5>История заказов:</h5>
      <div v-for="order in confirmedOrders" :key="order.id">
        <p>
          <button
            class="btn btn-success"
            type="button"
            data-toggle="collapse"
            :data-target="`#collapse${order.id}`"
            aria-expanded="false"
            :aria-controls="`collapse${order.id}`"
          >
            Заказ #{{ order.id }} от {{ formatDate(order) }}
          </button>
        </p>
        <div class="collapse mb-3" :id="`collapse${order.id}`">
          <div class="card card-body">
            <profile-order-products-component
              :orderId="order.id"
              :status="order.status"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ProfileOrderProductsComponent from "./ProfileOrderProductsComponent.vue";
import ProfileInfoComponent from "./ProfileInfoComponent.vue";
import RequestBuilder from "../../api";
export default {
  components: {
    ProfileOrderProductsComponent,
    ProfileInfoComponent,
  },

  data() {
    return {
      history: false,
      orders: [],
      loading: true,
    };
  },

  mounted() {
    new RequestBuilder("orders")
      .get()
      .then((data) => {
        this.orders = data.reverse();
      })
      .finally(() => (this.loading = false));
  },

  computed: {
    confirmedOrders() {
      return this.orders.filter((order) => order.status === 1);
    },
    currentOrder() {
      return this.orders.find((order) => order.status === 0);
    },
    user() {
      return this.$store.state.user;
    },
  },

  methods: {
    formatDate(order) {
      const [date] = order["updated_at"].split("T");
      return date.split("-").reverse().join(".");
    },
  },
};
</script>