@php
    $headerMenu = Datlechin\FilamentMenuBuilder\Models\Menu::location('header');
    $appSettings = app(App\Settings\AppSettings::class);
@endphp

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

    <link rel="apple-touch-icon" sizes="180x180" href="/theme-assets/images/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/theme-assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/theme-assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="/theme-assets/images/favicons/site.webmanifest">
    <!-- google font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@500;600;700;800&display=swap" rel="stylesheet">
    <!-- plugins css -->
    <link rel="stylesheet" href="/theme-assets/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/theme-assets/vendors/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/theme-assets/vendors/tiny-slider/dist/tiny-slider.css">
    <link rel="stylesheet" href="/theme-assets/vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="/theme-assets/vendors/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="/theme-assets/vendors/animate/animate.min.css">
    <link rel="stylesheet" href="/theme-assets/vendors/paroti-icons/style.css">
    <link rel="stylesheet" href="/theme-assets/vendors/jquery-magnific-popup/jquery.magnific-popup.css">
    <link rel="stylesheet" href="/theme-assets/vendors/youtube-popup/youtube-popup.css">
    <!-- template css -->
    <link rel="stylesheet" href="/theme-assets/css/paroti.css">

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

    {{-- @include('components.filament-fabricator.layouts.default.preloader') --}}

    <div class="page-wrapper">
        @include('components.filament-fabricator.layouts.default.header')

        {{-- page content --}}
        <section class="sec-pad-top sec-pad-bottom events-details">
            <div class="container">
                <div class="events-details__image">
                    <img src="/storage/{{$event->image}}" alt="">
                    <div class="events-card__date">{{ $event->created_at->format('d M Y') }}</div>
                    <!-- /.events-card__date -->

                </div><!-- /.events-details__image -->
                <div class="row gutter-y-60">
                    <div class="col-lg-8">
                        <div class="events-details__content">
                            <h3 class="events-card__title">{{ $event->title }}s</h3><!-- /.events-card__title -->

                            {!! $event->description !!}

                        </div><!-- /.events-details__content -->
                        <a href="{{ route('events.join', $event) }}" class="thm-btn events-details__btn"><span>Join
                                Now</span></a>
                    </div><!-- /.col-lg-8 -->
                    <div class="col-lg-4">
                        <div class="events-details__sidebar">
                            <div class="events-details__sidebar__single">
                                <div class="events-details__sidebar__info">
                                    <p>
                                        <span>Starting time:</span>
                                        {{ $event->created_at->format('d M Y') }}
                                    </p>
                                    <p>
                                        <span>Join Deadline:</span>
                                        {{ $event->join_deadline->format('d M Y') }}
                                    </p>
                                </div><!-- /.events-details__sidebar__info -->
                            </div><!-- /.events-details__sidebar__single -->
                            <!-- /.events-details__sidebar__single -->


                        </div><!-- /.events-details__sidebar -->
                    </div><!-- /.col-lg-4 -->
                </div><!-- /.row -->
            </div><!-- /.container -->
        </section>

        @include('components.filament-fabricator.layouts.default.footer')
    </div>

    @include('components.filament-fabricator.layouts.default.mobile-nav')
    @include('components.filament-fabricator.layouts.default.search-popup')

    <a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>

    {{ \Filament\Facades\Filament::renderHook('filament-fabricator.scripts.start') }}

    <!-- plugins js -->
    <script src="/theme-assets/vendors/jquery/jquery-3.6.1.min.js"></script>
    <script src="/theme-assets/vendors/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/theme-assets/vendors/tiny-slider/dist/min/tiny-slider.js"></script>
    <script src="/theme-assets/vendors/jquery-validation/jquery.validate.min.js"></script>
    <script src="/theme-assets/vendors/wow/wow.js"></script>
    <script src="/theme-assets/vendors/jquery-ajaxchimp/jquery.ajaxchimp.min.js"></script>
    <script src="/theme-assets/vendors/jquery-appear/jquery.appear.min.js"></script>
    <script src="/theme-assets/vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="/theme-assets/vendors/jquery-magnific-popup/jquery.magnific-popup.min.js"></script>
    <script src="/theme-assets/vendors/youtube-popup/youtube-popup.jquery.js"></script>
    <!-- template js -->
    <script src="/theme-assets/js/paroti.js"></script>



    @stack('scripts')

    {{ \Filament\Facades\Filament::renderHook('filament-fabricator.scripts.end') }}

    {{ \Filament\Facades\Filament::renderHook('filament-fabricator.body.end') }}
</body>

</html>
