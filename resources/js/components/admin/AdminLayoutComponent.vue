<template>
  <div class="container-xl my-4 overflow-hidden shadow p-3">
    <nav-tabs-component @change-active="changeForm" :entities="entities">
      <template v-slot:header>Добавить:</template>
    </nav-tabs-component>
    <nav-tabs-component
      @change-active="changeList"
      :entities="entities"
      class="mt-3"
    >
      <template v-slot:header>Загрузить:</template>
    </nav-tabs-component>
    <hr />
    <keep-alive>
      <component :is="activeForm" />
    </keep-alive>
    <entity-list-component
      @show-edit-form="showEntityEditForm"
      :enType="activeList"
      :editedEntity="editedEntity"
    />
    <b-modal
      v-model="isModalOpen"
      id="modal-lg"
      size="lg"
      :title="$t('label.edit')"
      content-class="shadow"
      hide-backdrop
    >
      <component
        :is="currentEditFormComponent"
        formMode="editing"
        :entityForEdit="entityForEdit"
        @update-entity="updateEntities"
      />
      <template #modal-footer="{ cancel }">
        <b-button variant="secondary" @click="cancel()" v-t="'label.cancel'" />
      </template>
    </b-modal>
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
      activeForm: "", // component
      activeList: "", // name of entity in single
      isModalOpen: false,
      currentEditFormComponent: null,
      entityForEdit: "",
      editedEntity: null,
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

    showEntityEditForm(entityForEdit) {
      this.currentEditFormComponent = Object.values(forms).find(
        (form) => form.name === `${this.activeList}-component`
      );
      this.isModalOpen = true;
      this.entityForEdit = entityForEdit;
    },

    updateEntities(data) {
      this.editedEntity = data;
      this.isModalOpen = false;
      this.entityForEdit = null;
    },
  },
};
</script>