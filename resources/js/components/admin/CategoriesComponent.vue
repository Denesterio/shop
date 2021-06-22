<template>
    <div class="container mt-5">
        <div class="container-xl mb-4">
            <h1>{{ title }}</h1>
            <p><a href="/subcategories">на страницу добавления подкатегорий</a></p>
            <p><a href="/products">на страницу добавления товаров</a></p>

            <div class="form-group">
                <input
                    v-model.trim="categoryName"
                    class="form-control"
                    :class="{ 'is-invalid': validationErrors.name }"
                    placeholder="Имя новой категории"
                />

                <p
                    v-if="validationErrors.name"
                    class="invalid-feedback fsw-italic"
                >
                    {{ validationErrors.name }}
                </p>
            </div>

            <div class="form-group">
                <textarea
                    v-model="categoryDesc"
                    class="form-control"
                    :class="{ 'is-invalid': validationErrors.desc }"
                    placeholder="Описание новой категории"
                >
                </textarea>
                <div v-if="validationErrors.desc" class="invalid-feedback">
                    {{ validationErrors.desc }}
                </div>
            </div>

            <button
                @click="createNewCategory"
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
                    v-for="category in categories"
                    :key="category.id"
                    class="list-group-item d-flex justify-content-between align-items-start"
                >
                    <div class="ms-2 me-auto font-weight-light">
                        <div class="font-weight-bold">
                            {{ category.title }}
                        </div>
                        {{ category.description }}
                    </div>
                    <button
                        @click="removeCategory(category.id)"
                        type="button"
                        class="btn btn-danger"
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
import { getCategories } from '../../get.js';
import { isValid, fillErrors } from '../../validate.js';
export default {
    props: ["title"],
    data() {
        return {
            categoryName: "",
            categoryDesc: "",
            
            categories: [],
            
            loading: true,
            processing: false,
            validationErrors: {
                name: null,
                desc: null
            }
        };
    },
    mounted() {
        getCategories()
            .then((data) => this.categories = data)
            .finally(() => this.loading = false);
    },
    methods: {
         createNewCategory() {
            this.processing = true;
            const params = {
                name: this.categoryName,
                desc: this.categoryDesc
            };

            if (!isValid(params)) {
                fillErrors(this.validationErrors, params)
                this.processing = false;
                return;
            }
            
            axios
                .post("/categories/create", params)
                .then(() => {
                    document.location.reload();
                })
                .finally(() => {
                    this.processing = false;
                });
        },
        removeCategory(categoryId) {
            axios
                .post("/categories/delete", {
                    id: categoryId,
                    _method: "DELETE"
                })
                .then(() => document.location.reload());
        }
    },
    watch: {
        categoryName() {
            this.validationErrors.name = null;
        },
        categoryDesc() {
            this.validationErrors.desc = null;
        }
    }
};
</script>
