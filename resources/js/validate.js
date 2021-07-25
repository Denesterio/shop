import * as yup from 'yup';
import i18n from './lang';
import CreateError from './createError.js';

yup.setLocale({
  mixed: {
    required: i18n.t('error.required'),
  },
  string: {
    min: i18n.t('error.min') + ' ${min} ' + i18n.tc('error.symbol', '${min}'),
    email: i18n.t('error.email'),
  },
  number: {
    positive: i18n.t('error.positive'),
  },
  array: {
    min: i18n.t('error.minAuthor'),
  }
});

const registrationSchema = yup.object().shape({
  name: yup.string().required(),
  email: yup.string().required().email(),
  password: yup.string().required(),
});

const subcategorySchema = yup.object().shape({
  title: yup.string().required(),
  categoryId: yup.string().required(),
  slug: yup.string().required(),
});

const categorySchema = yup.object().shape({
  title: yup.string().required(),
  description: yup.string().required(),
});

const productSchema = yup.object().shape({
  title: yup.string().required(),
  description: yup.string().required(),
  price: yup.number().positive().required(),
  subcategorySlug: yup.string().required(),
  productAuthors: yup.array().required().min(1),
});

const onlyTitleSchema = yup.object().shape({
  title: yup.string().required(),
});

const handleServerErrors = (context, error, entity) => {
  const validationErrors = error.response.data?.errors;
  if (validationErrors) {
    Object.entries(validationErrors).forEach(([key, [value]]) => {
      context.validationErrors[key] = value;
    });
  } else {
    Vue.swal.fire({
      icon: "error",
      title: "Ошибка",
      text: context.$t('error.сreateError', { msg: entity }),
    });
  }
};

const fillErrorsObject = (obj, error) => {
  if (error.inner.length > 0) {
    error.inner.forEach((err) => {
      obj[err.path] = err.message;
    });
  } else {
    obj[error.path] = error.message
  }
};

// Альтернативная обработка ошибок
const getErrors = (error) => {
  const validationErrors = error.response?.data?.errors;
  if (validationErrors) {
    return Object.entries(validationErrors).map(([path, [message]]) => {
      const splittedPath = path.split('.')[0];
      return new CreateError(splittedPath, message);
    });
  }
  if (error?.inner.length > 0) {
    return error.inner.map((err) => {
      return new CreateError(err.path, err.message);
    });
  }
  if (error?.inner) {
    return [new CreateError(error.path, error.message)];
  }
  throw new Error(error.message);
}

export {
  subcategorySchema,
  categorySchema,
  productSchema,
  onlyTitleSchema,
  registrationSchema,
  handleServerErrors,
  fillErrorsObject,
  getErrors,
};