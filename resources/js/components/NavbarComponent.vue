<template>
    <nav class="
        navbar
        navbar-expand-md
        navbar-light
        bg-white
        shadow
        border-bottom
        border-info"
    >
        <div class="container">
            <a class="navbar-brand" href="/">
                {{ appName }}
            </a>
            <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Left Side Of Navbar -->
                <ul class="navbar-nav mr-auto"></ul>

                <!-- Right Side Of Navbar -->
                <ul class="navbar-nav ml-auto">
                    <template v-if="user.name">
                        <li class="nav-item">
                            <a class="nav-link" :href="routeCart">Корзина</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a id="navbarDropdown"
                               class="nav-link dropdown-toggle"
                               href="#"
                               role="button"
                               data-toggle="dropdown"
                               aria-haspopup="true"
                               aria-expanded="false"
                            >
                                {{user.name}}
                            </a>

                            <div
                                class="dropdown-menu dropdown-menu-right"
                                aria-labelledby="navbarDropdown"
                            >
                                <a
                                    v-if="isUserAdmin"
                                    href="/admin/products"
                                    class="dropdown-item"
                                >Добавить товар</a>
                                <a
                                    :href="routeProfile"
                                    class="dropdown-item"
                                >Личный кабинет</a>
                                <button
                                    @click='logout'
                                    class="
                                        btn
                                        btn-link
                                        dropdown-item
                                        nav-link
                                        text-center"
                                    >
                                    Выход</button>
                            </div>
                        </li>
                    </template>
                    <template v-else>
                        <!-- Authentication Links -->
                        <li class="nav-item">
                            <a class="nav-link" :href="routeLogin">Авторизация</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" :href="routeRegister">Регистрация</a>
                        </li>
                    </template>
                </ul>
            </div>
        </div>
    </nav>
</template>

<script>
export default {
    props: {
        appName: {
            type: String,
            required: true,
        },
        routeLogin: {
            type: String,
            required: true,
        },
        routeRegister: {
            type: String,
            required: true,
        },
        routeCart: {
            type: String,
            required: true,
        },
        routeLogout: {
            type: String,
            required: true,
        },
        routeProfile: {
            type: String,
            required: false,
            default: '/',
        },
        user: {
            type: Object,
            required: false,
            default: () => {},
        }
    },

    computed: {
        isUserAdmin() {
            return this.user?.admin === 1;
        }
    },

    methods: {
        logout() {
            axios.post(this.routeLogout)
            .then(() => {
                window.location.href = '/'
            })
        }
    },
}
</script>

<style scoped>
    .dropdown-item {
        color: rgba(0, 0, 0, 0.5);
    }
    .dropdown-item:hover {
        color: rgba(0, 0, 0, 0.7);
    }
</style>