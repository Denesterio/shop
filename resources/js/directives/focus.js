export default {
  inserted: function(el) {
    if (el.tagName === 'INPUT') {
      el.focus();
    } else if (el.tagName === 'DIV') {
      el.querySelector('input').focus();
    }
  },

  name: 'focus'
};
