import axios from 'axios';

const getCategories = () => {
  return axios.get('/api/categories/get').then(({ data }) => data);
};

const getSubcategories = () => {
  return axios.get('/api/subcategories/get').then(({ data }) => data);
};

const getMenu = () => {
  const menu = sessionStorage.getItem('menu');
  if (menu) {
    const parsed = JSON.parse(menu);
    return new Promise(resolve => resolve(parsed));
  }
  return axios.get('/api/categories/menu').then(({ data }) => {
    sessionStorage.setItem('menu', JSON.stringify(data));
    return data;
  });
};

const getAuthors = () => {
  return axios.get('/api/authors/get').then(({ data }) => data);
};

const getTags = () => {
  return axios.get('/api/tags/get').then(({ data }) => data);
};

const getProducts = () => {
  return axios.get('/api/products/get').then(({ data }) => data);
};

const getOrders = () => {
  return axios.get('/api/order/get').then(({ data }) => data);
};

const getProductsByType = (type, id) => {
  return axios.get(`/api/${type}/${id}/products`).then(({ data }) => data);
};

const getNewProducts = () => {
  const layoutCarousel = sessionStorage.getItem('layoutCarousel');
  if (layoutCarousel) {
    const parsed = JSON.parse(layoutCarousel);
    return new Promise(resolve => resolve(parsed));
  }
  return axios.get('/api/products/carousel').then(({ data }) => {
    sessionStorage.setItem('layoutCarousel', JSON.stringify(data));
    return data;
  });
};

const getOrderProducts = orderId => {
  return axios.get(`/api/order/${orderId}/products`).then(({ data }) => data);
};

const getCart = () => {
  return axios.get('/api/order/cart').then(({ data }) => {
    data.forEach(product => {
      product.quantity = product.pivot.quantity;
      product.order_id = product.pivot.order_id;
    });
    return data;
  });
};

const getUser = () => {
  return axios.get('/api/auth/getUser');
};

const getProduct = productId => {
  return axios.get(`/api/products/${productId}`).then(({ data }) => data);
};

export {
  getCategories,
  getTags,
  getSubcategories,
  getMenu,
  getAuthors,
  getProducts,
  getOrders,
  getProductsByType,
  getNewProducts,
  getOrderProducts,
  getCart,
  getUser,
  getProduct
};
