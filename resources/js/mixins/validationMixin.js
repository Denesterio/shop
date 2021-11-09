import { getErrors } from '../validate.js';

export default {
  data() {
    return {
      errors: []
    };
  },

  methods: {
    getErrorMessage(field) {
      return this.errors
        .find(error => error.getField() === field)
        ?.getMessage();
    },

    isValid(field) {
      return this.errors.findIndex(error => error.getField() === field) >= 0;
    },

    async validate(schema, obj) {
      this.errors = [];
      try {
        await schema.validate(obj, {
          abortEarly: false
        });
      } catch (error) {
        this.errors = getErrors(error);
      }
      return this.errors.length > 0;
    },

    handleServerError(error, message) {
      if (error?.response?.data?.status === 403) {
        Vue.swal.fire({
          icon: 'error',
          title: 'Ошибка',
          text: error.response.data.message
        });
      } else {
        try {
          this.errors = getErrors(error);
        } catch (err) {
          Vue.swal.fire({
            icon: 'error',
            title: 'Ошибка',
            text: this.$t('error.сreateError', { msg: message })
          });
        }
      }
    }
  }
};
