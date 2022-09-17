<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{csrf_token()}}">

        <title>Laravel</title>
        <link rel="stylesheet" href="{{asset("css/all.min.css")}}">
        <link rel="stylesheet" href="{{asset("css/fontawesome.min.css")}}">
        <script src="{{asset("js/fontawesome.min.js")}}"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
