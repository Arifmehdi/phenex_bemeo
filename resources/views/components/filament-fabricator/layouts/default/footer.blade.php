@php
    $footerMenuOne = Datlechin\FilamentMenuBuilder\Models\Menu::location('footer_menu_one');
    $footerMenuTwo = Datlechin\FilamentMenuBuilder\Models\Menu::location('footer_menu_two');
@endphp

<footer class="site-footer" style="background-image: url(/theme-assets/images/backgrounds/footer-bg-1-1.jpg);">
    <div class="site-footer__top">
        <div class="container">
            <div class="row">

                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-duration="1500ms"
                    data-wow-delay="000ms">
                    <div class="site-footer__widget site-footer__widget__about">
                        <a href="index.html" class="site-footer__widget__logo">
                            <img src="/storage/{{ $appSettings->app_logo_dark }}" height="49" alt="">
                        </a>
                        <p class="site-footer__widget__text">
                            {!! $appSettings->about_paragraph !!}
                        </p><!-- /.site-footer__widget__text -->
                    </div><!-- /.site-footer__widget -->
                </div><!-- /.col-sm-12 col-md-6 col-lg-6 col-xl-3 wow fadeInUp -->

                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-duration="1500ms"
                    data-wow-delay="100ms">
                    <div class="site-footer__widget">
                        <h3 class="site-footer__widget__title">Links</h3><!-- /.site-footer__widget__title -->
                        <ul class="list-unstyled site-footer__widget__links">

                            @foreach ($footerMenuOne->menuItems ?? [] as $item)
                                <li>
                                    <a href="{{ $item->url }}">{{ $item->title }}</a>
                                </li>
                            @endforeach

                        </ul><!-- /.list-unstyled site-footer__widget__links -->
                    </div><!-- /.site-footer__widget -->
                </div><!-- /.col-sm-12 col-md-6 col-lg-6 col-xl-2 wow fadeInUp -->

                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-duration="1500ms"
                    data-wow-delay="200ms">
                    <div class="site-footer__widget">
                        <h3 class="site-footer__widget__title">Links</h3>
                        <!-- /.site-footer__widget__title -->
                        <ul class="list-unstyled site-footer__widget__links">
                            @foreach ($footerMenuTwo->menuItems ?? [] as $item)
                                <li>
                                    <a href="{{ $item->url }}">{{ $item->title }}</a>
                                </li>
                            @endforeach
                        </ul><!-- /.list-unstyled site-footer__widget__links -->
                    </div><!-- /.site-footer__widget -->
                </div><!-- /.col-sm-12 col-md-6 col-lg-6 col-xl-2 wow fadeInUp -->

                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3 wow fadeInUp" data-wow-duration="1500ms"
                    data-wow-delay="300ms">
                    <div class="site-footer__widget">
                        <h3 class="site-footer__widget__title">Contact</h3>
                        <!-- /.site-footer__widget__title -->
                        <ul class="list-unstyled site-footer__widget__contact">
                            <li>
                                <i class="fa fa-envelope-open"></i>
                                <a
                                    href="mailto:{{ $appSettings->default_layout_email }}">{{ $appSettings->default_layout_email }}</a>
                            </li>
                            <li>
                                <i class="fa fa-mobile"></i>
                                <a
                                    href="tel:{{ $appSettings->default_layout_phone }}">{{ $appSettings->default_layout_phone }}</a>
                            </li>
                        </ul><!-- /.list-unstyled site-footer__widget__contact -->
                    </div><!-- /.site-footer__widget -->
                </div><!-- /.col-sm-12 col-md-6 col-lg-6 col-xl-3 wow fadeInUp -->

            </div><!-- /.row -->
        </div><!-- /.container -->
    </div><!-- /.site-footer__top -->
    <div class="site-footer__bottom">
        <div class="container">
            <div class="site-footer__bottom__inner">
                <p class="site-footer__bottom__text">{!! $appSettings->copyright_text !!}</p><!-- /.site-footer__bottom__text -->
                <div class="site-footer__social">
                    @if ($appSettings->twitter_link)
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    @endif
                    @if ($appSettings->facebook_link)
                        <a href="#"><i class="fab fa-facebook"></i></a>
                    @endif
                    @if ($appSettings->youtube_link)
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    @endif
                    @if ($appSettings->instagram_link)
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    @endif
                    @if ($appSettings->pinterest_link)
                        <a href="#"><i class="fab fa-pinterest"></i></a>
                    @endif
                </div><!-- /.site-footer__social -->

            </div><!-- /.site-footer__bottom__inner -->
        </div><!-- /.container -->
    </div><!-- /.site-footer__bottom -->
</footer>
