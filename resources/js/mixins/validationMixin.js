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
};
