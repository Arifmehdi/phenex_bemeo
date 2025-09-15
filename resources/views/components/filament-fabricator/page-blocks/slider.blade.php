@aware(['page'])
<section class="slider-one">
    <div class="thm-owl__carousel owl-carousel owl-theme"
        data-owl-options='{
				"loop": true,
				"autoplay": true,
				"autoplayTimeOut": 7000,
				"items": 1,
				"margin": 0,
				"animateIn": "fadeIn",
				"animateOut": "slideOutDown",
				"nav": true,
				"dots": true,
				"navText": ["<span class=\"paroti-icon-left-arrow\"></span>","<span class=\"paroti-icon-right-arrow\"></span>"]
			}'>
        @foreach ($items as $item)
            @if (!empty($item['slider_image']))
                <div class="item">
                    <div class="slider-one__item">
                        <div class="slider-one__image"
                            style="background-image: url({{ asset('storage/' . $item['slider_image']) }});"></div>
                        <!-- /.slider-one__image -->
                        <div class="container">
                            <h2 class="slider-one__title">{!! $item['heading'] ?? '' !!}</h2><!-- /.slider-one__title -->
                            <p class="slider-one__text">{!! $item['slug_line'] ?? '' !!}</p><!-- /.slider-one__text -->

                            @if (!empty($item['button_link']) && !empty($item['button_text']))
                                <div class="slider-one__btns">
                                    <a href="{{ $item['button_link'] }}" class="thm-btn slider-one__btn">
                                        <span> {{ $item['button_text'] }} </span>
                                    </a><!-- /.thm-btn slider-one__btn -->
                                </div><!-- /.slider-one__btns -->
                            @endif
                        </div><!-- /.container -->
                    </div><!-- /.slider-one__item -->
                </div><!-- /.item -->
            @endif
        @endforeach

    </div><!-- /.thm-owl__carousel -->
</section>
