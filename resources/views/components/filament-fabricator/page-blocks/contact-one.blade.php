@aware(['page'])
<section class="sec-pad-top sec-pad-bottom contact-one">
    <div class="container">
        <div class="row gutter-y-60">
            <div class="col-lg-4">
                <div class="sec-title">
                    <p class="sec-title__tagline">{{ $title }}</p>
                    <h2 class="sec-title__title">{{ $tagline }}</h2>
                </div>
                <p class="contact-one__text">{{ $description }}</p>
                <div class="contact-one__social">
                    @foreach($socialLinks ?? [] as $link)
                        <a href="{{ $link['url'] ?? '#' }}">
                            <i class="fab fa-{{ $link['platform'] ?? 'twitter' }}"></i>
                        </a>
                    @endforeach
                </div>
            </div>
            <div class="col-lg-8">
                <form action="{{ $formAction }}" class="contact-one__form contact-form-validated">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" placeholder="Your name" name="name">
                        </div>
                        <div class="col-md-6">
                            <input type="text" placeholder="Email address" name="email">
                        </div>
                        <div class="col-md-12">
                            <textarea name="message" placeholder="Write a message"></textarea>
                        </div>
                        <div class="col-md-12">
                            <button type="submit" class="thm-btn contact-one__btn">
                                <span>Send message</span>
                            </button>
                        </div>
                    </div>
                </form>
                <div class="result"></div>
            </div>
        </div>
    </div>
</section>