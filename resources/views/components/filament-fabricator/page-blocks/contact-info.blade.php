@aware(['page'])
<section class="contact-info">
    <div class="container">
        <div class="contact-info__inner wow fadeInUp" data-wow-duration="1500ms"
            style="background-image: url(/storage/{{ $backgroundImage }});">
            <div class="row gutter-y-30">
                <div class="col-lg-4 col-md-12">
                    <div class="contact-info__item">
                        <div class="contact-info__icon">
                            <i class="fas fa-envelope-open"></i>
                        </div><!-- /.contact-info__icon -->
                        <p class="contact-info__text">
                            <a href="mailto:{{ $email1 }}">{{ $email1 }}</a><br>
                            <a href="mailto:{{ $email2 }}">{{ $email2 }}</a>
                        </p><!-- /.contact-info__text -->
                    </div><!-- /.contact-info__item -->
                </div><!-- /.col-lg-4 -->
                <div class="col-lg-4 col-md-12">
                    <div class="contact-info__item">
                        <div class="contact-info__icon">
                            <i class="fa fa-map"></i>
                        </div><!-- /.contact-info__icon -->
                        <p class="contact-info__text">{!! $address !!}</p>
                    </div><!-- /.contact-info__item -->
                </div><!-- /.col-lg-4 -->
                <div class="col-lg-4 col-md-12">
                    <div class="contact-info__item">
                        <div class="contact-info__icon">
                            <i class="fa fa-mobile"></i>
                        </div><!-- /.contact-info__icon -->
                        <p class="contact-info__text">
                            <a href="tel:{{ $phone1 }}">{{ $phone1 }}</a><br>
                            <a href="tel:{{ $phone2 }}">{{ $phone2 }}</a>
                        </p><!-- /.contact-info__text -->
                    </div><!-- /.contact-info__item -->
                </div><!-- /.col-lg-4 -->
            </div><!-- /.row -->
        </div><!-- /.contact-info__inner -->
    </div><!-- /.container -->
</section>
