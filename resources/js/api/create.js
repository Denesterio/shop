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

export { addProductToOrder, createAuthor, confirmOrder };