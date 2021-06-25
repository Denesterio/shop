<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Главная</title>
        <link rel="stylesheet" href='/css/app.css'>
    </head>
    <body>
    @include('layouts.header');
        <div id="app">
            <div class="container-xl mt-3">
                <div class="row">
                        <b-col cols="4">
                            <left-menu-component
                                :categories='{{$categories}}'
                                :subcategories='{{$subcategories}}'
                            ></left-menu-component>
                            </b-col>
                        <b-col cols="8">
                            <category-list-component
                                :categories='{{$categories}}'
                            ></category-list-component>
                        </b-col>
                </div>
            </div>
        </div>
        <script src='/js/app.js'></script>
    </body>
</html>
