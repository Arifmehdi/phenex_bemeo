<x-app-layout>

    @php
        $appSettings = app(App\Settings\AppSettings::class);

        $sponsor = Auth::user()->sponsor;
        $hasSponsor = $sponsor !== null;
    @endphp

    <form id="certificateForm" class="p-8 mx-auto my-5 bg-white shadow-lg max-w-7xl" action="{{ route('sponsors.store') }}"
        enctype="multipart/form-data" method="POST">
        @csrf

        {{-- error show --}}
        @if ($errors->any())
            <div class="mb-4 text-red-500">
                @foreach ($errors->all() as $error)
                    <p>{{ $error }}</p>
                @endforeach
            </div>
        @endif

        {{-- success alert --}}
        @if (session('success'))
            <div class="mb-4 text-green-500">{{ session('success') }}</div>
        @endif

        <div class="flex items-center justify-between pb-4 mb-6 border-b-4 border-gray-300">
            <div>
                <h1 class="text-2xl font-bold">Sponsor</h1>
            </div>
            <div>
                <img alt="HealthDoc Connect logo" class="w-12 h-12" height="50"
                    src="/storage/{{ $appSettings->app_logo }}" width="50" />
            </div>
        </div>
        <div class="mb-6">

            <div class="grid grid-cols-1 gap-4 mt-4 sm:grid-cols-2">
                <div class="">
                    <label class="mb-1.5 block font-semibold">Company Name:</label>
                    <input name="company_name" class="w-full p-2 border border-gray-300 rounded" type="text"
                        @if ($hasSponsor) value="{{ $sponsor->company_name }}" readonly @endif
                        placeholder="Name Of Company" />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Company Address:</label>
                    <input name="company_address" class="w-full p-2 border border-gray-300 rounded" type="text"
                        placeholder="Company Address"
                        @if ($hasSponsor) value="{{ $sponsor->company_address }}" readonly @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Sponsor Reason</label>
                    <input name="reason" class="w-full p-2 border border-gray-300 rounded" placeholder="Sponsor Reason"
                        type="text"
                        @if ($hasSponsor) value="{{ $sponsor->reason }}" readonly @endif />
                </div>
                <div>
                    <label class="block mb-2 font-semibold text-gray-900">
                        Company logo
                    </label>
                    <div
                        class="flex flex-col items-center justify-center w-full h-64 bg-white border-2 border-gray-300 border-dashed rounded-lg cursor-pointer hover:border-gray-400 file-upload-container">
                        <div class="flex flex-col items-center justify-center pt-5 pb-6 preview-container">

                            @if ($hasSponsor && $sponsor->company_logo)
                                <img src="{{ asset('storage/' . $sponsor->company_logo) }}"
                                    class="h-40 mb-2 preview-image" alt="Company logo preview">
                            @else
                                <i class="mb-2 text-4xl text-gray-400 fas fa-cloud-upload-alt"></i>
                                <p class="mb-2 text-sm text-gray-500">
                                    <span class="font-semibold">Upload a File</span>
                                </p>
                                <p class="text-xs text-gray-500">Drag and drop files here</p>
                            @endif

                        </div>
                        <input id="company_logo" name="company_logo" type="file" class="hidden" accept="image/*" />
                    </div>
                </div>
            </div>
        </div>
        
                <div>
                    <label class="mb-1.5 block font-semibold">Amount:</label>
                    <input name="amount" class="w-full p-2 border border-gray-300 rounded" type="text"
                        placeholder="Sponsor Amount"
                        @if ($hasSponsor) value="{{ $sponsor->amount }}" readonly @endif />
                </div>

        @if (!$hasSponsor)
            <div class="mt-4">
                <button type="submit"
                    class="h-14 w-45 rounded bg-gradient-to-t from-green-800 to-green-600 px-10 py-2 text-2xl font-semibold text-white shadow-inner shadow-white/50 transition-all duration-300 ease-in-out hover:shadow-[4px_4px_6px_rgba(255,255,255,0.5),-4px_-4px_6px_rgba(116,125,136,0.5),inset_-4px_-4px_6px_rgba(255,255,255,0.2),inset_4px_4px_6px_rgba(0,0,0,0.4)]">Submit</button>
            </div>
        @endif

    </form>

    <br>

    @if ($hasSponsor)
        <!-- Payment -->
        <form enctype="multipart/form-data" method="POST" action="{{ route('sponsors.payment', $sponsor->id) }}"
            class="p-8 mx-auto bg-white shadow-lg max-w-7xl">
            @csrf
            <div class="flex items-center justify-between pb-4 mb-6 border-b-4 border-gray-300">
                <div>
                    <h1 class="text-2xl font-bold text-green-600">Sponsor Fee</h1>
                    @if ($sponsor->expense_id)
                        @if ($sponsor->expense->is_verified)
                            <span class="text-yellow-600">( Verified )</span>
                        @else
                            <span class="text-red-600">( Unverified )</span>
                        @endif
                    @else
                        <span class="text-yellow-600">Pleace payment</span>
                    @endif
                </div>
            </div>

            <div class="w-full mt-4 mb-6">
                <label class="block mb-2 font-semibold text-gray-900">
                    Payment Photos
                </label>
                <div
                    class="flex flex-col items-center justify-center w-full h-64 bg-white border-2 border-gray-300 border-dashed rounded-lg cursor-pointer hover:border-gray-400 file-upload-container">
                    <div class="flex flex-col items-center justify-center pt-5 pb-6 preview-container">
                        @if ($sponsor->expense_id && $sponsor->expense->images)
                            <div class="grid grid-cols-3 gap-2">
                                @foreach ($sponsor->expense->images as $photo)
                                    <img src="{{ asset('storage/' . $photo) }}" class="h-20 preview-image"
                                        alt="Payment Photo Preview">
                                @endforeach
                            </div>
                        @else
                            <i class="mb-2 text-4xl text-gray-400 fas fa-cloud-upload-alt"></i>
                            <p class="mb-2 text-sm text-gray-500">
                                <span class="font-semibold">Upload a File</span>
                            </p>
                            <p class="text-xs text-gray-500">Drag and drop files here</p>
                        @endif
                    </div>
                    <input id="payment-photos" name="payment_photos[]" type="file" class="hidden" accept="image/*"
                        multiple />
                </div>
            </div>
            @if ($sponsor->expense_id)
                @if (!$sponsor->expense->is_verified)
                    <button type="submit"
                        class="text-white font-semibold text-2xl px-10 py-2 w-45 h-14 rounded shadow-inner shadow-white/50 bg-gradient-to-t from-green-800 to-green-600 hover:shadow-[4px_4px_6px_rgba(255,255,255,0.5),-4px_-4px_6px_rgba(116,125,136,0.5),inset_-4px_-4px_6px_rgba(255,255,255,0.2),inset_4px_4px_6px_rgba(0,0,0,0.4)] transition-all duration-300 ease-in-out">
                        Update
                    </button>
                @endif
            @else
                <button type="submit"
                    class="text-white font-semibold text-2xl px-10 py-2 w-45 h-14 rounded shadow-inner shadow-white/50 bg-gradient-to-t from-green-800 to-green-600 hover:shadow-[4px_4px_6px_rgba(255,255,255,0.5),-4px_-4px_6px_rgba(116,125,136,0.5),inset_-4px_-4px_6px_rgba(255,255,255,0.2),inset_4px_4px_6px_rgba(0,0,0,0.4)] transition-all duration-300 ease-in-out">
                    Save
                </button>
            @endif
        </form>
    @endif

    <script>
        // Image preview functionality
        document.querySelectorAll('.file-upload-container').forEach(container => {
            const input = container.querySelector('input[type="file"]');
            const previewContainer = container.querySelector('.preview-container');

            container.addEventListener('click', () => input.click());

            input.addEventListener('change', function(e) {
                if (this.files && this.files.length > 0) {
                    previewContainer.innerHTML = '';

                    if (this.multiple) {
                        // For multiple files
                        const grid = document.createElement('div');
                        grid.className = 'grid grid-cols-3 gap-2';

                        Array.from(this.files).slice(0, 5).forEach(file => {
                            if (file.type.startsWith('image/')) {
                                const img = document.createElement('img');
                                img.className = 'h-20 preview-image';
                                img.src = URL.createObjectURL(file);
                                grid.appendChild(img);
                            }
                        });

                        previewContainer.appendChild(grid);
                    } else {
                        // For single file
                        if (this.files[0].type.startsWith('image/')) {
                            const img = document.createElement('img');
                            img.className = 'h-40 mb-2 preview-image';
                            img.src = URL.createObjectURL(this.files[0]);
                            previewContainer.appendChild(img);
                        }
                    }
                }
            });
        });
    </script>

</x-app-layout>
