<template>
    <div>
        <input
          list="authorDatalist"
          v-model="currentAuthor"
          @keyup.enter="addAuthorToAuthors"
          class="form-control"
          :class="{ 'is-invalid': validationError }"
          placeholder="Автор"
          :disabled="processing"
        />
        <datalist v-if="filteredAuthors.length" id="authorDatalist">
          <option
            v-for="author in filteredAuthors"
            :key="author.id"
            :value="author.title"
          ></option>
        </datalist>
        <p
          class="font-weight-bolder m-1 p-1 font-italic"
        > {{ formattedAuthors }} <a @click.prevent="clearAuthors" v-if="productAuthors.length" href="" noreferrer nofollow class="font-weight-normal">очистить</a>
        </p>
        <p v-if="validationError.startsWith('Поле ')" class="text-danger">
          {{ validationError }}
        </p>
        <p v-else-if="validationError === 'нет в базе'" class="text-danger">
          Такого автора нет в базе <a @click.prevent="createAuthor" href="" noreferrer nofollow :disabled="processing">добавить</a>
        </p>
     </div>
</template>

<script>
import { getAuthors } from '../../api/get.js';

export default {
    data() {
        return {
            currentAuthor: '',
            productAuthors: [],
            validationError: '',
            authors: [],
            processing: false,
        }
    },

    computed: {
      filteredAuthors() {
        if (this.currentAuthor.length > 1) {
          const regular = '(^|\\s)' + this.currentAuthor.toLowerCase();
          const regExp = new RegExp(regular);
          return this.authors
            .filter((a) => {
              return regExp.test(a.title.toLowerCase());
            })
            .slice(0, 10);
        }
        return [];
      },

      formattedAuthors() {
        return this.productAuthors.map((a) => a.title).join(', ');
      }
    },

    mounted() {
        getAuthors().then((data) => this.authors = data);
    },

    methods: {
      createAuthor() {
        if (this.currentAuthor.length === 0) {
          this.validationError = 'Поле не должно быть пустым';
          return;
        }

        this.processing = true;
        axios
          .post('/admin/authors/create', { name: this.currentAuthor })
          .then(({ data }) => {
            this.authors = [({ title: this.currentAuthor, id: data.id }), ...this.authors];
            this.validationError = '';
            this.addAuthorToAuthors();
          })
          .finally(() => (this.processing = false));
      },

      addAuthorToAuthors() {
        if (this.currentAuthor === this.filteredAuthors[0]?.title) {
          this.$emit('add-author', this.filteredAuthors[0]);
          this.productAuthors.push(this.filteredAuthors[0]);
          this.currentAuthor = '';
        } else {
          this.validationError = 'нет в базе';
        }
      },

      clearAuthors() {
          this.productAuthors = [];
          this.$emit('clear-authors');
      }
    },

    watch: {
        currentAuthor() {
            this.validationError = '';
        }
    }
}
</script>