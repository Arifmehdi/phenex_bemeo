@aware(['page'])
@props([
    'background_image' => null,
    'gallery_images' => [],
    'section_tagline' => 'Latest Updates',
    'section_title' => 'Important Notices',
    'section_description' => 'Stay informed with the latest announcements and updates from our organization.',
    'button_text' => 'View All Notices',
    'button_link' => '#', // Assuming you have a route named 'notices.index'
    'notice_display_limit' => 5, // Renamed from cv_display_limit
])
@php
    // Fetch active notices
    $notices = \App\Models\Notice::where('is_active', true)
        ->latest()
        ->take($notice_display_limit) // Use the new variable
        ->get();

    // Default gallery images if not provided or less than 5
    $defaultGalleryImages = [null, null, null, null, null];

    $finalGalleryImages = [];
    if (!empty($gallery_images)) {
        foreach ($gallery_images as $index => $galleryItem) {
            $finalGalleryImages[] = isset($galleryItem['image'])
                ? Storage::url($galleryItem['image'])
                : $defaultGalleryImages[$index] ?? null;
        }
    } else {
        $finalGalleryImages = $defaultGalleryImages;
    }
@endphp

<section class="sec-pad-top testimonials-one testimonials-one--bottom-pd-lg">
    <div class="testimonials-one__bg"
        style="background-image: url({{ $background_image ? Storage::url($background_image) : asset('theme-assets/images/backgrounds/testimonials-1-bg.jpg') }});">
    </div>
    <!-- /.testimonials-one__bg -->
    <div class="testimonials-one__gallery">
        @foreach ($finalGalleryImages as $index => $imgSrc)
            @if ($imgSrc)
                <img src="{{ $imgSrc }}" class="{{ $index % 2 == 0 ? 'float-bob-x' : 'float-bob-y' }}"
                    alt="{{ $gallery_images[$index]['alt_text'] ?? 'Gallery Image ' . ($index + 1) }}">
            @endif
        @endforeach
    </div><!-- /.testimonials-one__gallery -->
    <div class="container">
        <div class="row gutter-y-60">
            <div class="col-lg-5">
                <div class="testimonials-one__content">
                    <div class="sec-title">
                        <p class="sec-title__tagline">{{ $section_tagline }}</p><!-- /.sec-title__tagline -->
                        <h2 class="sec-title__title">{!! nl2br(e($section_title)) !!}</h2>
                    </div><!-- /.sec-title -->
                    <p class="testimonials-one__text">{!! nl2br(e($section_description)) !!}</p><!-- /.testimonials-one__text -->
                    <a href="{{ $button_link }}"
                        class="thm-btn testimonials-one__btn"><span>{{ $button_text }}</span></a> {{-- Use the updated button text and link --}}
                </div><!-- /.testimonials-one__content -->
            </div><!-- /.col-lg-5 -->
            <div class="col-lg-7">
                <div class="thm-tns__carousel" id="testimonials-one-carousel-1"
                    data-tns-options='{
                "container": "#testimonials-one-carousel-1",
                "loop": true,
                "autoplay": true,
                "items": 1,
                "gutter": 0,
                "mouseDrag": true,
                "touch": true,
                "nav": false,
                "autoplayButtonOutput": false,
                "controls": false
            }'>
                    @if ($notices->count() > 0) {{-- Check for notices --}}
                        @foreach ($notices as $notice)
                            {{-- Loop through notices --}}
                            <div class="item">
                                <div class="testimonials-card">
                                    <i class="paroti-icon-quote testimonials-card__icon"></i> {{-- You can change this icon if needed --}}
                                    <img src="{{ asset('theme-assets/images/shapes/testimonials-item-bg-1-1.png') }}"
                                        class="testimonials-card__bg" alt="Card background">
                                    <p class="testimonials-card__text">
                                        {{ Str::limit(strip_tags($notice->description), 200) }} {{-- Display notice description, strip HTML tags --}}
                                        {{-- Optional: Add a link to the full notice if you have a show page --}}
                                        {{-- <a href="{{ route('notices.show', $notice->id) }}">Read more</a> --}}
                                    </p><!-- /.testimonials-card__text -->
                                    <div class="clearfix testimonials-card__meta"> {{-- Re-purpose this section for notice title/date --}}
                                        @if ($notice->image)
                                            <img src="{{ Storage::url($notice->image) }}" alt="{{ $notice->title }}"
                                                style="width: 70px; height: 70px; border-radius: 50%; object-fit: cover;">
                                            {{-- Display notice image --}}
                                        @endif
                                        <h3 class="testimonials-card__name">{{ $notice->title }}</h3>
                                        {{-- Display notice title --}}
                                        <p class="testimonials-card__designation">
                                            {{ $notice->created_at->format('M d, Y') }}</p> {{-- Display notice date --}}
                                    </div><!-- /.testimonials-card__meta -->
                                </div><!-- /.testimonials-one__card -->
                            </div><!-- /.item -->
                        @endforeach
                    @else
                        <div class="item">
                            <div class="testimonials-card">
                                <p class="testimonials-card__text" style="text-align: center;">No active notices found
                                    at the moment.</p> {{-- Update empty state message --}}
                            </div>
                        </div>
                    @endif
                </div><!-- /.thm-tns__carousel -->
            </div><!-- /.col-lg-7 -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</section><!-- /.testimonials-one -->
