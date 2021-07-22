<template>
  <div class="container mt-4">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card">
          <div class="card-header" v-t="'label.register'"></div>

          <div class="card-body">
            <form>
              <div class="form-group row">
                <label
                  v-t="'label.login'"
                  for="name"
                  class="col-md-4 col-form-label text-md-right"
                ></label>

                <div class="col-md-6">
                  <input
                    v-model="name"
                    id="name"
                    type="text"
                    class="form-control"
                    :class="{ 'is-invalid': validationErrors.name }"
                    name="name"
                    value=""
                    required
                    autocomplete="name"
                    autofocus
                  />

                  <p class="invalid-feedback" role="alert">
                    {{ validationErrors.name }}
                  </p>
                </div>
              </div>

              <div class="form-group row">
                <label
                  v-t="'label.email'"
                  for="email"
                  class="col-md-4 col-form-label text-md-right"
                ></label>

                <div class="col-md-6">
                  <input
                    v-model="email"
                    id="email"
                    type="email"
                    class="form-control"
                    :class="{ 'is-invalid': validationErrors.email }"
                    name="email"
                    required
                    autocomplete="email"
                  />

                  <p class="invalid-feedback" role="alert">
                    {{ validationErrors.email }}
                  </p>
                </div>
              </div>

              <div class="form-group row">
                <label
                  v-t="'label.password'"
                  for="password"
                  class="col-md-4 col-form-label text-md-right"
                ></label>

                <div class="col-md-6">
                  <input
                    v-model="password"
                    id="password"
                    type="password"
                    class="form-control"
                    :class="{ 'is-invalid': validationErrors.password }"
                    name="password"
                    required
                    autocomplete="new-password"
                  />

                  <p class="invalid-feedback" role="alert">
                    {{ validationErrors.password }}
                  </p>
                </div>
              </div>

              <div class="form-group row">
                <label
                  v-t="'label.passwordConfirm'"
                  for="password-confirm"
                  class="col-md-4 col-form-label text-md-right"
                ></label>

                <div class="col-md-6">
                  <input
                    v-model="confirmPassword"
                    @input="checkPasswordsMatch"
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
                    v-t="'label.register'"
                    :disabled="!passwordsMatch"
                  ></button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div v-for="(error, idx) in errors" :key="idx">
          <div class="alert alert-danger" role="alert">
            {{ error[0] }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { authRegister } from "../../api/auth.js";
import { registrationSchema } from "../../validate.js";
export default {
  data() {
    return {
      name: "",
      email: "",
      password: "",
      confirmPassword: "",
      errors: [],
      validationErrors: {
        name: "",
        email: "",
        password: "",
      },
    };
  },
  computed: {
    passwordsMatch() {
      return this.password === this.confirmPassword;
    },
  },

  methods: {
    checkPasswordsMatch() {
      if (!this.passwordsMatch) {
        this.errors = [["Пароли не совпадают"]];
      } else {
        this.errors = [];
      }
    },

    register() {
      const params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.confirmPassword,
      };
      registrationSchema
        .validate(params, { abortEarly: false })
        .then(() => {
          authRegister(params)
            .then(({ data }) => {
              this.$store.dispatch("setUser", data);
              this.$router.push("/");
            })
            .catch((error) => {
              this.errors = error.response.data.errors;
            });
        })
        .catch((error) => {
          error.inner.forEach((err) => {
            this.validationErrors[err.path] = err.message;
          });
        });
    },
  },
};
</script>

<style scoped>
.invalid-feedback {
  margin-bottom: 0;
}
.alert-danger {
  margin-top: 0;
  margin-bottom: 0;
}
</style>