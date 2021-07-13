<template>
  <section>
    <ul class="list-group">
      <li class="list-group-item">
        Имя: <strong>{{ user.name }}</strong>
        <a
          @click.prevent="openModal('name')"
          class="font-italic ml-4"
          noreferrer
          nofollow
          >изменить</a
        >
      </li>
      <li class="list-group-item">
        Электронный адрес: <strong>{{ user.email }}</strong>
        <a
          @click.prevent="openModal('email')"
          class="font-italic ml-4"
          noreferrer
          nofollow
          >изменить</a
        >
      </li>
      <li class="list-group-item">Пароль:</li>
      <li class="list-group-item">
        Дата регистации: <strong>{{ formattedDate }}</strong>
      </li>
    </ul>

    <modal-profile-component
      v-if="isModalOpen"
      :field="fieldToChange"
      :user="user"
      :editing="editing"
      @close-modal-window="closeModal"
      @stop-editing="stopEditing"
    >
      <template v-slot:footer>
        <p class="text-danger">
          {{ "Для подтверждения введите текущий " + fieldToChange }}
        </p>
        <div class="input-group mb-3">
          <input
            v-model="confirmInput"
            :type="typeInput"
            :editing="editing"
            class="form-control form-control-sm"
            aria-label="old value"
            aria-describedby="button-addon2"
          />
          <button
            @click="editUser"
            class="btn btn-success ml-2 btn-sm"
            type="button"
            id="button-addon2"
            :disabled="isButtonDisabled"
          >
            Сохранить
          </button>
        </div>
      </template>
    </modal-profile-component>
  </section>
</template>

<script>
import ModalProfileComponent from "./ModalProfileComponent.vue";

export default {
  components: { ModalProfileComponent },
  props: {
    user: {
      type: Object,
      required: true,
    },
  },

  data() {
    return {
      isModalOpen: false,
      fieldToChange: "",
      confirmInput: "",
      editing: false,
    };
  },

  computed: {
    formattedDate() {
      const [date] = this.user["updated_at"].split("T");
      return date.split("-").reverse().join(".");
    },
    typeInput() {
      return this.fieldToChange === "name" ? "text" : "email";
    },
    isButtonDisabled() {
      return this.confirmInput !== this.user[this.fieldToChange];
    },
  },

  methods: {
    openModal(field) {
      this.isModalOpen = true;
      this.fieldToChange = field;
    },
    closeModal() {
      this.confirmInput = "";
      this.fieldToChange = "";
      this.isModalOpen = false;
    },
    editUser() {
      this.editing = true;
    },
    stopEditing() {
      this.editing = false;
      this.isModalOpen = false;
      this.confirmInput = "";
    },
  },
};
</script>

<style scoped>
strong {
  font-size: 1rem;
}
.list-group-item a:hover {
  cursor: pointer;
}
</style>