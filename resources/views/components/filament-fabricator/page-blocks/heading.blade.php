@aware(['page'])

@php
    $heading = $heading ?? '';
    $alignment = $alignment ?? 'left';
    $size = $size ?? 'h2';
    $color = $color ?? '#000000';
@endphp
<div style=" background-color: {{ $background }}; margin-top: -15px;">
    <div class="container">
        <{{ $size }} style="text-align: {{ $alignment }}; color: {{ $color }};" class="py-3">
            {{ $heading }}
            </{{ $size }}>
    </div>
</div>
