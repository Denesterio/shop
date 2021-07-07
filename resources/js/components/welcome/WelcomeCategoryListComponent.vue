<template>
    <div>
        <welcome-category-card-component
            v-for='category in categories'
            :category="category"
            :key='category.id'
        >
        </welcome-category-card-component>
    </div>
</template>

<script>
  import WelcomeCategoryCardComponent from './WelcomeCategoryCardComponent.vue';

export default {
    props: ['categories'],
    components: {WelcomeCategoryCardComponent},
    data() {
        return {
            isModalOpen: false,
        }
    },
    methods: {
      openModal() {
        this.isModalOpen = true;
      }
    },

    mounted () {

    }
}
</script>
