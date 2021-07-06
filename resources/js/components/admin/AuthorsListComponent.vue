<template>
  <div class="container mt-5">
    <form class="container-xl mb-4">
      <h1>{{ title }}</h1>
      <p><a href="/admin/categories">на страницу добавления категорий</a></p>
      <p><a href="/admin/subcategories">на страницу добавления подкатегорий</a></p>
      <p><a href="/admin/products">на страницу добавления товаров</a></p>

      <div class="form-group">
        <input
          v-model.trim="currentAuthor"
          v-focus
          class="form-control"
          :class="{ 'is-invalid': error }"
          placeholder="Имя и фамилия автора полностью"
        />

        <p v-if="error" class="invalid-feedback fsw-italic">
          {{ error }}
        </p>
      </div>

      <create-button-component
        @click.native="createNewAuthor"
        :processing="processing" />
    </form>
    <div class="container-xl">
      <ul class="list-group">
        <li
          v-for="author in authors"
          :key="author.id"
          class="row justify-content-between mb-2 p-2"
        >
          <div class="col-11 p-2 border-bottom">
            <a :href="`/authors/${author.id}`">{{ author.title }}</a>
          </div>
          <button
            @click="removeAuthor(author.id)"
            type="button"
            class="btn btn-outline-danger btn-sm col-1"
            aria-label="Close"
          >
            Удалить
          </button>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import { createAuthor } from '../../api/create';
import { deleteAuthor } from '../../api/delete';
import SvgLoadingComponent from '../SvgLoadingComponent.vue';
export default {
    props: {
        title: {
            type: String,
            required: true,
        },
        authors: {
            type: Array,
            required: true,
        },
    },
    components: {SvgLoadingComponent},

    data() {
        return {
            authorsList: this.authors,
            currentAuthor: "",
            error: "",
            processing: false,
        }
    },

    methods: {
        createNewAuthor() {
            if (this.currentAuthor.length === 0) {
                this.error = "Поле не должно быть пустым";
                return;
            }
            this.processing = true;
            createAuthor(this.currentAuthor)
              .then(() => window.location.reload())
              .finally(() => this.processing = false);
        },

        removeAuthor(authorId) {
            deleteAuthor(authorId).then(() => window.location.reload()).catch((error) => {
                if (error.response.data.message.startsWith('SQLSTATE[23000]')) {
                    Vue.swal.fire({
                        title: 'Ошибка',
                        text: 'Нельзя удалить автора, на которого записаны книги',
                        icon: 'error',
                        confirmButtonText: 'OK',
                    });
                }
            });
        }
    },

    watch: {
        currentAuthor() {
            this.error = '';
        }
    }
}
</script>