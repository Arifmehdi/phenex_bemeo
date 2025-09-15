<header class="main-header">
    <div class="topbar">
        <div class="container-fluid">
            <div class="topbar__inner">
                <ul class="list-unstyled topbar__info">
                    <li>
                        <i class="fa fa-map"></i>
                        <a href="#">{{ $appSettings->default_layout_address }}</a>
                    </li>
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
                </ul><!-- /.topbar__info -->
                <div class="topbar__social">
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
                </div>
                <ul class="list-unstyled topbar__links">
                    <li><a href="{{ route('login') }}">Login</a></li>
                    <li><a href="{{ route('register') }}">Register</a></li>
                </ul><!-- /.topbar__links -->
            </div><!-- /.topbar__inner -->
        </div><!-- /.container-fluid -->
    </div><!-- /.topbar -->
    <nav class="main-menu sticky-heade">
        <div class="container-fluid">
            <a href="/" class="main-header__logo">
                <img src="/storage/{{ $appSettings->app_logo_dark }}" height="100" alt="">
            </a>
            <ul class="main-menu__list">
                @foreach ($headerMenu->menuItems ?? [] as $item)
                    <li @if ($item->children->count()) class="menu-item-has-children" @endif>
                        <a href="{{ $item->url }}">{{ $item->title }}</a>
                        @if ($item->children->count())
                            <ul>
                                @foreach ($item->children as $child)
                                    <li> <a href="{{ $child->url }}">{{ $child->title }}</a></li>
                                @endforeach
                            </ul>
                        @endif
                    </li>
                @endforeach
            </ul><!-- /.main-menu__list -->

            <div class="main-menu__right">
                <a href="{{route('dashboard')}}" class="main-header__btn">
                   <i class="fa-solid fa-user"></i>
                </a>
                <a href="#" class="main-header__btn search-toggler">
                    <i class="paroti-icon-magnifying-glass"></i>
                </a>
                <a href="#" class="main-header__toggler mobile-nav__toggler">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
            </div><!-- /.main-menu__right -->
        </div><!-- /.container-fluid -->
    </nav><!-- /.main-menu -->
</header>
