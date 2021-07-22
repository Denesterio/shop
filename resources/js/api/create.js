const createAuthor = (params) => {
  return axios.post('/api/admin/authors/create', params);
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
};

const createProduct = (params) => {
  return axios.post("/api/admin/products/create", params);
};

export {
  createAuthor,
  confirmOrder,
  createCategory,
  createTag,
  createSubcategory,
  createProduct,
};