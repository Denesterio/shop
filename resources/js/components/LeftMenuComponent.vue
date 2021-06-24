<template>
  <div class="accordion" role="tablist">
    <b-card v-for="category in categories" :key="category.id" no-body class="mb-1">
      <b-card-header header-tag="header" class="p-1" role="tab">
        <b-button block v-b-toggle="`accordion` + category.id" variant="info">
          {{ category.title }}
        </b-button>
      </b-card-header>
      <b-collapse :id="`accordion` + category.id" visible accordion="my-accordion" role="tabpanel">
        <b-card-body>
          <div
            class="list-group list-group-flush"
            v-if="
              subcategories.filter((subcat) => subcat['category_id'] === category.id).length > 0
            "
          >
            <a
              class="list-group-item list-group-item-action"
              v-for="subcategory in subcategories.filter(
                (subcat) => subcat['category_id'] === category.id
              )"
              :key="subcategory.id"
              :href="`/subcategories/${subcategory.slug}`"
            >
              {{ subcategory.title }}
            </a>
          </div>
          <ul class="list-group list-group-flush" v-else>
            <li class="list-group-item" :href="`/categories/${category.id}`">
              {{ category.title }}
            </li>
          </ul>
        </b-card-body>
      </b-collapse>
    </b-card>
  </div>
</template>

<script>
  export default {
    props: ['categories', 'subcategories'],
    data() {
      return {
        openedId: '',
      };
    },

    methods: {},
  };
</script>

<style scoped href="../css/app.css"></style>
