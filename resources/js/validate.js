import * as yup from 'yup';
import i18n from './lang';

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
  name: yup.string().required(),
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

export {
  subcategorySchema,
  categorySchema,
  productSchema,
  onlyTitleSchema,
  registrationSchema,
  handleServerErrors,
  fillErrorsObject,
};