<template>
  <button :disabled="processing" class="btn btn-success" type="submit">
    <div
      v-if="processing"
      class="spinner-border text-light spinner-border-sm"
      role="status"
    >
      <span class="visually-hidden"></span>
    </div>
    <span v-else>{{ $t("label.create") }}</span>
  </button>
</template>

<script>
export default {
  props: {
    processing: {
      type: Boolean,
      required: true,
    },
  },
};
</script>

