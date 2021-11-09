import axios from 'axios';
import routes from './routes.js';

export default class RequestBuilder {
  constructor(item, params = {}) {
    // принимает аргументом item объект(ы)-сущности, с которыми предстоит работать
    // при передаче id в единственном числе, без id - во множественном
    // по логике laravel apiResource
    this.item = item;
    this.client = axios;
    this.method = 'GET';
    this.queryParams = params;
  }

  #needAdminPrefix(item) {
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
    ].includes(item);
  }

  #needAuthPrefix(item) {
    return ['register', 'logout', 'login'].includes(item);
  }

  #getPrefix(item) {
    if (this.method !== 'GET' && this.#needAdminPrefix(item)) {
      return 'admin';
    }

    if (this.#needAuthPrefix(item)) {
      return 'auth';
    }

    return '';
  }

  #addQueryParams(url) {
    for (const param in this.queryParams) {
      url.searchParams.append(param, this.queryParams[param]);
    }
  }

  #getUrl(id) {
    const prefix = this.#getPrefix(this.item);
    const url = new URL(routes[this.item](prefix, id));
    this.#addQueryParams(url);
    return url;
  }

  #getUrls() {
    return this.item.map(i => {
      const prefix = this.#getPrefix(i);
      return new URL(routes[i](prefix));
    });
  }

  get(id) {
    const url = this.#getUrl(id);
    return this.client.get(url).then(response => response.data);
  }

  getAll() {
    const urls = this.#getUrls();
    const promises = urls.map(url =>
      this.client.get(url).then(response => response.data)
    );
    return Promise.all(promises);
  }

  create(data, parentId = null) {
    this.method = 'POST';
    const url = this.#getUrl(parentId);
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

  makeRequest(link, method = 'get') {
    const url = new URL(link);
    this.#addQueryParams(url);
    return this.client[method](url);
  }

  perPage(count) {
    return new RequestBuilder(this.item, { limit: count });
  }

  withQueryParams(params) {
    return new RequestBuilder(this.item, { ...params });
  }
}
