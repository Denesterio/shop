const getCategories = () => {
    return axios.get("/categories/get").then(({ data }) => data);
};

const getSubcategories = () => {
    return axios.get("/subcategories/get").then(({ data }) => data);
};

const getAuthors = () => {
    return axios.get("/authors/get").then(({ data }) => data);
};

const getProducts = () => {
    return axios.get("/products/get").then(({ data }) => data)
};

export { getCategories, getSubcategories, getAuthors, getProducts };