import axios from 'axios';

const editOrdersProducts = params => {
  const method =
    params.quantityChange === 'increase' ? 'addProduct' : 'deleteProduct';
  return axios.post(`/api/order/${method}`, params).then(({ data }) => {
    data.forEach(product => {
      product.quantity = product.pivot.quantity;
      product.order_id = product.pivot.order_id;
    });
    return data;
  });
};

const editUser = params => {
  return axios.post('/api/user/edit', params);
};

export { editOrdersProducts, editUser };
