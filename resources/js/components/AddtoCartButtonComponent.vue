<template>
    <p class="card-text">
      <slot name="start"></slot>
      <span class="" v-if="quantity">
        <button
          @click="$emit('delete-from-order', id)"
          class="btn btn-outline-dark btn-sm ml-3 font-weight-bold"
        >
          -
        </button>
        <button class="btn btn-outline-dark btn-sm font-weight-bold" disabled>
          В корзине: {{ quantity }}
        </button>
        <button
          @click="$emit('add-to-order', id)"
          class="btn btn-outline-dark btn-sm font-weight-bold"
        >
          +
        </button>
      </span>
      <button
        v-else
        @click="$emit('add-to-order', id)"
        class="btn btn-info btn-sm ml-3"
      >
        Добавить в корзину
      </button>
    </p>
</template>

<script>
export default {
    props: ['quantity', 'id'],
}
</script>