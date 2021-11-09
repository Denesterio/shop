<template>
  <li class="list-group-item d-flex justify-content-between">
    <div><slot name="title"></slot></div>
    <slot name="right"></slot>
  </li>
</template>

<script>
export default {};
</script>