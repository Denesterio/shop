export default {
  message: {
    inCart: 'Всего в корзине {quantity}',
    inOrder: 'Всего в заказе {quantity}',
    sumProducts: 'на сумму {sum} руб.',
    product: '{n} товаров | {n} товар | {n} товара | {n} товаров',
    profileLink: 'Личный кабинет',
    noComfirmOrders: 'у вас нет завершенных заказов',
    increase: 'добавлена в корзину',
    descrease: 'удалена из корзины',
    noProdCart: 'В корзине отсутствуют продукты',
    noProductsInCategory:
      'В данной категории товаров пока нет, но они обязательно появятся',
    reviewHelpBlock: 'Отзыв должен быть не менее 10 символов'
  },
  link: {
    profile: 'Личный кабинет',
    category: 'категории',
    subcategory: 'разделы',
    product: 'товары',
    tag: 'тэги',
    author: 'авторы',
    cover: 'типы обложки',
    clearForm: 'скрыть'
  },
  label: {
    create: 'Сохранить',
    delete: 'Удалить',
    change: 'Изменить',
    clear: 'Очистить',
    edit: 'Редактировать',
    details: 'Детали',

    all: 'все',
    category: 'категория',
    subcategory: 'раздел',
    tag: 'тэг',
    author: 'автор',
    add: 'добавить',
    categoryAdd: '@.capitalize:label.add категорию',
    productAdd: '@.capitalize:label.add товар',
    tagAdd: '@.capitalize:label.add тэг',
    coverAdd: '@.capitalize:label.add тип обложки',
    subacategoryAdd: '@.capitalize:label.add раздел',
    addToCart: 'купить',
    pictureUpload: 'Загрузить превью-изображение товара',
    imagesUpload: 'Загрузить изображения для галлереи',
    newSubcatName: 'Имя нового раздела',
    newCategoryName: 'Имя новой категории',
    newCategoryDesc: 'Описание новой категории',
    newCover: 'Новый тип обложки',
    newTag: 'Название тэга',
    newProduct: 'Название нового продукта',
    newProductDesc: 'Описание товара',
    slug: 'Заполнитель в строке адреса',
    clickEdit: 'кликните c зажатой ctrl для редактирования',

    login: 'Имя',
    email: 'Электронный адрес',
    password: 'Пароль',
    passwordConfirm: 'Подтвердите @.lower:label.password',
    registerDate: 'Дата регистрации',
    register: 'Регистрация',
    auth: 'Авторизация',

    orderConfirm: 'Оформить заказ',
    orderNum: 'Заказ №{num}',

    file: '{n} файлов | {n} файл | {n} файла | {n} файлов',
    filesToUpload: 'выбран(ы) {quantity}'
  },
  error: {
    symbol: '{n} символов | {n} символа | {n} символов | {n} символов',
    required: 'Поле не должно быть пустым',
    min: 'Значение должно быть не менее',
    positive: 'Значение должно быть положительным числом больше 0',
    minAuthor: 'Должен быть хотя бы один автор',
    email: 'Поле должно содержать правильный электронный адрес',
    сreateError: 'Не удалось {msg} из-за проблем с соединением или на сервере'
  },
  keys: {
    title: 'Наименование товара',
    quantity: 'Количество',
    sum: 'Сумма',
    price: 'Цена',
    year: 'Год издания',
    pages: 'Кол-во страниц',
    cover: 'Тип обложки'
  },
  plurals: {
    category: 'categories',
    subcategory: 'subcategories',
    product: 'products',
    tag: 'tags',
    author: 'authors',
    cover: 'covers'
  }
};
