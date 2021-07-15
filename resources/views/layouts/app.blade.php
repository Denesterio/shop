<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>
    <script src="https://unpkg.com/vue-i18n@8"></script>

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">

    <style>
        .router-link-active:hover {
            text-decoration: none;
            color: rgba(0, 0, 0, 0.75)
        }
    </style>
</head>

<body>
    <div id="app">
        <navbar-component app-name="{{ config('app.name', 'Laravel') }}"></navbar-component>

        <div class="container-xl">
            <router-view></router-view>
        </div>

    </div>
</body>

</html>