<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" dir="{{ $dir ?? 'bn' }}" class="filament-fabricator">

<head>
    {{ \Filament\Facades\Filament::renderHook('filament-fabricator.head.start') }}

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    @foreach (\Z3d0X\FilamentFabricator\Facades\FilamentFabricator::getMeta() as $tag)
        {{ $tag }}
    @endforeach

    @if ($favicon = \Z3d0X\FilamentFabricator\Facades\FilamentFabricator::getFavicon())
        <link rel="icon" href="{{ $favicon }}">
    @endif

    <title>{{ $title ?? null ? "{$title} - " : null }} {{ config('app.name') }}</title>


    <style>
        [x-cloak=""],
        [x-cloak="x-cloak"],
        [x-cloak="1"] {
            display: none !important;
        }
    </style>

    <!-- ======= All CSS Plugins here ======== -->
    <link rel="stylesheet" href="theme-assets/css/plugins/swiper-bundle.min.css">
    <link rel="stylesheet" href="theme-assets/css/plugins/glightbox.min.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <!-- Plugin css -->
    <link rel="stylesheet" href="theme-assets/css/vendor/bootstrap.min.css">

    <!-- Custom Style CSS -->
    <link rel="stylesheet" href="theme-assets/css/style.css">

    @foreach (\Z3d0X\FilamentFabricator\Facades\FilamentFabricator::getStyles() as $name => $path)
        @if (\Illuminate\Support\Str::of($path)->startsWith('<'))
            {!! $path !!}
        @else
            <link rel="stylesheet" href="{{ $path }}" />
        @endif
    @endforeach

    {{ \Filament\Facades\Filament::renderHook('filament-fabricator.head.end') }}
</head>

<body class="filament-fabricator-body">
    {{ \Filament\Facades\Filament::renderHook('filament-fabricator.body.start') }}

    {{-- header --}}
    @include('components.filament-fabricator.layouts.style1.header')

    <main class="main__content_wrapper">
        <x-filament-fabricator::page-blocks :blocks="$page->blocks" />
    </main>

    {{-- footer --}}
    @include('components.filament-fabricator.layouts.style1.footer')

    {{-- quick-view --}}
    @include('components.filament-fabricator.layouts.style1.quick-view')

    {{ \Filament\Facades\Filament::renderHook('filament-fabricator.scripts.start') }}

    <!-- All Script JS Plugins here  -->
    <script src="theme-assets/js/vendor/popper.js" defer="defer"></script>
    <script src="theme-assets/js/vendor/bootstrap.min.js" defer="defer"></script>
    <script src="theme-assets/js/plugins/swiper-bundle.min.js"></script>
    <script src="theme-assets/js/plugins/glightbox.min.js"></script>

    <!-- Customscript js -->
    <script src="theme-assets/js/script.js"></script>

    @foreach (\Z3d0X\FilamentFabricator\Facades\FilamentFabricator::getScripts() as $name => $path)
        @if (\Illuminate\Support\Str::of($path)->startsWith('<'))
            {!! $path !!}
        @else
            <script defer src="{{ $path }}"></script>
        @endif
    @endforeach

    @stack('scripts')

    {{ \Filament\Facades\Filament::renderHook('filament-fabricator.scripts.end') }}

    {{ \Filament\Facades\Filament::renderHook('filament-fabricator.body.end') }}
</body>

</html>
