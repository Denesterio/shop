import axios from 'axios';

const getCategories = () => {
  return axios.get('/api/categories/get').then(({ data }) => data);
};

const getSubcategories = () => {
  return axios.get('/api/subcategories/get').then(({ data }) => data);
};

const getMenus = () => {
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

const getCategoryProducts = id => {
  return axios.get(`/api/categories/${id}/products`).then(({ data }) => data);
};

const getSubcategoryProducts = id => {
  return axios
    .get(`/api/subcategories/${id}/products`)
    .then(({ data }) => data);
};

const getAuthorProducts = id => {
  return axios.get(`/api/authors/${id}/products`).then(({ data }) => data);
};

const getTagProducts = id => {
  return axios.get(`/api/tags/${id}/products`).then(({ data }) => data);
};

const getCarouselProducts = () => {
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

const getOrdersProducts = orderId => {
  return axios.get(`/api/order/${orderId}/products`).then(({ data }) => data);
};

const getCartProducts = () => {
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
  return axios.get(`/api/products/${productId}`).then(({ data }) => {
    data.cover = data.cover.title;
    return data;
  });
};

const getRating = productId => {
  return axios.get(`/api/ratings/${productId}`).then(({ data }) => data);
};

const getCovers = () => {
  return axios.get(`/api/covers/get`).then(({ data }) => data);
};

const getProductReviews = productId => {
  return axios
    .get(`/api/products/${productId}/reviews`)
    .then(({ data }) => data);
};

export {
  getCategories,
  getTags,
  getSubcategories,
  getMenus,
  getAuthors,
  getProducts,
  getOrders,
  getCategoryProducts,
  getSubcategoryProducts,
  getAuthorProducts,
  getTagProducts,
  getCarouselProducts,
  getOrdersProducts,
  getCartProducts,
  getUser,
  getProduct,
  getRating,
  getCovers,
  getProductReviews
};
