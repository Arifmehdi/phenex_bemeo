@aware(['page'])
@props([
    'background_image' => null,
    'video_popup_url' => 'https://www.youtube.com/watch?v=CWCPovmNWK8',
    'video_area_title' =>
        'Help us to donate <br> $<span class="count-text" data-stop="3800" data-speed="1500"></span> to poor childrens',
    'video_area_list_items' => [
        ['item_text' => 'If you are going to use a pass available'],
        ['item_text' => 'Lorem ipsum the majority have suffered'],
        ['item_text' => 'Totam rem aperiam eaque ipsam'],
    ],
    'form_section_title' => 'Apply For a Job',
    'form_section_tagline' => 'Fill out the form below to submit your application.',
    'form_section_description' =>
        'We are always looking for talented individuals. If you think you are a good fit, please apply.',
    'form_submit_button_text' => 'Submit Application',
])

<section class="sec-pad-top sec-pad-bottom video-one">
    <div class="container">
        <div class="video-one__inner"
            style="padding: 25px; background-image: url({{ $background_image ? Storage::url($background_image) : asset('theme-assets/images/backgrounds/video-inner-bg-1-1.jpg') }});">
            <div class="row gutter-y-60">
                <div class="col-md-12 col-lg-6">
                    <div class="video-one__content">
                        <img src="/storage/assets/01JTNQF9DY6DTX7FXSNQXHPQXG.png" height="100" alt="">
                        <h3 class="video-one__title count-box">{!! $video_area_title !!}</h3>
                        <ul class="list-unstyled video-one__list">
                            @foreach ($video_area_list_items as $item)
                                <li><i class="fa fa-check-circle"></i> {{ $item['item_text'] }}</li>
                            @endforeach
                        </ul>
                    </div>
                </div>

                <div class="col-md-12 col-lg-6">
                    {{-- Job Application Form --}}
                    <div class="contact-one__form video-one__form" style="padding: 25px;">
                        <h3 class="contact-one__form__title">{{ $form_section_title }}</h3>

                        @if ($form_section_tagline)
                            <p class="contact-one__form__tagline">{{ $form_section_tagline }}</p>
                        @endif
                        @if ($form_section_description)
                            <p class="mb-4">{{ $form_section_description }}</p>
                        @endif

                        {{-- Flash messages --}}
                        @if (session('success'))
                            <div class="alert alert-success">{{ session('success') }}</div>
                        @endif
                        @if (session('error'))
                            <div class="alert alert-danger">{{ session('error') }}</div>
                        @endif
                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul class="mb-0">
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <form id="jobApplicationForm" action="{{ route('job.apply') }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" placeholder="Your Name*" name="name"
                                        value="{{ old('name') }}" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="email" placeholder="Email Address*" name="email"
                                        value="{{ old('email') }}" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="text" placeholder="Your Phone*" name="phone"
                                        value="{{ old('phone') }}" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="text" placeholder="Desired Position*" name="desired_position"
                                        value="{{ old('desired_position') }}" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="photo" class="form-label"
                                        style="color: #818181; margin-bottom: 5px; display: block;">Upload Photo (JPG,
                                        PNG) 200KB</label>
                                    <input type="file" name="photo" id="photo" class="form-control"
                                        accept="image/jpeg,image/png"
                                        style="padding: 10px; border: 1px solid #e1e1e1; width: 100%; margin-bottom: 20px;">
                                </div>
                                <div class="col-md-12">
                                    <label for="cv" class="form-label"
                                        style="color: #818181; margin-bottom: 5px; display: block;">Upload CV (PDF, DOC,
                                        DOCX)*</label>
                                    <input type="file" name="cv" id="cv" class="form-control" required
                                        accept=".pdf,.doc,.docx"
                                        style="padding: 10px; border: 1px solid #e1e1e1; width: 100%; margin-bottom: 20px;">
                                </div>
                                <div class="col-md-12">
                                    <input type="text" placeholder="Current Location (Optional)" name="location"
                                        value="{{ old('location') }}">
                                </div>
                                <div class="col-md-12">
                                    <textarea name="message" placeholder="Cover Letter / Message (Optional)">{{ old('message') }}</textarea>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" id="jobApplicationSubmitBtn"
                                        class="thm-btn contact-one__btn"><span>{{ $form_submit_button_text }}</span></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.video-one__inner -->
    </div><!-- /.container -->
</section>
