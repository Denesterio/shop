<template>
    <section>
        <ul class="list-group">
            <li class="list-group-item">
                Имя: <strong>{{ user.name }}</strong>
                <a @click.prevent="isModalOpen = true" class="font-italic ml-4" noreferrer nofollow>изменить</a>
            </li>
            <li class="list-group-item">Электронный адрес: <strong>{{ user.email }}</strong></li>
            <li class="list-group-item">Пароль: </li>
            <li class="list-group-item">Дата регистации: <strong>{{ formattedDate }}</strong></li>
        </ul>


        <modal-profile-component v-if="isModalOpen">
          <template v-slot:title>

          </template>
          <template v-slot:footer>
            <button @click="isModalOpen = false" class="btn btn-secondary">Закрыть</button>
          </template>
        </modal-profile-component>
    </section>
</template>

<script>
import ModalProfileComponent from './ModalProfileComponent.vue';

export default {
    props: {
        user: {
            type: Object,
            required: true,
        }
    },

    components: { ModalProfileComponent },

    data() {
        return {
            isModalOpen: false,
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
    .list-group-item a:hover {
        cursor: pointer;
    }
</style>