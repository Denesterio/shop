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
  // categoryProducts: id =>
  //   [BASE_URL, API_PREFIX, 'categories', id, 'products'].join('/'),
  // subcategoryProducts: id =>
  //   [BASE_URL, API_PREFIX, 'subcategories', id, 'products'].join('/'),
  // tagsProduct: id => [BASE_URL, API_PREFIX, 'tags', id, 'products'].join('/'),
  // authorProducts: id =>
  //   [BASE_URL, API_PREFIX, 'authors', id, 'products'].join('/'),

  orders: () => [BASE_URL, API_PREFIX, 'order', 'get'].join('/'),
  orderProducts: id =>
    [BASE_URL, API_PREFIX, 'order', id, 'products'].join('/'),
  cartProducts: () => [BASE_URL, API_PREFIX, 'order', 'cart'].join('/'),

  user: () => [BASE_URL, API_PREFIX, 'auth', 'getUser'].join('/'),
  rating: productId => [BASE_URL, API_PREFIX, 'ratings', productId].join('/'),
  productReviews: productId =>
    [BASE_URL, API_PREFIX, 'products', productId, 'reviews'].join('/'),

  orderConfirmation: () => [BASE_URL, API_PREFIX, 'order', 'confirm'].join('/')
};
