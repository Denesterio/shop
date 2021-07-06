<template>
    <div class="accordion" role="tablist">
        <b-card
            v-for="category in categories"
            :key="category.id"
            no-body
            class="mb-1"
        >
            <b-card-header header-tag="header" class="p-1" role="tab">
                <b-button
                    block
                    v-b-toggle="`accordion` + category.id"
                    variant="info"
                >
                    {{ category.title }}
                </b-button>
            </b-card-header>
            <b-collapse
                :id="`accordion` + category.id"
                accordion="my-accordion"
                role="tabpanel"
                :visible="isOpen(category.id)"
            >
                <b-card-body>
                    <div
                        class="list-group list-group-flush"
                        v-if="
                            subcategories.filter(
                                subcat => subcat['category_id'] === category.id
                            ).length > 0
                        "
                    >
                        <a
                            class="list-group-item list-group-item-action"
                            :class="{ 'active': isActive(subcategory.slug) }"
                            v-for="subcategory in subcategories.filter(
                                subcat => subcat['category_id'] === category.id
                            )"
                            :key="subcategory.id"
                            :href="`/subcategories/${subcategory.slug}`"
                        >
                            {{ subcategory.title }}
                        </a>
                    </div>
                    <div v-else class="list-group list-group-flush">
                        <a
                            class="list-group-item list-group-item-action"
                            :class="{ 'active': isOpen(category.id) }"
                            :href="`/categories/${category.id}`"
                        >
                        {{ category.title }}
                        </a>
                    </div>
                </b-card-body>
            </b-collapse>
        </b-card>
    </div>
</template>

<script>
export default {
    props: ['categories', 'subcategories'],
    data() {
        return {
            openedId: '',
        };
    },

    computed: {
        currentPage() {
            const path = window.location.pathname;
            const [currentPage] = path.split('/').reverse();
            return currentPage || String(Math.min(...this.categories.map((cat) => cat.id)));
        },
        isCategoryPage() {
            return !Number.isNaN(parseInt(this.currentPage));
        }
    },

    methods: {
        isOpen(id) {
            if (this.isCategoryPage) {
                return this.currentPage === String(id);
            }
            const currentSubcategories = this.subcategories.filter(
                (sub) => sub['category_id'] === id
            );
            return !!currentSubcategories.find((sub) => sub.slug === this.currentPage);
        },

        isActive(slug) {
            return this.currentPage === slug;
        },
    },
};
</script>

<style scoped href="../css/app.css"></style>
