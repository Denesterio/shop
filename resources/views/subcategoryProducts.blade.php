<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title></title>
        <link rel="stylesheet" href='/css/app.css'>

    </head>
    <body class="antialiased">
        <div id="app" class="container mt-5">
            <product-list-component
                :products='{{$products}}'>
            </product-list-component>
        </div>
        <script src='/js/app.js'></script>
    </body>
</html>