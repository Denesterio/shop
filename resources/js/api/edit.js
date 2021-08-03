import axios from 'axios';

const changeOrderProductsQuantity = (params, method) => {
  return axios.post(`/api/order/${method}`, params).then(({ data }) => {
    data.forEach(product => {
      product.quantity = product.pivot.quantity;
      product.order_id = product.pivot.order_id;
    });
    return data;
  });
};

const editUserField = params => {
  return axios.post('/api/user/edit', params);
};

export { changeOrderProductsQuantity, editUserField };
