// работает в паре с BasePagination, в который передаются
// current, total, onPage
export default {
  data() {
    return {
      countOnPage: '12',
      currentPage: 1,
      nextPage: 1,
      totalPages: null
    };
  },

  computed: {
    numberOnPage() {
      return parseInt(this.countOnPage);
    }
  },

  methods: {
    // response.data, field in data <String>
    fillDataFromResponse(resData, fieldFilledByRequest) {
      this[fieldFilledByRequest] = resData.data;
      this.totalPages = resData.total;
      this.currentPage = this.nextPage;
    }
  }
};
