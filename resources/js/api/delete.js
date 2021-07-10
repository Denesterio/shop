const deleteSubcategory = (subcategoryId) => {
  return axios.post('/admin/subcategories/delete', {
    id: subcategoryId,
    _method: 'DELETE',
  });
};

const deleteCategory = (categoryId) => {
  return axios.post('/admin/categories/delete', {
    id: categoryId,
    _method: 'DELETE',
  });
};

const deleteProduct = (productId) => {
  return axios.post('/api/admin/products/delete', {
    id: productId,
    _method: 'DELETE',
  });
};

const deleteTag = (tagId) => {
  return axios.post('/api/admin/tags/delete', {
    id: tagId,
    _method: 'DELETE',
  });
};

const deleteProductFromOrder = (productId, orderId = null) => {
  return axios.post('/api/order/deleteProduct', {
    productId,
    orderId,
  });
};

const deleteAuthor = (authorId) => {
  return axios.post('/api/admin/authors/delete', {
    id: authorId,
    _method: 'DELETE',
  });
};

export { deleteSubcategory, deleteCategory, deleteProduct, deleteProductFromOrder, deleteTag, deleteAuthor };
