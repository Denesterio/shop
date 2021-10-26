<template>
  <section>
    <div>
      <b-form-group label="Отобразить товары" v-slot="{ ariaDescribedby }">
        <b-form-radio-group
          id="btn-radios-1"
          v-model="selectedView"
          :options="optionsView"
          :aria-describedby="ariaDescribedby"
          name="radio-btn-outline"
          button-variant="outline-primary"
          buttons
          size="sm"
        ></b-form-radio-group>
      </b-form-group>
    </div>
    <div>
      <base-select-component
        :options="countOnPageOptions"
        v-bind="countOnPage"
        :field="countOnPage"
        >Количество на странице:</base-select-component
      >
    </div>
    <div>
      <base-input-component v-model="searchQuery">Поиск:</base-input-component>
      <base-select-component
        :options="searchOptions"
        v-model="searchType"
        field="searchType"
      />
      <base-button-component @click.native="searchProducts" bSize="sm">Найти<base-button-component>
    </div>
  </section>
</template>

<script>
import BaseButtonComponent from "../UI/BaseButtonComponent.vue";
export default {
  components: { BaseButtonComponent },
  data() {
    return {
      optionsView: [
        { text: "Карточками", value: "Card" },
        { text: "Списком", value: "Point" },
      ],
      countOnPageOptions: [{ value: 24 }, { value: 36 }, { value: 48 }],
      searchOptions: [
        { value: "byAuthor", text: "По автору" },
        { value: "byTitle", text: "По названию" },
      ],
    };
  },
};
</script>