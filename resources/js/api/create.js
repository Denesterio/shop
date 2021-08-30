const createAuthor = params => {
  return axios.post('/api/admin/authors/create', params);
};

const confirmOrder = () => {
  return axios.get('/api/order/confirm');
};

const createTag = params => {
  return axios.post('/api/admin/tags/create', params);
};

const createSubcategory = params => {
  return axios.post('/api/admin/subcategories/create', params);
};

const createCategory = params => {
  return axios.post('/api/admin/categories/create', params);
};

const createProduct = params => {
  const config = { headers: { 'Content-Type': 'multipart/form-data' } };
  return axios.post('/api/admin/products/create', params, config);
};

const createCover = params => {
  return axios.post('/api/admin/covers/create', params);
};

const sendRating = params => {
  return axios.post('/api/ratings/create', params);
};

const createReview = params => {
  return axios.post('/api/reviews/create', params);
};

export {
  createAuthor,
  confirmOrder,
  createCategory,
  createTag,
  createSubcategory,
  createProduct,
  createCover,
  sendRating,
  createReview
};
