<template>
  <section>
    <ul class="list-group">
      <li class="list-group-item">
        {{ $t("label.login") }}: <strong>{{ user.name }}</strong>
        <a
          @click.prevent="openModal('name')"
          class="font-italic ml-4"
          noreferrer
          nofollow
          >{{ $t("label.change") }}</a
        >
      </li>
      <li class="list-group-item">
        {{ $t("label.email") }}: <strong>{{ user.email }}</strong>
        <a
          @click.prevent="openModal('email')"
          class="font-italic ml-4"
          noreferrer
          nofollow
          >{{ $t("label.change") }}</a
        >
      </li>
      <li class="list-group-item">{{ $t("label.password") }}:</li>
      <li class="list-group-item">
        {{ $t("label.registerDate") }}: <strong>{{ formattedDate }}</strong>
      </li>
    </ul>

    <modal-profile-component
      v-if="isModalOpen"
      :field="fieldToChange"
      :user="user"
      :elemsUnderModal="elemsUnderModal"
      @close-modal-window="closeModal"
    >
      <template v-slot:footer="{ editUser }">
        <p class="text-danger">
          {{ "Для подтверждения введите текущий " + fieldToChange }}
        </p>
        <div class="input-group mb-3">
          <input
            v-model="confirmInput"
            :type="typeInput"
            id="confirmationInput"
            class="form-control form-control-sm"
            aria-label="old value"
            aria-describedby="confirmationButton"
          />
          <button
            @click="editUser"
            class="btn btn-success ml-2 btn-sm"
            type="button"
            id="confirmationButton"
            :disabled="isButtonDisabled"
            v-t="'label.save'"
          ></button>
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
    elemsUnderModal() {
      const elems = [];
      document.body.getElementsByTagName("*").forEach((elem) => {
        if (elem.tabIndex > -1) {
          elems.push(elem);
        }
      });
      return elems;
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
.text-danger {
  font-size: 0.8rem;
}
</style>