<template>
  <div class="container mt-4">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <svg-loading-component v-if="processing" />
        <div v-else class="card">
          <div class="card-header">Авторизация</div>

          <div class="card-body">
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
                  name="email"
                  required
                  autocomplete="email"
                  autofocus
                />
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
                  name="password"
                  required
                  autofocus
                />
              </div>
            </div>
            <div class="form-group row mb-0">
              <div class="col-md-8 offset-md-4">
                <button @click="login" class="btn btn-primary">Войти</button>
              </div>
            </div>
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
import SvgLoadingComponent from "../svg/SvgLoadingComponent.vue";
export default {
  components: { SvgLoadingComponent },
  data() {
    return {
      email: "",
      password: "",
      errors: [],
      processing: false,
    };
  },
  methods: {
    login() {
      this.processing = true;
      const formData = new FormData();
      formData.append("email", this.email);
      formData.append("password", this.password);

      this.$store
        .dispatch("login", formData)
        .then(() => {
          this.$router.push(this.$route.query.redirect || "/");
        })
        .catch((error) => {
          this.errors = error.response.data.errors;
        })
        .finally(() => {
          this.processing = false;
        });
    },
  },
};
</script>

<style scoped>
.alert-danger {
  margin-top: 0;
  margin-bottom: 0;
}
</style>