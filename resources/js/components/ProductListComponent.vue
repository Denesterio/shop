<template>
    <div>
        <product-component
            v-for='product in products'
            :product="product"
            :key='product.id'
            :orderProducts='orderProducts'
        >
        </product-component>
    </div>
</template>

<script>
import ProductComponent from './ProductComponent.vue';
import { getOrders } from '../get.js';
export default {
    props: ['products'],
    components: {ProductComponent},
    data() {
        return {
            orderProducts: [],
        }
    },
    mounted() {
        getOrders().then((data) => {
            this.orderProducts = data.orders.map((order) => {
                return {
                    productId: order.product_id,
                    orderId: order.order_id,
                    quantity: order.quantity
                };
            });
        });
    },
}
</script>
