const changeOrderProductsQuantity = (params, method) => {
    return axios.post(`/api/order/${method}`, params);
};

const editUserField = (params) => {
    return axios.post("/api/user/edit", params);
}

export { changeOrderProductsQuantity, editUserField };