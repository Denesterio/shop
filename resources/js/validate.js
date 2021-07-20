import * as yup from 'yup';
import i18n from './lang';

yup.setLocale({
  mixed: {
    required: i18n.t('error.required'),
  },
  string: {
    min: i18n.t('error.min') + ' ${min} ' + i18n.tc('error.symbol', '${min}'),
  },
  number: {
    positive: i18n.t('error.positive'),
  },
  array: {
    min: i18n.t('error.minAuthor'),
  }
})

const subcategorySchema = yup.object().shape({
  name: yup.string().required().min(3),
  categoryId: yup.string().required(),
  slug: yup.string().required(),
});

const categorySchema = yup.object().shape({
  name: yup.string().required(),
  desc: yup.string().required(),
});

const productSchema = yup.object().shape({
  name: yup.string().required(),
  description: yup.string().required(),
  price: yup.number().positive().required(),
  subcategorySlug: yup.string().required(),
  productAuthors: yup.array().required().min(1),
});

const onlyNameSchema = yup.string().required();

export { subcategorySchema, categorySchema, productSchema, onlyNameSchema };