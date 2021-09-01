export default {
  inserted: function(el) {
    el.textContent = el.textContent[0].toUpperCase() + el.textContent.slice(1);
  },
  update: function(el) {
    el.textContent = el.textContent[0].toUpperCase() + el.textContent.slice(1);
  },
  name: 'upfirst'
};
