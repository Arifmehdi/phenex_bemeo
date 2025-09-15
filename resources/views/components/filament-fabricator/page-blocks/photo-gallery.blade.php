@aware(['page'])
@props([
    'gallery_title' => 'Our Photo Gallery',
    'images' => [],
])

<style>
    .photo-gallery-section {
        padding: 60px 0;
        background-color: #f9f9f9;
        /* Light background for the section */
    }

    .photo-gallery-title {
        text-align: center;
        font-size: 2.5rem;
        font-weight: bold;
        color: #333;
        margin-bottom: 40px;
        /* You can use your theme's primary color here, e.g., var(--paroti-base) */
        /* color: var(--paroti-base, #df5311); */
    }

    .photo-gallery-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        /* Responsive grid */
        gap: 20px;
    }

    .photo-gallery-item {
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        background-color: #fff;
    }

    .photo-gallery-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    }

    .photo-gallery-item a {
        display: block;
        text-decoration: none;
        color: inherit;
    }

    .photo-gallery-item img {
        width: 100%;
        height: auto;
        /* Maintains aspect ratio */
        display: block;
        border-bottom: 1px solid #eee;
    }

    .photo-gallery-caption {
        padding: 15px;
        text-align: center;
        font-size: 0.9rem;
        color: #555;
        min-height: 60px;
        /* Ensure some space even if caption is short */
    }

    /* Basic Lightbox Styles (Consider using a library like Lightbox2 or Fancybox for more features) */
    /* These are very basic and would need JS to function fully for a modal effect */
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.5/css/lightbox.min.css" rel="stylesheet" />

<section class="photo-gallery-section">
    <div class="container">
        @if ($gallery_title)
            <h2 class="photo-gallery-title">{{ $gallery_title }}</h2>
        @endif

        @if (!empty($images))
            <div class="photo-gallery-grid">
                @foreach ($images as $imageItem)
                    <div class="photo-gallery-item">
                        <a href="{{ Storage::url($imageItem['image_path']) }}" data-lightbox="gallery-{{ $page->id }}"
                            data-title="{{ $imageItem['caption'] ?? '' }}">
                            <img src="{{ Storage::url($imageItem['image_path']) }}"
                                alt="{{ $imageItem['caption'] ?? 'Gallery Image' }}">
                            @if (!empty($imageItem['caption']))
                                <div class="photo-gallery-caption">
                                    <p>{{ $imageItem['caption'] }}</p>
                                </div>
                            @endif
                        </a>
                    </div>
                @endforeach
            </div>
        @else
            <p class="text-center">No images in this gallery yet.</p>
        @endif
    </div>
</section>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- যদি প্রয়োজন হয় -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.5/js/lightbox.min.js"></script>

<script>
    $('[data-fancybox="gallery-{{ $page->id }}"]').fancybox({
        // Options here
    });
</script>
