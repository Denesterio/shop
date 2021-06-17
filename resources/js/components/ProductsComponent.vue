<template>
    <div class="container mt-5">
        <div class="container-xl mb-5">
            <h1>Список товаров</h1>

            <div class="form-group">
                <input
                    v-model="productName"
                    class="form-control"
                    :class="{ 'is-invalid': validationErrors.name }"
                    placeholder="Имя нового продукта"
                />
                <p
                    v-if="validationErrors.name.length > 0"
                    class="invalid-feedback"
                >
                    {{ validationErrors.name }}
                </p>
            </div>

            <div class="form-group">
                <input @change="getPicture" class="form-control" type="file" />
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
                @click="createNewProduct"
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
            <div v-else-if="filteredProducts.length > 0" class="row">
                <div class="card mb-3" style="max-width: 540px;">
                    <div
                        v-for="product in filteredProducts"
                        :key="product.id"
                        class="row g-0 m-2"
                    >
                        <div class="col-md-5">
                            <img
                                :src="
                                    product.picture
                                        ? './storage/img/' +
                                          product.picture.split('/')[1]
                                        : './img/cap.png'
                                "
                                :alt="product.title"
                                style="width: 194px; height: 300px"
                            />
                        </div>
                        <div class="col-md-7">
                            <div class="card-body">
                                <h5 class="card-title">{{ product.title }}</h5>
                                <br />
                                <button
                                    @click="removeProduct(product.id)"
                                    type="button"
                                    class="btn btn-danger"
                                    aria-label="Close"
                                >
                                    Удалить
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            productName: "",
            products: [],
            categories: [],
            categoryId: "",
            picture: [],
            loading: true,
            processing: false,
            validationErrors: {
                name: "",
                categoryId: ""
            }
        };
    },
    computed: {
        filteredProducts() {
            return this.products.filter(prod =>
                this.categoryId ? prod["category_id"] === this.categoryId : true
            );
        }
    },

    methods: {
        getPicture(e) {
            this.picture = e.target.files[0];
        },
        getCategories() {
            axios.get("/categories/get").then(({ data }) => {
                this.categories = data;
            });
        },
        getProducts() {
            axios
                .get("/products/get")
                .then(({ data }) => {
                    this.products = data;
                })
                .finally(() => {
                    this.loading = false;
                });
        },
        createNewProduct() {
            this.processing = true;
            let fData = new FormData();
            if (this.productName.length === 0) {
                this.validationErrors.name = "Не должно быть пустым";
                this.processing = false;
                return;
            } else if (this.categoryId.length === 0) {
                this.validationErrors.categoryId = "Выберите категорию";
                this.processing = false;
                console.log(this.validationErrors.categoryId);
                return;
            }
            fData.append("name", this.productName);
            fData.append("picture", this.picture);
            fData.append("categoryId", this.categoryId);
            axios
                .post("/products/create", fData)
                .then(() => {
                    document.location.reload();
                })
                .finally(() => {
                    this.processing = false;
                });
        },
        removeProduct(productId) {
            axios
                .post("/products/delete", {
                    id: productId,
                    _method: "DELETE"
                })
                .then(() => document.location.reload());
        }
    },
    mounted() {
        this.getCategories();
        this.getProducts();
    },
    watch: {
        productName() {
            this.validationErrors.name = "";
        },
        categoryId() {
            this.validationErrors.categoryId = "";
        }
    }
};
</script>
