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
                    :class="{ 'is-invalid': isFieldInvalid('name') }"
                    name="name"
                    value=""
                    required
                    autocomplete="name"
                    autofocus
                  />

                  <p id="nameFeedback" class="invalid-feedback" role="alert">
                    {{ getErrorMessage("name") }}
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
                    :class="{ 'is-invalid': isFieldInvalid('email') }"
                    name="email"
                    required
                    autocomplete="email"
                  />

                  <p class="invalid-feedback" role="alert" id="emailFeedback">
                    {{ getErrorMessage("email") }}
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
                    @input="checkPasswordsMatch"
                    id="password"
                    type="password"
                    class="form-control"
                    :class="{ 'is-invalid': isFieldInvalid('password') }"
                    name="password"
                    required
                    autocomplete="new-password"
                  />

                  <p
                    class="invalid-feedback"
                    role="alert"
                    id="passwordFeedback"
                  >
                    {{ getErrorMessage("password") }}
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
                    id="confirmPassword"
                    type="password"
                    class="form-control"
                    :class="{ 'is-invalid': isFieldInvalid('confirmPassword') }"
                    name="password_confirmation"
                    required
                    autocomplete="new-password"
                    aria-label="Подтверждение пароля"
                  />
                  <p
                    class="invalid-feedback"
                    role="alert"
                    id="confirmPasswordFeedback"
                  >
                    {{ getErrorMessage("confirmPassword") }}
                  </p>
                </div>
              </div>

              <div class="form-group row mb-0">
                <div class="col-md-6 offset-md-4">
                  <button
                    @click.prevent="register"
                    type="submit"
                    id="submitButton"
                    data-testid="submitButton"
                    class="btn btn-primary"
                    v-t="'label.register'"
                    :disabled="isButtonDisabled"
                  ></button>
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
import RequestBuilder from "../../api/requestBuilder.js";
import { registrationSchema, getErrors } from "../../validate.js";
import CreateError from "../../services/createError.js";
export default {
  data() {
    return {
      name: "",
      email: "",
      password: "",
      confirmPassword: "",
      errors: [],
      processing: false,
    };
  },
  computed: {
    passwordsMatch() {
      return this.password === this.confirmPassword;
    },

    isButtonDisabled() {
      return (
        this.errors.length ||
        this.processing ||
        [this.name, this.email, this.password].some(
          (field) => field.length === 0
        )
      );
    },
  },

  methods: {
    checkPasswordsMatch() {
      if (!this.passwordsMatch) {
        this.errors.push(
          new CreateError("confirmPassword", "Пароли не совпадают")
        );
      } else {
        this.deleteError("confirmPassword");
      }
    },

    async register() {
      const params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.confirmPassword,
      };

      try {
        await registrationSchema.validate(params, { abortEarly: false });
      } catch (error) {
        this.errors = getErrors(error);
        return;
      }

      this.processing = true;
      const formData = new FormData();
      for (const key in params) {
        formData.append(key, params[key]);
      }

      new RequestBuilder("register")
        .create(formData)
        .then(({ data }) => {
          this.$store.dispatch("setUser", data);
          this.$router.push("/");
        })
        .catch((error) => {
          try {
            this.errors = getErrors(error);
          } catch (err) {
            Vue.swal.fire({
              icon: "error",
              title: "Ошибка",
              text: this.$t("error.сreateError", { msg: "зарегистрироваться" }),
            });
          }
        })
        .finally(() => {
          this.processing = false;
        });
    },

    isFieldInvalid(field) {
      return this.errors.some((error) => error.isFieldInvalid(field));
    },

    getErrorMessage(field) {
      return this.errors
        .find((error) => error.getField() === field)
        ?.getMessage();
    },

    deleteError(field) {
      this.errors = this.errors.filter((err) => err.getField() !== field);
    },
  },

  watch: {
    name() {
      this.deleteError("name");
    },
    email() {
      this.deleteError("email");
    },
    password() {
      this.deleteError("password");
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