<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Shop') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        <navbar-component
            app-name="{{ config('app.name', 'Shop') }}"
            route-cart="{{ route('cart') }}"
            route-login="{{ route('login') }}"
            route-register="{{ route('register') }}"
            route-logout="{{ route('logout') }}"
            @auth
                route-profile="{{ route('profile') }}"
                :user={{Auth::user()}}
            @endauth
            @guest
                :user="{}"
            @endguest
        ></navbar-component>

        <div class="container-xl mt-4">
            @yield('content')
        </div>
    </div>
</body>
</html>