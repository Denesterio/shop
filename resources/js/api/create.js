const addProductToOrder = (productId, orderId = null) => {
  return axios.post('/api/order/addProduct', {
    productId,
    orderId,
  });
};

const createAuthor = (name) => {
  return axios.post('/api/admin/authors/create', { name });
};

const confirmOrder = () => {
  return axios.get("/api/order/confirm");
};

const createTag = (params) => {
  return axios.post("/api/admin/tags/create", params);
};

const createSubcategory = (params) => {
  return axios.post("/api/admin/subcategories/create", params);
}

const createCategory = (params) => {
  return axios.post("/api/admin/categories/create", params);
}
export {
  addProductToOrder,
  createAuthor,
  confirmOrder,
  createCategory,
  createTag,
  createSubcategory,
};