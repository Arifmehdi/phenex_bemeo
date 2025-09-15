@aware(['page'])
<section class="sec-pad-top sec-pad-bottom">
    <div class="container">
        <div class="row gutter-y-30">

            @foreach (\App\Models\Event::get() as $event)
                <div class="col-md-12 col-lg-4">
                    <div class="events-card">
                        <div class="events-card__image">
                            <img src="/storage/{{$event->image}}" alt="">
                            <img src="/storage/{{$event->image}}" class="events-card__image--hover"
                                alt="">
                        </div><!-- /.events-card__image -->
                        <div class="events-card__content">
                            <div class="events-card__date">{{ $event->created_at->format('d M Y') }}</div>
                            <!-- /.events-card__date -->
                            <ul class="events-card__meta list-unstyled">
                                <li>
                                    <i class="fa fa-clock"></i>
                                    <a href="{{ route('events.show', $event->id) }}">Join Deadline:
                                        {{ $event->join_deadline->format('d M Y') }}</a>
                                </li>
                            </ul><!-- /.blog-card__meta -->
                            <h3 class="events-card__title">
                                <a href="{{ route('events.show', $event->id) }}">{{ $event->title }}</a>
                            </h3><!-- /.events-card__title -->
                        </div><!-- /.events-card__content -->
                    </div><!-- /.events-card -->
                </div><!-- /.col-md-12 col-lg-4 -->
            @endforeach

        </div><!-- /.row -->
    </div><!-- /.container -->
</section>
