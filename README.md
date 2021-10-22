Учебный проект книжного магазина на Laravel, Vue, Bootstrap (bootstrap-vue), Vue Router, Vuex, i18next. Построено приложение по принципу api и SPA, есть несколько тестов фронтенда с Jest.

Реализованы регистрация, авторизация, добавление категорий, товаров, оформление заказов с отправкой писем, валидация форм, карусель товаров, страница товара, отзывы, оценки, галерея изображений.

Небольшое видео на https://drive.google.com/file/d/1emFUIHuimN5ZWZZv3LdGXj5G81B634qx/view?usp=sharing (простите за неудобства, что в облаке, а не хостинге).

### Запустить локальный сервер

```
php artisan serve
npm run watch
```

Для заполнения базы данных есть seed:

```
php artisan migrate --seed

// или отдельно миграции и заполнение
php artisan migrate
php artisan db:seed

// или через обновление таблиц
php artisan migrate:fresh --seed
```

Создающийся пользователь: 'admin', почта: 'mail@mail.ru', пароль: 'adminadmin'.

### Запустить тесты фронтенда

```
npm run test
```
