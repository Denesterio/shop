const getCategories = () => {
    return axios.get("/api/categories/get");
};

const getSubcategories = () => {
    return axios.get("/api/subcategories/get");
};

const getAuthors = () => {
    return axios.get("/api/authors/get");
};

const getTags = () => {
    return axios.get("/api/tags/get");
};

const getProducts = () => {
    return axios.get("/api/products/get");
};

const getOrders = () => {
    return axios.get("/api/order/get");
};

const getProductsByType = (type, id) => {
    return axios.get(`/api/${type}/${id}/products`);
};

const getNewProducts = () => {
    return axios.get("/api/products/carousel");
};

const getProfile = () => {
    return axios.get("/api/profile");
};

const getOrderProducts = (orderId) => {
    return axios.get(`/api/order/${orderId}/products`);
};

const getCart = () => {
    return axios.get("/api/order/cart");
}

export {
    getCategories,
    getTags,
    getSubcategories,
    getAuthors,
    getProducts,
    getOrders,
    getProductsByType,
    getNewProducts,
    getProfile,
    getOrderProducts,
    getCart,
};