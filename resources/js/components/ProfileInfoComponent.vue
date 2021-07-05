<template>
    <section>
        <ul class="list-group">
            <li class="list-group-item">Имя: <strong>{{ user.name }}</strong></li>
            <li class="list-group-item">Электронный адрес: <strong>{{ user.email }}</strong></li>
            <li class="list-group-item">Пароль: </li>
            <li class="list-group-item">Дата регистации: <strong>{{ formattedDate }}</strong></li>
        </ul>
    </section>
</template>

<script>
export default {
    props: {
        user: {
            type: Object,
            required: true,
        }
    },

    computed: {
        formattedDate() {
            const [date] = this.user['updated_at'].split('T');
            return date.split('-').reverse().join('.');
        }
    }
}
</script>

<style scoped>
    strong {
        font-size: 1.1rem,
    }
</style>