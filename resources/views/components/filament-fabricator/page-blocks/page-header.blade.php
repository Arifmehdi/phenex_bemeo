@aware(['page'])
<section class="page-header" style="background-image: url(storage/{{ $headerImage }});">
    <div class="container">
        <ul class="list-unstyled breadcrumb-one">
            <li><a href="/">Home</a></li>
            <li><span>{{ $page->title }}</span></li>
        </ul><!-- /.list-unstyled breadcrumb-one -->
        <h2 class="page-header__title">{!! $heading !!}</h2>
    </div><!-- /.container -->
</section><!-- /.page-header -->
