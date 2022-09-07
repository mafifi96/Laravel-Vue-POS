<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{csrf_token()}}">

        <title>Laravel</title>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <!-- Fonts -->
        {{-- <link href="https://fonts.bunny.net/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Nunito', sans-serif;
            </style>
            } --}}

    </head>
    <body class="antialiased">
        <div id="app">
            <App></App>
        </div>
        @vite("resources/js/app.js")
<noscript>
    please enable js to continue
</noscript>
    </body>
</html>
