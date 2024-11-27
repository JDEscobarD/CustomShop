<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="shortcut icon" href="{{ asset('favicon.ico') }}" type="image/x-icon">
    <link rel="stylesheet" href="{{ asset('css/custom.css') }}">
    <title>CustomShop - Dashboard</title>

    <!--script para el menú en móviles-->
    <script src="{{ asset('js/menuMobile.js') }}" defer></script>
    <!--script para limpiar los campos-->
    <script src="{{ asset('js/clear-fields.js') }}" defer></script>
    <!--script para los checkboxes de las tablas-->
    <script src="{{  asset('js/checkboxes.js') }}" defer></script>
    <!--script para la cookie del dashboard-->
    <script src="{{ asset('js/cookie.js') }}" defer></script>
    <!--script para ordenar las tablas por filtro-->
    <script src="{{  asset('js/order-table.js') }}" defer></script>
    <!--script para los medios de pago-->
    <script src="{{ asset('js/payment.js') }}" defer></script>

</head>

<body>
    <div id="app">
        <!-- Menú fijo -->
        @include('partials.menu')

        <!-- Contenido dinámico -->
        <main id="content" class="body-content">
            @yield('content')
        </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>