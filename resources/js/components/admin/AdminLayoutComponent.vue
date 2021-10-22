<template>
  <div class="container-xl my-4 overflow-hidden shadow p-3">
    <nav-tabs-component @changeActive="changeForm" :entities="entities">
      <template v-slot:header>Добавить:</template>
    </nav-tabs-component>
    <nav-tabs-component
      @changeActive="changeList"
      :entities="entities"
      class="mt-3"
    >
      <template v-slot:header>Загрузить:</template>
    </nav-tabs-component>
    <hr />
    <keep-alive>
      <component :is="activeForm" />
    </keep-alive>
    <entity-list-component :enType="activeList" />
  </div>
</template>

<script>
import NavTabsComponent from "./NavTabsComponent.vue";
import EntityListComponent from "./EntityListComponent.vue";
import forms from "./forms.js";
export default {
  components: { EntityListComponent, NavTabsComponent, ...forms },
  data() {
    return {
      activeForm: "",
      activeList: "",
    };
  },

  computed: {
    entities() {
      return Object.values(forms).map((form) => form.name.split("-")[0]);
    },
  },

  methods: {
    changeForm(entity) {
      this.activeForm = Object.values(forms).find(
        (form) => form.name === `${entity}-component`
      );
    },

    changeList(entity) {
      this.activeList = entity;
    },
  },
};
</script>