<template>
  <div class="container mt-4">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card">
          <div class="card-header">Регистрация</div>

          <div class="card-body">
            <form method="POST">
              <div class="form-group row">
                <label for="name" class="col-md-4 col-form-label text-md-right"
                  >Логин</label
                >

                <div class="col-md-6">
                  <input
                    v-model="name"
                    id="name"
                    type="text"
                    class="form-control"
                    name="name"
                    value=""
                    required
                    autocomplete="name"
                    autofocus
                  />

                  <span class="invalid-feedback" role="alert">
                    <strong></strong>
                  </span>
                </div>
              </div>

              <div class="form-group row">
                <label for="email" class="col-md-4 col-form-label text-md-right"
                  >Электронная почта</label
                >

                <div class="col-md-6">
                  <input
                    v-model="email"
                    id="email"
                    type="email"
                    class="form-control"
                    name="email"
                    required
                    autocomplete="email"
                  />

                  <span class="invalid-feedback" role="alert">
                    <strong></strong>
                  </span>
                </div>
              </div>

              <div class="form-group row">
                <label
                  for="password"
                  class="col-md-4 col-form-label text-md-right"
                  >Пароль</label
                >

                <div class="col-md-6">
                  <input
                    v-model="password"
                    id="password"
                    type="password"
                    class="form-control"
                    name="password"
                    required
                    autocomplete="new-password"
                  />

                  <span class="invalid-feedback" role="alert">
                    <strong></strong>
                  </span>
                </div>
              </div>

              <div class="form-group row">
                <label
                  for="password-confirm"
                  class="col-md-4 col-form-label text-md-right"
                  >Подтвердите пароль</label
                >

                <div class="col-md-6">
                  <input
                    v-model="confirmPassword"
                    id="password-confirm"
                    type="password"
                    class="form-control"
                    name="password_confirmation"
                    required
                    autocomplete="new-password"
                  />
                </div>
              </div>

              <div class="form-group row mb-0">
                <div class="col-md-6 offset-md-4">
                  <button
                    @click.prevent="register"
                    type="submit"
                    class="btn btn-primary"
                  >
                    Регистрация
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { authRegister } from "../../api/auth.js";
export default {
  data() {
    return {
      name: "",
      email: "",
      password: "",
      confirmPassword: "",
    };
  },
  methods: {
    register() {
      if (this.password !== this.confirmPassword) return;
      const params = {
        name: this.name,
        email: this.email,
        password: this.password,
      };
      if (Object.values(params).every((v) => v.length > 0)) {
        authRegister(params)
          .then(() => {
            Vue.swal.fire({
              icon: "success",
              title: "Регистрация завершена",
              text: "Вы успешно зарегистрировались",
            });
          })
          .catch(() => {
            Vue.swal.fire({
              icon: "error",
              title: "Ошибка",
              text: "Не удалось зарегистрироваться",
            });
          });
      } else {
        alert("Не должно быть пустых полей");
      }
    },
  },
};
</script>