@aware(['page'])
<div class="container">
    <div>
        {!! str($content)->sanitizeHtml() !!}
    </div>
</div>
