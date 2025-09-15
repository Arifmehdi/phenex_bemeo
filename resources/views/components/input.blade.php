@props(['label' => '', 'name' => '', 'value' => '', 'type' => 'text', 'disabled' => false, 'id' => null])

<div>
    <label class="font-semibold">{{ $label }}</label>
    <input
        name="{{ $name }}"
        id="{{ $id ?? $name }}"
        type="{{ $type }}"
        value="{{ old($name, $value) }}"
        {{ $disabled ? 'disabled' : '' }}
        {{ $attributes->merge(['class' => 'w-full p-2 border rounded bg-white']) }}
    />
</div>
