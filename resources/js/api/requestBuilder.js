import * as getters from './get.js';
import * as creators from './create.js';
import * as editors from './edit.js';
import * as deleters from './delete.js';
import axios from 'axios';

export default class RequestBuilder {
  constructor(item) {
    // принимает аргументом объект(ы), с которыми предстоит работать
    // надеюсь, будет интуитивно понятно, где использовать единственное или множественное число
    // create, delete, edit в единственном (кроме edit.orderProducts)
    // get зависит от того, объект или массив объектов ожидается (в том числе Menus)
    this.item = item ? item[0].toUpperCase() + item.slice(1) : '';
    this.client = axios;
  }

  get(id) {
    const getter = `get${this.item}`;
    return getters[getter](id);
  }

  create(params) {
    const creator = `create${this.item}`;
    return creators[creator](params);
  }

  delete(id) {
    const deleter = `delete${this.item}`;
    return deleters[deleter](id);
  }

  edit(id) {
    const editor = `edit${this.item}`;
    return editors[editor](id);
  }

  makeRequest(url) {
    return this.client.get(url).then(res => res.data);
  }
}
