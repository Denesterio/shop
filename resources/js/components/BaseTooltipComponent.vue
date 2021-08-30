<template>
  <div :class="`base-tooltip-${size}`">
    {{ text }}
  </div>
</template>
<script>
export default {
  props: {
    text: {
      type: String,
      required: false,
      default: "",
    },
    size: {
      type: String,
      required: false,
      default: "md",
    },
  },
};
</script>