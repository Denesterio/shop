<template>
    <div class="container text-center pt-5">
      <svg
        xmlns:svg="http://www.w3.org/2000/svg"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        version="1.0"
        :width="`${width}px`"
        :height="`${width}px`"
        viewBox="0 0 128 128"
        xml:space="preserve"
      >
        <g>
          <circle cx="16" cy="64" r="16" fill="#000" />
          <circle cx="16" cy="64" r="16" fill="#555" transform="rotate(45,64,64)" />
          <circle cx="16" cy="64" r="16" fill="#949494" transform="rotate(90,64,64)" />
          <circle cx="16" cy="64" r="16" fill="#ccc" transform="rotate(135,64,64)" />
          <animateTransform
            attributeName="transform"
            type="rotate"
            values="0 64 64;315 64 64;270 64 64;225 64 64;180 64 64;135 64 64;90 64 64;45 64 64"
            calcMode="discrete"
            dur="800ms"
            repeatCount="indefinite"
          ></animateTransform>
        </g>
      </svg>
    </div>
</template>

<script>
export default {
    props: {
        width: {
            type: Number,
            required: false,
            default: 64,
        },
    }
}
</script>