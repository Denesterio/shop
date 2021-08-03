<template>
  <transition name="modal-fade">
    <div
      @click.self="closeModal"
      id="modal"
      class="
        modal
        position-fixed
        w-100
        h-100
        d-flex
        align-items-center
        justify-content-center
      "
      role="dialog"
      aria-labelledby="modalTitle"
      aria-describedby=""
    >
      <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header p-2">
            <h5
              id="modalTitle"
              class="modal-title mx-2 px-2"
              aria-label="Close modal"
            >
              {{ title }}
            </h5>
            <span
              ref="tabCatcher1"
              id="catcher1"
              tabindex="0"
              aria-hidden="true"
            ></span>
            <b-button-close
              ref="closeButton"
              id="closeButton"
              @click="closeModal"
              class="closeButton"
            />
          </div>
          <section class="modal-body">
            <div class="form-group">
              <input
                type="text"
                v-model="currentValue"
                class="form-control"
                :class="{ 'is-invalid': isFieldInvalid(field) }"
              />
              <p class="invalid-feedback">
                {{ getErrorMessage(field) }}
              </p>
            </div>
          </section>
          <div class="modal-footer">
            <slot name="footer" :editUser="editUser"></slot>
          </div>
          <span
            ref="tabCatcher2"
            id="catcher2"
            tabindex="0"
            aria-hidden="true"
          ></span>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
import { editUserField } from "../../api/edit.js";
import { getErrors } from "../../validate.js";
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
    elemsUnderModal: {
      type: Array,
      required: false,
      default: () => [],
    },
  },

  data() {
    return {
      currentValue: this.user[this.field],
      errors: [],
    };
  },

  computed: {
    title() {
      return this.field === "name"
        ? "Введите новое имя пользователя"
        : "Введите новый электронный адрес";
    },
  },

  button: null,
  input: null,

  mounted() {
    this.$options.input = document.getElementById("confirmationInput");
    this.$options.button = document.getElementById("confirmationButton");
    if (window.innerWidth - document.documentElement.clientWidth !== 0) {
      document.body.classList.add("mr-3");
    }
    document.body.classList.add("overflow-hidden");
    this.elemsUnderModal.forEach((elem) => {
      elem.tabIndex = -1;
    });
    [this.$refs.tabCatcher1, this.$refs.tabCatcher2].forEach((span) => {
      span.addEventListener("focus", this.tabHandler);
    });
  },

  beforeDestroy() {
    this.elemsUnderModal.forEach((elem) => {
      elem.tabIndex = 0;
    });
    document.body.classList.remove("mr-3");
    document.body.classList.remove("overflow-hidden");
    [(this.$refs.tabCatcher1, this.$refs.tabCatcher2)].forEach((span) => {
      span.removeEventListener("focus", this.tabHandler);
    });
  },

  methods: {
    tabHandler(event) {
      if (event.relatedTarget?.id === "closeButton") {
        const targetNext = this.$options.button.disabled
          ? this.$options.input
          : this.$options.button;
        targetNext.focus();
      } else {
        this.$refs.closeButton.focus();
      }
    },

    closeModal() {
      this.$emit("close-modal-window");
    },

    editUser() {
      const params = {
        [this.field]: this.currentValue,
        field: this.field,
      };
      editUserField(params)
        .then(({ data }) => {
          this.$store.commit("setUser", data);
          this.closeModal();
        })
        .catch((error) => {
          try {
            this.errors = getErrors(error);
          } catch (err) {
            Vue.swal.fire({
              icon: "error",
              title: "Ошибка",
              text: this.$t("error.сreateError", { msg: "изменить данные" }),
            });
          }
        });
    },

    isFieldInvalid(field) {
      return this.errors.some((error) => error.isFieldInvalid(field));
    },

    getErrorMessage(field) {
      return this.errors
        .find((error) => error.getField() === field)
        ?.getMessage();
    },
  },
};
</script>

<style scoped>
.modal {
  background-color: rgba(25, 25, 25, 0.5);
  z-index: 9998;
  top: 0;
  left: 0;
  transition: opacity 0.5s ease;
}
.modal-header {
  text-align: center;
  padding: 0.5rem;
  justify-content: space-around;
  justify-items: center;
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
.modal-fade-enter,
.modal-fade-leave-active {
  opacity: 0;
}

.modal-fade-enter-active,
.modal-fade-leave-active {
  transition: opacity 0.5s ease;
}
</style>