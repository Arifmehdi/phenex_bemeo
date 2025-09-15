<div class="mobile-nav__wrapper">
    <div class="mobile-nav__overlay mobile-nav__toggler"></div><!-- /.mobile-nav__overlay -->
    <div class="mobile-nav__content">
        <a href="#" class="mobile-nav__close mobile-nav__toggler">
            <span></span>
            <span></span>
        </a>

        <div class="logo-box">
            <a href="/" aria-label="logo image"><img src="/storage/{{ $appSettings->app_logo }}" height="49"
                    alt="Logo"></a>
        </div>
        <!-- /.logo-box -->
        <div class="mobile-nav__container"></div>
        <!-- /.mobile-nav__container -->

        <ul class="mobile-nav__contact list-unstyled">
            <li>
                <i class="fa fa-phone"></i>
                <a href="tel:{{ $appSettings->default_layout_phone }}">{{ $appSettings->default_layout_phone }}</a>
            </li>
            <li>
                <i class="fa fa-envelope"></i>
                <a href="mailto:{{ $appSettings->default_layout_email }}">{{ $appSettings->default_layout_email }}</a>
            </li>
            <li>
                <i class="fa fa-map-marker-alt"></i>
                {!! $appSettings->default_layout_address !!}
            </li>
        </ul><!-- /.mobile-nav__contact -->
        <ul class="mobile-nav__social">
            @if ($appSettings->twitter_link)
                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
            @endif
            @if ($appSettings->facebook_link)
                <li> <a href="#"><i class="fab fa-facebook"></i></a></li>
            @endif
            @if ($appSettings->youtube_link)
                <li> <a href="#"><i class="fab fa-youtube"></i></a></li>
            @endif
            @if ($appSettings->instagram_link)
                <li> <a href="#"><i class="fab fa-instagram"></i></a></li>
            @endif
            @if ($appSettings->pinterest_link)
                <li> <a href="#"><i class="fab fa-pinterest"></i></a></li>
            @endif
        </ul><!-- /.mobile-nav__social -->

    </div><!-- /.mobile-nav__content -->
</div><!-- /.mobile-nav__wrapper -->
