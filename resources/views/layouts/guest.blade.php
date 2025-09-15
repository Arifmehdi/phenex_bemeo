{{-- <!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body class="font-sans text-gray-900 antialiased bg-gray-100">
    @php
        $routeName = Route::currentRouteName();

        if ($routeName === 'login') {
            $ads = \App\Models\LoginAds::where('is_active', true)->get();
        } elseif ($routeName === 'register') {
            $ads = \App\Models\RegisterAds::where('is_active', true)->get();
        } else {
            $ads = collect(); // Empty for other pages
        }

        $leftAd = $ads->where('type', 1)->first();
        $rightAd = $ads->where('type', 2)->first();
    @endphp


    <div class="min-h-screen flex">
        <!-- LEFT AD (Full height) -->
        <div class="hidden lg:flex w-1/3 bg-gray-50 items-center justify-center p-4">
            @if ($leftAd)
                <div class="text-center w-full">
                    @if ($leftAd->image)
                        <a href="{{ $leftAd->link ?? '#' }}">
                            <img src="{{ asset('storage/' . $leftAd->image) }}" style="object-fit: contain;"
                                class="rounded-lg w-full " alt="{{ $leftAd->title }}">
                        </a>
                    @endif
                    @if ($leftAd->title)
                        <h4 class=" bottom-6 left-6 text-white text-2xl font-bold bg-black/50 px-4 py-2 rounded">
                            {{ $leftAd->title }}
                        </h4>

                        <p>{!! $leftAd->content !!}</p>
                    @endif
                </div>
            @endif
        </div>

        <!-- MAIN CONTENT (Login/Register Form) -->
        <div class="flex flex-col justify-center w-full lg:w-1/3 px-6 py-8 bg-white shadow-md">
            <div class="flex justify-center mb-6">
                <a href="/">
                    <x-application-logo class="w-16 h-16 text-gray-500" />
                </a>
            </div>
            {{ $slot }}
        </div>

        <!-- RIGHT AD (Full height) -->
        <div class="hidden lg:flex w-1/3 bg-gray-50 items-center justify-center p-4">
            @if ($rightAd)
                <div class="text-center w-full">
                    @if ($rightAd->image)
                        <a href="{{ $rightAd->link ?? '#' }}">
                            <img src="{{ asset('storage/' . $rightAd->image) }}" style="object-fit: contain;"
                                class="rounded-lg w-full" alt="{{ $rightAd->title }}">
                        </a>
                    @endif
                    @if ($rightAd->title)
                        <h4 class=" bottom-6 right-6 mt-2 text-white text-2xl font-bold bg-black/50 px-4 py-2 rounded">
                            {{ $rightAd->title }}
                        </h4>
                        <p>{!! $rightAd->content !!}</p>
                    @endif
                </div>
            @endif
        </div>
    </div>
</body>

</html> --}}
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body class="font-sans text-gray-900 antialiased bg-gray-100">
    @php
        $routeName = Route::currentRouteName();

        if ($routeName === 'login') {
            $ads = \App\Models\LoginAds::where('is_active', true)->get();
        } elseif ($routeName === 'register') {
            $ads = \App\Models\RegisterAds::where('is_active', true)->get();
        } else {
            $ads = collect();
        }

        $leftAd = $ads->where('type', 1)->first();
        $rightAd = $ads->where('type', 2)->first();
    @endphp

    <div class="min-h-screen flex bg-gray-100">
        <!-- LEFT AD (Fixed width and height) -->
        <div class="hidden lg:flex w-1/3 bg-gray-50 items-center justify-center relative">
            @if ($leftAd)
                <div class="w-full h-screen overflow-hidden relative">
                    <img src="{{ asset('storage/' . $leftAd->image) }}" class="w-full h-full object-cover"
                        style="object-fit: contain;" alt="{{ $leftAd->title }}">
                    @if ($leftAd->title)
                        <div style="color: black"
                            class="absolute bottom-0 left-0 w-full bg-black bg-opacity-50 text-white p-4 text-center text-lg font-bold">
                            {{ $leftAd->title }}
                        </div>
                    @endif
                </div>
            @else
                <div class="w-full h-screen bg-gray-200 flex items-center justify-center text-gray-400 text-xl">
                    No Ad
                </div>
            @endif
        </div>

        <!-- MAIN CONTENT (Fixed width, centered) -->
        <div class="flex flex-col justify-center w-full lg:w-1/3 px-6 py-8 bg-white shadow-md">
            <div class="flex justify-center mb-6">
                <a href="/">
                    <x-application-logo class="w-16 h-16 text-gray-500" />
                </a>
            </div>
            <div>
                {{ $slot }}
            </div>
        </div>

        <!-- RIGHT AD (Fixed width and height) -->
        <div class="hidden lg:flex w-1/3 bg-gray-50 items-center justify-center relative">
            @if ($rightAd)
                <div class="w-full h-screen overflow-hidden relative">
                    <img src="{{ asset('storage/' . $rightAd->image) }}" class="w-full h-full object-cover"
                        style="object-fit: contain;" alt="{{ $rightAd->title }}">
                    @if ($rightAd->title)
                        <div style="color: black"
                            class="absolute bottom-0 text-black right-0 w-full bg-black bg-opacity-50 text-white p-4 text-center text-lg font-bold">
                            {{ $rightAd->title }}
                        </div>
                    @endif
                </div>
            @else
                <div class="w-full h-screen bg-gray-200 flex items-center justify-center text-gray-400 text-xl">
                    No Ad
                </div>
            @endif
        </div>
    </div>
</body>

</html>
