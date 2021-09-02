<template>
  <div class="form-group">
    <label :for="field" class="input-label" v-upfirst><slot></slot></label>
    <textarea
      rows="10"
      v-if="type === 'textarea'"
      :value="value"
      :id="field"
      @input="updateValue"
      :type="type"
      class="form-control"
      :class="{ 'is-invalid': error.length }"
      :placeholder="placeholder"
      :readonly="readonly"
    ></textarea>
    <input
      v-else
      :value="value"
      :id="field"
      @input="updateValue"
      :type="type"
      class="form-control"
      :class="{ 'is-invalid': error.length }"
      :placeholder="placeholder"
      :readonly="readonly"
    />

    <p v-if="error.length" class="invalid-feedback">
      {{ error }}
    </p>
  </div>
</template>

<script>
export default {
  name: "base-input-group-component",
  props: {
    value: [String, Number],
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
    error: {
      type: String,
      required: false,
      default: "",
    },
    readonly: {
      type: Boolean,
      required: false,
      default: false,
    },
    focus: {
      type: Boolean,
      required: false,
      default: false,
    },
  },

  methods: {
    updateValue(event) {
      this.$emit("input", event.target.value);
    },
  },
};
</script>