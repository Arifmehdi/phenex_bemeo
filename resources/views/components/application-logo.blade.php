@php
    $appSettings = app(App\Settings\AppSettings::class);
@endphp

<img src="/storage/{{ $appSettings->app_logo }}" alt="" srcset="" {{ $attributes }}>
