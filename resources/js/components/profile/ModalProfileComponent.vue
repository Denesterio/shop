<template>
  <div
    @click.self="closeModal"
    class="
      modal
      position-fixed
      w-100
      h-100
      d-flex
      align-items-center
      justify-content-center
    "
    tabindex="-1"
  >
    <div class="modal-dialog modal-md modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header p-2">
          <h4 class="modal-title mx-2 px-2">
            {{ title }}
          </h4>
          <b-button-close @click="closeModal" class="closeButton" />
        </div>
        <div class="modal-body">
          <input type="text" v-model="currentValue" class="form-control" />
        </div>
        <div class="modal-footer">
          <slot name="footer"></slot>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { editUserField } from "../../api/edit.js";
export default {
  props: {
    field: {
      required: true,
      type: String,
    },
    user: {
      type: Object,
      required: true,
    },
    editing: {
      type: Boolean,
      required: true,
    },
  },

  data() {
    return {
      currentValue: this.user[this.field],
    };
  },

  computed: {
    title() {
      return this.field === "name"
        ? "Введите новое имя пользователя"
        : "Введите новый электронный адрес";
    },
  },

  methods: {
    closeModal() {
      this.$emit("close-modal-window");
    },
    editUser() {
      const params = {
        name: this.currentValue,
        field: this.field,
      };
      editUserField()
        .then(({ data }) => this.$store.commit("setUser", data))
        .finally(() => this.$emit("stop-editing"));
    },
  },

  watch: {
    editing(newValue, oldValue) {
      if (newValue) {
        this.editUser();
      }
    },
  },
};
</script>

<style scoped>
.modal {
  background-color: rgba(25, 25, 25, 0.5);
}
.modal-header {
  text-align: center;
  padding: 0.5rem;
}
.closeButton {
  width: 4rem;
  font-size: 2rem;
}
.modal-footer {
  align-items: flex-start;
  justify-content: space-between;
}
.text-danger {
  font-size: 0.8rem;
}
.modal-header {
  justify-content: space-around;
  justify-items: center;
}
</style>