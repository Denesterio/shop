const addProductToOrder = (productId, orderId = null) => {
  return axios.post('/order/addProduct', {
    productId,
    orderId,
  });
};

const createAuthor = (name) => {
  return axios.post('/admin/authors/create', { name }).then((response) => response.data);
};

export { addProductToOrder, createAuthor };