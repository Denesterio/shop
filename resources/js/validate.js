import * as yup from 'yup';
import i18n from './lang';
import CreateError from './services/createError.js';

yup.setLocale({
  mixed: {
    required: i18n.t('error.required')
  },
  string: {
    min: i18n.t('error.min') + ' ${min} ' + i18n.tc('error.symbol', '${min}'),
    email: i18n.t('error.email')
  },
  number: {
    typeError: i18n.t('error.positive'),
    positive: i18n.t('error.positive')
  },
  array: {
    min: i18n.t('error.minElem')
  }
});

const registrationSchema = yup.object().shape({
  email: yup
    .string()
    .required()
    .email()
});

const subcategorySchema = yup.object().shape({
  title: yup.string().required(),
  categoryId: yup.string().required(),
  slug: yup.string().required()
});

const categorySchema = yup.object().shape({
  title: yup.string().required(),
  description: yup.string().required()
});

const productSchema = yup.object().shape({
  title: yup.string().required(),
  description: yup.string().required(),
  price: yup
    .number()
    .typeError(i18n.t('error.positive'))
    .positive()
    .required(),
  year: yup
    .number()
    .typeError(i18n.t('error.positive'))
    .positive()
    .required(),
  pages: yup
    .number()
    .typeError(i18n.t('error.positive'))
    .positive()
    .required(),
  subcategorySlug: yup.string().required(),
  cover: yup.string().required(),
  authors: yup
    .array()
    .required()
    .min(1),
  tags: yup
    .array()
    .required()
    .min(1)
});

const onlyTitleSchema = yup.object().shape({
  title: yup.string().required()
});

// обработка ошибок
const getErrors = error => {
  if (error?.response?.status === 422) {
    return Object.entries(error.response.data.errors).map(
      ([path, [message]]) => {
        const splittedPath = path.split('.')[0];
        return new CreateError(splittedPath, message);
      }
    );
  }
  if (error?.inner.length > 0) {
    return error.inner.map(err => {
      return new CreateError(err.path, err.message);
    });
  }
  if (error?.inner) {
    return [new CreateError(error.path, error.message)];
  }
  throw new Error(error.message);
};

export {
  subcategorySchema,
  categorySchema,
  productSchema,
  onlyTitleSchema,
  registrationSchema,
  getErrors
};
