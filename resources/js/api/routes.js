const BASE_URL = 'http://localhost:8000';
const API_PREFIX = 'api';

const buildBase = prefix => {
  if (prefix.length > 0) {
    return [BASE_URL, API_PREFIX, prefix];
  }
  return [BASE_URL, API_PREFIX];
};

export default {
  categories: prefix => [...buildBase(prefix), 'categories'].join('/'),
  category: (prefix, id) => [...buildBase(prefix), 'categories', id].join('/'),
  menu: prefix => [...buildBase(prefix), 'categories', 'menu'].join('/'),

  subcategories: prefix => [...buildBase(prefix), 'subcategories'].join('/'),
  subcategory: (prefix, id) =>
    [...buildBase(prefix), 'subcategories', id].join('/'),

  authors: prefix => [...buildBase(prefix), 'authors'].join('/'),
  author: (prefix, id) => [...buildBase(prefix), 'authors', id].join('/'),

  tags: prefix => [...buildBase(prefix), 'tags'].join('/'),
  tag: (prefix, id) => [...buildBase(prefix), 'tags', id].join('/'),

  covers: prefix => [...buildBase(prefix), 'covers'].join('/'),
  cover: (prefix, id) => [...buildBase(prefix), 'covers', id].join('/'),

  products: prefix => [...buildBase(prefix), 'products'].join('/'),
  product: (prefix, id) => [...buildBase(prefix), 'products', id].join('/'),

  reviews: (prefix, productId) =>
    [...buildBase(prefix), 'products', productId, 'reviews'].join('/'),

  ratings: (prefix, productId) =>
    [...buildBase(prefix), 'products', productId, 'ratings'].join('/'),

  orders: prefix => [...buildBase(prefix), 'orders'].join('/'),
  addProduct: prefix =>
    [...buildBase(prefix), 'orders', 'addProduct'].join('/'),
  deleteProduct: prefix =>
    [...buildBase(prefix), 'orders', 'deleteProduct'].join('/'),
  orderProducts: (prefix, id) =>
    [...buildBase(prefix), 'orders', id, 'products'].join('/'),
  cartProducts: prefix => [...buildBase(prefix), 'orders', 'cart'].join('/'),
  orderConfirmation: prefix =>
    [...buildBase(prefix), 'orders', 'confirm'].join('/'),

  user: () => [BASE_URL, API_PREFIX, 'auth', 'getUser'].join('/'),
  login: prefix => [...buildBase(prefix), 'login'].join('/'),
  logout: prefix => [...buildBase(prefix), 'logout'].join('/'),
  register: prefix => [...buildBase(prefix), 'register'].join('/'),

  search: prefix => [...buildBase(prefix), 'search'].join('/')
};
