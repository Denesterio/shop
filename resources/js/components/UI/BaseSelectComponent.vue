<template>
  <label :for="field"
    ><slot></slot>
    <select
      :value="value"
      :id="field"
      @change="updateValue"
      class="form-control"
    >
      <option
        v-for="option in options"
        :value="option.value"
        :key="option"
        :selected="option === value"
      >
        {{ option.text || option.value }}
      </option>
    </select>
  </label>
</template>

<script>
export default {
  name: "base-select-component",
  props: {
    value: {
      type: [String, Number],
      required: true,
    },
    options: {
      type: Array,
      required: true,
    },
    field: {
      type: String,
      required: true,
    },
  },

  methods: {
    updateValue(event) {
      this.$emit("input", event.target.value);
    },
  },
};
</script>