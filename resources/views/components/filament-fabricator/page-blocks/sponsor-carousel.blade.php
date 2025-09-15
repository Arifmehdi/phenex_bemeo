@aware(['page'])
@props([
    'display_limit' => 10, // Default, though it's set in PHP
    'sponsors' => [],
])
<section class="sec-pad-top sec-pad-bottom sponsor-carousel @if (empty($sponsors) || $sponsors->isEmpty()) d-none @endif">
    <div class="container">
        <div class="thm-tns__carousel" id="sponsor-carousel-1"
            data-tns-options='{
            "container": "#sponsor-carousel-1",
            "loop": true,
            "autoplay": true,
            "items": 2,
            "gutter": 30,
            "mouseDrag": true,
            "touch": true,
            "nav": false,
            "autoplayButtonOutput": false,
            "controls": false,
            "responsive": {
                "0": {
                    "items": 2,
                    "gutter": 30
                },
                "576": {
                    "items": 2,
                    "gutter": 30
                },
                "768": {
                    "items": 2,
                    "gutter": 30
                },
                "992": {
                    "items": 3,
                    "gutter": 50
                },
                "1200": {
                    "items": 4,
                    "gutter": 140
                }
            }
        }'>
            @if (!empty($sponsors) && $sponsors->count() > 0)
                @foreach ($sponsors as $sponsor)
                    <div class="item asif" width="220" height="200">
                        <img style="opacity: 1;" height="200" width="220"
                            src="{{ $sponsor->company_logo ? Storage::url($sponsor->company_logo) : asset('theme-assets/images/resources/brand-placeholder.png') }}"
                            alt="{{ $sponsor->company_name ?? 'Sponsor Logo' }}">
                    </div><!-- /.item -->
                @endforeach
            @else
                {{-- This part will likely not be reached if the section is hidden via d-none,
                     but it's good practice for components that might be used elsewhere. --}}
                <div class="item">
                    <p class="text-center">No active sponsors to display at the moment.</p>
                </div>
            @endif
        </div><!-- /.thm-tns__carousel -->
    </div><!-- /.container -->
</section><!-- /.sec-pad-top sec-pad-bottom -->
