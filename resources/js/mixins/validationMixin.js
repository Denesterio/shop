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
    }
  }
};
