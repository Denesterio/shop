const changeOrderProductsQuantity = (params) => {
    return axios.post('/api/order/addProduct', params);
};

export { changeOrderProductsQuantity };