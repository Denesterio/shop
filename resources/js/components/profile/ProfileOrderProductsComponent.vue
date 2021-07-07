<template>
    <div class="text-right">
        <table
            class="table bordered text-center"
            :class="{ 'table-success': isConfirmed, 'table-primary': !isConfirmed }">
            <thead>
                <tr>
                    <th>Наименование</th>
                    <th>Количество</th>
                    <th>Цена</th>
                    <th>Сумма</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for='product in products' :key='product.id'>
                    <td>{{product.title}}</td>
                    <td>{{product.quantity}}</td>
                    <td>{{product.price}}</td>
                    <td>{{product.price * product.quantity}}</td>
                </tr>
            </tbody>
        </table>
            <p>Всего товаров в заказе: <strong>{{ commonQuantity }}</strong></p>
            <p>На сумму: <strong>{{ commonPrice }} руб.</strong></p>
    </div>
</template>

<script>
export default {
    props: ['orderId', 'status'],
    data () {
        return {
            products: []
        }
    },
    computed: {
        commonQuantity() {
            return this.products.reduce((sum, product) => {
                return sum += product.quantity;
            }, 0);
        },

        commonPrice() {
            return this.products.reduce((sum, product) => {
                return sum += product.price * product.quantity;
            }, 0);
        },

        isConfirmed() {
            return this.status === 1;
        }
    },
    mounted () {
        axios.get(`/order/${this.orderId}/products`)
        .then(({data}) => {
            this.products = data;
        });
    }
}
</script>