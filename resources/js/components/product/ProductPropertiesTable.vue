<template>
  <table class="table table-borderless">
    <tbody>
      <tr v-for="(prop, key) of preparedProps" :key="key" class="border-bottom">
        <td>{{ $t(`keys.${key}`) }}</td>
        <td>{{ prop }}</td>
      </tr>
    </tbody>
  </table>
</template>

<script>
export default {
  props: {
    product: {
      type: Object,
      required: true,
    },
  },

  computed: {
    preparedProps() {
      return Object.fromEntries(
        Object.entries(this.product)
          .filter((prop) =>
            this.$options.SECONDARY_PROPERTIES.includes(prop[0])
          )
          .map((prop) => {
            if (typeof prop[1] === "object" && "title" in prop[1]) {
              return [prop[0], prop[1].title];
            }

            return prop;
          })
      );
    },
  },

  SECONDARY_PROPERTIES: ["year", "pages", "cover"],
};
</script>