<template>
    <div>
        <profile-info-component :user="user" class="mb-4" />
        <div v-if="currentOrder">
            <h5>Текущий заказ:</h5>
            <p>
            <button
                class="btn btn-primary"
                type="button"
                data-toggle="collapse"
                :data-target="`#collapse${currentOrder.id}`"
                aria-expanded="false"
                :aria-controls="`collapse${currentOrder.id}`">
                Заказ #{{currentOrder.id}} от {{ formatDate(currentOrder) }}
            </button>
            </p>
            <div class="collapse mb-3" :id="`collapse${currentOrder.id}`">
                <div class="card card-body">
                    <profile-order-products-component :orderId="currentOrder.id" :status="currentOrder.status" />
                </div>
            </div>
        </div>
        <div v-if="confirmedOrders.length">
            <h5>История заказов:</h5>
            <div v-for='order in confirmedOrders' :key='order.id'>
                <p>
                <button
                    class="btn btn-success"
                    type="button"
                    data-toggle="collapse"
                    :data-target="`#collapse${order.id}`"
                    aria-expanded="false"
                    :aria-controls="`collapse${order.id}`">
                    Заказ #{{order.id}} от {{ formatDate(order) }}
                </button>
                </p>
                <div class="collapse mb-3" :id="`collapse${order.id}`">
                    <div class="card card-body">
                        <profile-order-products-component :orderId="order.id" :status="order.status" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import ProfileOrderProductsComponent from './ProfileOrderProductsComponent.vue';
import ProfileInfoComponent from './ProfileInfoComponent.vue';
export default {
    props: ['orders', 'user'],
    components: {ProfileOrderProductsComponent, ProfileInfoComponent},

    computed: {
       confirmedOrders() {
           return this.orders.filter((order) => order.status === 1);
       },
       currentOrder() {
           return this.orders.find((order) => order.status === 0);
       }
    },

    methods: {
        formatDate(order) {
            const [date] = order['updated_at'].split('T');
            return date.split('-').reverse().join('.');
        }
    }
}
</script>