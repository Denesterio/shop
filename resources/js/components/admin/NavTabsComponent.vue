<template>
  <div>
    <h5><slot name="header"></slot></h5>
    <ul
      @click="makeLinkActive"
      v-if="entities.length"
      class="nav nav-pills nav-fill"
    >
      <li v-for="(entity, index) in entities" :key="index" class="nav-item">
        <a
          @click.prevent="makeLinkActive"
          class="nav-link"
          :class="{ active: activeIndex === index }"
          :data-link="entity"
          href=""
          v-t="`link.${entity}`"
        ></a>
      </li>
      <li>
        <a
          @click.prevent="remove"
          class="nav-link"
          href=""
          v-t="`link.clearForm`"
        ></a>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: {
    entities: {
      type: Array,
      required: false,
      default: () => [],
    },
  },

  data() {
    return {
      activeIndex: -1,
    };
  },

  methods: {
    makeLinkActive(event) {
      this.activeIndex = this.entities.findIndex(
        (link) => link === event.target.dataset.link
      );
      this.$emit("changeActive", event.target.dataset.link);
    },
    remove() {
      this.$emit("changeActive", "");
    },
  },
};
</script>