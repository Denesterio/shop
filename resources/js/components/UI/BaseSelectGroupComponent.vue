<template>
  <div class="form-group">
    <label :for="field" class="input-label" v-upfirst><slot></slot></label>
    <select
      :value="value"
      :id="field"
      @change="updateValue"
      class="form-control"
      :class="{ 'is-invalid': error.length }"
    >
      <option value="" selected v-t="'label.all'"></option>
      <option
        v-for="entity in entities"
        :value="entity[optionValue]"
        :key="entity[forKey]"
      >
        {{ entity.title }}
      </option>
    </select>

    <p v-if="error.length" class="invalid-feedback">
      {{ error }}
    </p>
  </div>
</template>

<script>
export default {
  name: "base-select-group-component",
  props: {
    value: {
      type: [String, Number],
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
    entities: {
      type: Array,
      required: false,
      default: () => [],
    },
    forKey: {
      type: String,
      required: false,
      default: "id",
    },
    optionValue: {
      type: String,
      required: false,
      default: "id",
    },
  },

  methods: {
    updateValue(event) {
      this.$emit("input", event.target.value);
    },
  },
};
</script>