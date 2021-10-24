import * as editors from './edit.js';
import axios from 'axios';
import routes from './routes.js';

export default class RequestBuilder {
  constructor(item, countPerPage = null) {
    // принимает аргументом item объект(ы)-сущности, с которыми предстоит работать
    // при передаче id в единственном числе, без id - во множественном
    // по логике laravel apiResource
    this.item = item;
    this.client = axios;
    this.method = 'GET';
    this.countPerPage = countPerPage;
  }

  #needAdminPrefix() {
    return [
      'categories',
      'subcategories',
      'tags',
      'authors',
      'covers',
      'products',
      'category',
      'subcategory',
      'tag',
      'author',
      'cover',
      'product'
    ].includes(this.item);
  }

  #getPrefix() {
    if (this.method !== 'GET' && this.#needAdminPrefix) {
      return 'admin';
    }

    return '';
  }

  #getUrl(id) {
    const prefix = this.#getPrefix();
    const url = new URL(routes[this.item](prefix, id));
    if (this.countPerPage) {
      url.searchParams.append('_limit', this.countPerPage);
    }
    return url;
  }

  get(id) {
    const url = this.#getUrl(id);
    return this.client.get(url).then(response => response.data);
  }

  create(data) {
    this.method = 'POST';
    const url = this.#getUrl();
    const config = {
      headers: { 'Content-Type': 'multipart/form-data' },
      withCredentials: true
    };
    return this.client.post(url, data, config);
  }

  delete(id) {
    this.method = 'DELETE';
    const url = this.#getUrl(id);
    return this.client.post(
      url,
      {
        id,
        _method: 'DELETE'
      },
      { withCredentials: true }
    );
  }

  edit(id, data) {
    this.method = 'PUT';
    const url = this.#getUrl(id);
    const config = {
      headers: { 'Content-Type': 'multipart/form-data' },
      withCredentials: true
    };
    data.append('_method', 'PUT');
    data.append('id', id);
    return this.client.post(url, data, config);
  }

  makeRequest(url, method = 'get') {
    return this.client[method](url);
  }

  perPage(count) {
    return new RequestBuilder(this.item, count);
  }
}
