    @php
        $ads = App\Models\LoginAds::where('is_active', true)->get();
    @endphp

    <x-guest-layout>
        <!-- Login Form -->
        <form method="POST" action="{{ route('login') }}">
            @csrf

            <!-- Email -->
            <div>
                <x-input-label for="email" :value="__('Email')" />
                <x-text-input id="email" class="block w-full mt-1" type="email" name="email" :value="old('email')"
                    required autofocus />
                <x-input-error :messages="$errors->get('email')" class="mt-2" />
            </div>

            <!-- Password -->
            <div class="mt-4">
                <x-input-label for="password" :value="__('Password')" />
                <x-text-input id="password" class="block w-full mt-1" type="password" name="password" required />
                <x-input-error :messages="$errors->get('password')" class="mt-2" />
            </div>

            <!-- Remember Me -->
            <div class="block mt-4">
                <label for="remember_me" class="inline-flex items-center">
                    <input id="remember_me" type="checkbox"
                        class="rounded border-gray-300 text-indigo-600 shadow-sm focus:ring-indigo-500" name="remember">
                    <span class="ms-2 text-sm text-gray-600">{{ __('Remember me') }}</span>
                </label>
            </div>

            <div class="flex items-center justify-between mt-4">
                <div>
                    @if (Route::has('register'))
                        <a href="{{ route('register') }}"
                            class="text-sm text-gray-600 hover:text-gray-900">{{ __('Register') }}</a>
                    @endif
                    @if (Route::has('password.request'))
                        <a href="{{ route('password.request') }}"
                            class="ms-3 text-sm text-gray-600 hover:text-gray-900">{{ __('Forgot password?') }}</a>
                    @endif
                </div>

                <x-primary-button>
                    {{ __('Log in') }}
                </x-primary-button>
            </div>
        </form>
    </x-guest-layout>
