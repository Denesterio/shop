<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>
        <link rel="stylesheet" href='/css/app.css'>

    </head>
    @include('layouts.header');
    <body class="antialiased">
        <div id="app">
            <div class="container-xl mt-3">
                <div class="row">
                    <b-col cols="3">
                        <left-menu-component
                            :categories='{{$categories}}'
                            :subcategories='{{$subcategories}}'
                        ></left-menu-component>
                        </b-col>
                    <b-col cols="9">
                        <product-list-component
                            :products='{{$products}}'
                            :order-products='{{$orderProducts}}'>
                        </product-list-component>
                    </b-col>
                </div>
            </div>
        </div>
    <script src='/js/app.js'></script>
    </body>
</html>
