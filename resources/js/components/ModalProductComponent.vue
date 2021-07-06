<template>
    <div class="
        modal
        position-fixed
        w-100
        h-100
        d-flex
        align-items-center
        justify-content-center"
        id="staticBackdrop"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
    >
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header p-2 text-center">
                <h4 class="modal-title"><slot name="title"></slot></h4>
              </div>
              <div class="modal-body">
                ...
              </div>
              <div class="modal-footer">
                <slot name="footer"></slot>
                <button type="button" class="btn btn-primary">Добавить в корзину</button>
              </div>
            </div>
        </div>

    </div>
</template>

<style scoped>
  .modal {
    background-color: rgba(25,25,25, 0.5);
  }
  .modal-header {
      text-align: center;
      padding: 0.5rem;
  }
</style>