<x-app-layout>
    <x-slot name="header">
        <h2 class="text-xl font-semibold leading-tight text-gray-800">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="overflow-hidden bg-white shadow-sm sm:rounded-lg">
                <div class="p-6 text-3xl font-bold">
                    Pay Event Join Amount
                </div>

                @if ($eventJoinedCompany)
                    <!-- Payment -->
                    <form enctype="multipart/form-data" method="POST" action="{{ route('events.payStore', $eventJoinedCompany->id) }}"
                        class="max-w-6xl p-8 mx-auto bg-white shadow-lg">
                        @csrf
                        <div class="flex items-center justify-between pb-4 mb-6 border-b-4 border-gray-300">
                            <div>
                                <h1 class="text-2xl font-bold text-green-600">Payment</h1>

                                @if ($eventJoinedCompany->expense_id)
                                    @if ($eventJoinedCompany->expense->is_verified)
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
                                Payment Amount {{ $eventJoinedCompany->amount }} BDT
                            </label>
                            <div
                                class="flex flex-col items-center justify-center w-full h-64 bg-white border-2 border-gray-300 border-dashed rounded-lg cursor-pointer hover:border-gray-400 file-upload-container">
                                <div class="flex flex-col items-center justify-center pt-5 pb-6 preview-container">
                                    @if ($eventJoinedCompany->expense_id && $eventJoinedCompany->expense->images)
                                        <div class="grid grid-cols-3 gap-2">
                                            @foreach ($eventJoinedCompany->expense->images as $photo)
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
                                <input id="payment-photos" name="payment_photos[]" type="file" class="hidden"
                                    accept="image/*" multiple />
                            </div>
                        </div>
                        @if ($eventJoinedCompany->expense_id)
                            @if (!$eventJoinedCompany->expense->is_verified)
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

            </div>
        </div>
    </div>

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
