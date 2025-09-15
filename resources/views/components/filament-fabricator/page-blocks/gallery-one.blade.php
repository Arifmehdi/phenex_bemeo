@aware(['page'])
@props([
    'section_tagline' => 'Our Portfolio',
    'section_title' => 'Explore Our Work',
    'images' => [],
])
<section class="gallery-one">
    {{-- You can optionally display the section tagline and title here if your design requires it --}}
    <div class="container text-center mb-5"><p>{{ $section_tagline }}</p><h2>{{ $section_title }}</h2></div>
    <div class="container">
        <div class="gallery-one__carousel thm-owl__carousel owl-carousel owl-theme" data-owl-options='{
            "items": 1,
            "loop": true,
            "dots": false,
            "nav": false,
            "margin": 0,
            "autoplay": true,
            "autoplayTimeOut": 5000,
            "autoplayHoverPause": true,
            "responsive": {
                "0": {
                    "items": 1
                },
                "576": {
                    "items": 2,
                    "margin": 30
                },
                "992": {
                    "items": 3,
                    "margin": 30
                }
            }
        }'>
            @if (!empty($images))
                @foreach ($images as $imageItem)
                    <div class="item">
                        <div class="gallery-card">
                            <div class="gallery-card__image">
                                <img src="{{ isset($imageItem['image']) ? Storage::url($imageItem['image']) : asset('theme-assets/images/gallery/gallery-1-1.png') }}" alt="{{ $imageItem['alt_text'] ?? 'Gallery Image' }}">
                            </div><!-- /.gallery-card__image -->
                            <div class="gallery-card__content">
                                <a class="img-popup" href="{{ isset($imageItem['image']) ? Storage::url($imageItem['image']) : asset('theme-assets/images/gallery/gallery-1-1.png') }}"><i
                                        class="fab fa-instagram"></i></a>
                                {{-- You can also display $imageItem['category_filter_tag'] here if needed --}}
                            </div><!-- /.gallery-card__content -->
                        </div><!-- /.gallery-card -->
                    </div><!-- /.item -->
                @endforeach
            @else
                {{-- Optional: Add a message or default items if no images are provided --}}
                <div class="item"><p class="text-center">No images in this gallery yet.</p></div>
            @endif
        </div><!-- /.gallery-one__carousel thm-owl__carousel owl-carousel owl-theme -->
    </div><!-- /.container-fluid -->
</section><!-- /.gallery-one -->