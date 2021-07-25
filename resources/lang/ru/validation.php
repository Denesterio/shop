<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines contain the default error messages used by
    | the validator class. Some of these rules have multiple versions such
    | as the size rules. Feel free to tweak each of these messages here.
    |
    */

    'active_url' => ':attribute должен быть валидным URL',
    'alpha' => ':attribute должен содержать только буквы',
    'alpha_num' => ':attribute должен содержать только символы букв и цифр',
    'distinct' => ':attribute содержит дубликаты',
    'email' => ':attribute должен быть правильным e-mail адресом',
    'integer' => ':attribute должен быть числом',
    'max' => [
        'numeric' => ':attribute не должен быть большеБ чем :max',
        'file' => 'The :attribute must not be greater than :max kilobytes',
        'string' => ':attribute не должен быть более :max символов',
        'array' => 'The :attribute must not have more than :max items',
    ],
    'min' => [
        'numeric' => 'The :attribute must be at least :min',
        'file' => 'The :attribute must be at least :min kilobytes',
        'string' => ':attribute должен быть не менее :min символов',
        'array' => 'The :attribute must have at least :min items',
    ],
    'password' => 'Некорректный пароль',
    'required' => 'Поле не должно быть пустым',

    'string' => ':attribute должен быть строкой',
    'unique' => ':attribute уже используется',
    'url' => ':attribute содержит неправильный URL',

    'attributes' => [
        'email' => 'Электронный адрес',
        'title' => 'Название',
        'name' => 'Имя',
        'slug' => 'Заполнитель',
        'price' => 'Цена',
        'password' => 'Пароль',
        'authors.*' => 'Поле авторов',
    ],
];
