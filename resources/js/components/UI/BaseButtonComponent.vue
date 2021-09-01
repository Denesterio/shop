<template>
  <button :class="`btn btn-${bSize} ${buttonTypeClass}`">
    <slot></slot>
  </button>
</template>

<script>
export default {
  name: "base-button-component",
  props: {
    bSize: {
      type: String,
      required: false,
      default: "md",
    },

    bType: {
      type: String,
      required: false,
      default: "primary",
    },
  },

  computed: {
    buttonTypeClass() {
      switch (this.bType) {
        case "primary":
          return "btn-primary";
        case "delete":
          return "btn-outline-danger";
        case "create":
          return "btn-success";
        case "clear":
          return "btn-warning";
        case "edit":
          return "btn-outline-warning";
      }
    },
  },
};
</script>