<template>
    <div
      class="
        position-fixed
        w-100
        h-100
        bg-secondary
        d-flex
        align-items-center
        justify-content-center
      "
    >
      <svg
        class="animate-spin mr-3 text-white"
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
      >
        <circle
          class="opacity-25"
          cx="12"
          cy="12"
          r="10"
          stroke="currentColor"
          stroke-width="4"
        ></circle>
        <path
          class="opacity-75"
          fill="currentColor"
          d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
        ></path>
      </svg>
    </div>
</template>

<style scoped>
    position-fixed {
        z-index: 1040;
        opacity: 80%;
        top: 0px;
        bottom: 0px;
        left: 0px;
        right: 0px;
    }
    opacity-25 {
        opacity: 25%;
    }
    opacity-75 {
        opacity: 75%;
    }
    animate-spin {
        height: 120px;
        width: 120px;
    }
</style>