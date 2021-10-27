// работает в паре с BasePagination, в который передаются
// :settings="paginationSettings"
export default {
  data() {
    return {
      paginationSettings: { links: [], countOnPage: this.countOnPage }
    };
  },

  paginationSettingsKeys: [
    'current_page',
    'next_page_url',
    'prev_page_url',
    'first_page_url',
    'total'
  ],

  methods: {
    // response.data, field in data <String>
    fillDataFromResponse(resData, fieldFilledByRequest) {
      this[fieldFilledByRequest] = resData;
      // this.paginationSettings.links = resData.links.slice(
      //   1,
      //   resData.links.length - 1
      // );
      // this.$options.paginationSettingsKeys.forEach(
      //   key => (this.paginationSettings[key] = resData[key])
      // );
    }
  }
};
