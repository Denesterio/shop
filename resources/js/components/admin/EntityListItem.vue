<template>
  <li class="row justify-content-between mb-2 p-2">
    <div class="col-md-6 col-lg-8 p-2 border-bottom">
      {{ entity.title }}
    </div>
    <div class="col-md-6 col-lg-4">
      <button
        v-b-toggle="`collapse-details-${entity.id}`"
        v-t="'label.details'"
        class="btn btn-outline-primary btn-sm"
        aria-label="Детали"
      ></button>
      <base-button-component
        @click.native="remove(entity.id)"
        :disabled="processing"
        bType="edit"
        v-t="'label.edit'"
        bSize="sm"
        class=""
        aria-label="Редактировать"
      ></base-button-component>
      <base-button-component
        @click.native="remove(entity.id)"
        :disabled="processing"
        bType="delete"
        v-t="'label.delete'"
        bSize="sm"
        class=""
        aria-label="Удалить"
      ></base-button-component>
    </div>
    <b-collapse :id="`collapse-details-${entity.id}`">
      <b-card class="card mt-1">
        <ul>
          <li v-for="(value, property) in entity" :key="property">
            <b>{{ property }}</b> {{ value }};
          </li>
        </ul>
      </b-card>
    </b-collapse>
  </li>
</template>

<script>
export default {
  props: {
    entity: {
      type: Object,
      required: false,
      default: () => {},
    },
    processing: {
      type: Boolean,
      required: false,
      default: false,
    },
  },
};
</script>