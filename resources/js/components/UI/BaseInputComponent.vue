<template>
  <label
    ><slot></slot
    ><input
      :for="field"
      @input="updateValue"
      :value="value"
      :id="field"
      :type="type"
      :placeholder="placeholder" /><slot></slot
  ></label>
</template>

<script>
export default {
  name: "base-input-component",
  props: {
    value: {
      type: [String, Number],
      required: true,
    },
    type: {
      type: String,
      required: false,
      default: "text",
    },
    placeholder: {
      type: String,
      required: false,
      default: "",
    },
    field: {
      type: String,
      required: false,
      default: "",
    },
  },

  methods: {
    updateValue(event) {
      this.$emit("input", event.target.value);
    },
  },
};
</script>