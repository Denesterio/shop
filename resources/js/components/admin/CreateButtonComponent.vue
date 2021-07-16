<template>
  <button :disabled="processing" class="btn btn-success">
    <div
      v-if="processing"
      class="spinner-border text-light spinner-border-sm"
      role="status"
    >
      <span class="visually-hidden"></span>
    </div>
    <span v-else>{{ $t("label.save") }}</span>
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

