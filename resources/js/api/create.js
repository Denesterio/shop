const addProductToOrder = (productId, orderId = null) => {
  return axios.post('/order/addProduct', {
    productId,
    orderId,
  });
};

export { addProductToOrder };