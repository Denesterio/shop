<template>
    <div class="container mt-5">
        <div class="container-xl mb-4">
            <h1>{{ title }}</h1>
            <p><a href="/categories">На страницу добавления категорий</a></p>
            <p><a href="/products">На страницу добавления товаров</a></p>

            <div class="form-group">
                <input
                    v-model.trim="subcategoryName"
                    class="form-control"
                    :class="{ 'is-invalid': validationErrors.name }"
                    placeholder="Имя новой подкатегории"
                />

                <p
                    v-if="validationErrors.name"
                    class="invalid-feedback fsw-italic"
                >
                    {{ validationErrors.name }}
                </p>
            </div>

            <div class="form-group">
                <input
                    v-model.trim="subcategorySlug"
                    class="form-control"
                    :class="{ 'is-invalid': validationErrors.slug }"
                    placeholder="Заполнитель в строке адреса"
                />

                <p
                    v-if="validationErrors.slug"
                    class="invalid-feedback"
                >
                    {{ validationErrors.slug }}
                </p>
            </div>

            <div class="form-group">
                <select
                    v-model="categoryId"
                    class="form-control"
                    :class="{ 'is-invalid': validationErrors.categoryId }"
                >
                    <option value="" selected>Все</option>
                    <option
                        v-for="category in categories"
                        :key="category.id"
                        :value="category.id"
                    >
                        {{ category.title }}
                    </option>
                </select>
                <p v-if="validationErrors.categoryId" class="invalid-feedback">
                    {{ validationErrors.categoryId }}
                </p>
            </div>

            <button
                @click="createNewSubcategory"
                :disabled="processing"
                class="btn btn-success"
            >
                <div
                    v-if="processing"
                    class="spinner-border text-light spinner-border-sm"
                    role="status"
                >
                    <span class="visually-hidden"></span>
                </div>
                <span v-else>Сохранить</span>
            </button>
        </div>
        <div class="container-xl">
            <div v-if="loading" class="text-center">
                <svg
                    xmlns:svg="http://www.w3.org/2000/svg"
                    xmlns="http://www.w3.org/2000/svg"
                    xmlns:xlink="http://www.w3.org/1999/xlink"
                    version="1.0"
                    width="64px"
                    height="64px"
                    viewBox="0 0 128 128"
                    xml:space="preserve"
                >
                    <g>
                        <circle cx="16" cy="64" r="16" fill="#000" />
                        <circle
                            cx="16"
                            cy="64"
                            r="16"
                            fill="#555"
                            transform="rotate(45,64,64)"
                        />
                        <circle
                            cx="16"
                            cy="64"
                            r="16"
                            fill="#949494"
                            transform="rotate(90,64,64)"
                        />
                        <circle
                            cx="16"
                            cy="64"
                            r="16"
                            fill="#ccc"
                            transform="rotate(135,64,64)"
                        />
                        <animateTransform
                            attributeName="transform"
                            type="rotate"
                            values="0 64 64;315 64 64;270 64 64;225 64 64;180 64 64;135 64 64;90 64 64;45 64 64"
                            calcMode="discrete"
                            dur="800ms"
                            repeatCount="indefinite"
                        ></animateTransform>
                    </g>
                </svg>
            </div>
            <ul v-else class="list-group">
                <li
                    v-for="subcategory in filteredSubcategories"
                    :key="subcategory.id"
                    class="row justify-content-between mb-2 p-2"
                >
                    <div class="col-11 p-2 border-bottom">
                            {{ subcategory.title }}
                    </div>
                    <button
                        @click="removeSubcategory(subcategory.id)"
                        type="button"
                        class="btn btn-outline-danger btn-sm col-1"
                        aria-label="Close"
                    >
                        Удалить
                    </button>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
import { getCategories, getSubcategories } from '../../get.js';
import { isValid, fillErrors } from '../../validate.js';
export default {
    props: ["title"],
    data() {
        return {
            subcategoryName: "",
            categoryId: "",
            subcategorySlug: "",
            
            subcategories: [],
            categories: [],
            
            loading: true,
            processing: false,
            validationErrors: {
                name: "",
                categoryId: "",
                slug: "",
            }
        };
    },
    mounted() {
        getCategories().then((data) => this.categories = data);
        getSubcategories()
            .then((data) => this.subcategories = data)
            .finally(() => this.loading = false);
    },

    computed: {
        filteredSubcategories() {
            return this.subcategories.filter(subcat =>
                this.categoryId ? subcat["category_id"] === this.categoryId : true
            ); 
        }
    },

    methods: {
        createNewSubcategory() {
            this.processing = true;
            const params = {
                name: this.subcategoryName,
                categoryId: this.categoryId,
                slug: this.subcategorySlug,
            };

            if (!isValid(params)) {
                fillErrors(this.validationErrors, params)
                this.processing = false;
                return;
            }

            axios
                .post("/subcategories/create", params)
                .then(() => {
                    document.location.reload();
                })
                .finally(() => {
                    this.processing = false;
                });
        },
        removeSubcategory(subcategoryId) {
            axios
                .post("/subcategories/delete", {
                    id: subcategoryId,
                    _method: "DELETE"
                })
                .then(() => document.location.reload());
        }
    },
    watch: {
        subcategoryName() {
            this.validationErrors.name = "";
        },
        categoryId() {
            this.validationErrors.categoryId = "";
        },
        subcategorySlug() {
            this.validationErrors.subcategorySlug = "";
        }
    }
};
</script>