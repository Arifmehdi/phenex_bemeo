<x-app-layout>

    @php
        $appSettings = app(App\Settings\AppSettings::class);
        $membership = Auth::user()->membership;
        $hasMembership = $membership !== null;

        $certificateRequest = Auth::user()->certificateRequest;
        $hasCertificateRequest = $certificateRequest !== null;

    @endphp

    <form id="certificateForm" class="p-8 mx-auto my-5 bg-white shadow-lg max-w-7xl"
        action="{{ route('certificate.requests.store') }}" enctype="multipart/form-data" method="POST">
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
                <h1 class="text-2xl font-bold text-green-600">REQUEST FOR CERTIFICATE</h1>

                @if ($hasCertificateRequest)
                    @if ($certificateRequest->status == 'Pending' && $certificateRequest->certificate_collect_date)
                        <span class="text-yellow-600">Certificate Collected Date:
                            {{ $certificateRequest->certificate_collect_date->format('d M Y') }}</span>
                    @elseIf($certificateRequest->status == 'Collected')
                        <span class="text-blue-600">Collected</span>
                    @else
                        <span class="text-red-600">Pending</span>
                    @endif
                @endif

            </div>
            <div>
                <img alt="HealthDoc Connect logo" class="w-12 h-12" height="50"
                    src="/storage/{{ $appSettings->app_logo }}" width="50" />
            </div>
        </div>
        <div class="mb-6">
            <h2 class="pb-2 text-lg font-bold border-b-2 border-gray-300">PERSONAL INFORMATION</h2>
            <div class="grid grid-cols-1 gap-4 mt-4 sm:grid-cols-2">
                <div class="">
                    <label class="mb-1.5 block font-semibold">Name Of Company :</label>
                    <input name="company_name" class="w-full p-2 border border-gray-300 rounded" type="text"
                        @if ($hasMembership) value="{{ $membership->company_name }}" readonly @endif
                        placeholder="Name Of Company" />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Type Of Company :</label>
                    <div class="flex items-center space-x-4">
                        <label class="mb-1.5 flex items-center">
                            <input class="mr-2 company-type" name="company_type" type="radio" required
                                @if ($hasMembership) {{ $membership->company_type == 'Limited Company' ? 'checked' : '' }} readonly @endif
                                value="Limited Company" />
                            Limited Company
                        </label>
                        <label class="mb-1.5 flex items-center">
                            <input class="mr-2 company-type" name="company_type" type="radio" required
                                @if ($hasMembership) {{ $membership->company_type == 'Proprietorship' ? 'checked' : '' }} readonly @endif
                                value="Proprietorship" />
                            Proprietorship
                        </label>
                        <label class="mb-1.5 flex items-center">
                            <input class="mr-2 company-type" name="company_type" type="radio" required
                                @if ($hasMembership) {{ $membership->company_type == 'Foreign Joint Venture' ? 'checked' : '' }} readonly @endif
                                value="Foreign Joint Venture" />
                            Foreign Joint Venture
                        </label>
                    </div>
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Proprietor/Managing Director:</label>
                    <input name="director_name" class="w-full p-2 border border-gray-300 rounded" type="text"
                        placeholder="Proprietor/Managing Director"
                        @if ($hasMembership) value="{{ $membership->director_name }}" readonly @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Nominated Director/Partner (If any):</label>
                    <input name="nominated_director" class="w-full p-2 border border-gray-300 rounded"
                        placeholder="Nominated Director/Partner (If any)" type="text"
                        @if ($hasMembership) value="{{ $membership->nominated_director }}" readonly @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Address:</label>
                    <input name="address" class="w-full p-2 border border-gray-300 rounded" type="text"
                        placeholder="Address"
                        @if ($hasMembership) value="{{ $membership->address }}" readonly @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Phone Number:</label>
                    <input name="phone" class="w-full p-2 border border-gray-300 rounded" placeholder="Phone Number"
                        type="number"
                        @if ($hasMembership) value="{{ $membership->phone }}" readonly @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Email:</label>
                    <input name="email" class="w-full p-2 border border-gray-300 rounded" type="email"
                        placeholder="Email"
                        @if ($hasMembership) value="{{ $membership->email }}" readonly @endif />
                </div>
            </div>

            <div class="mb-6">
                <h2 class="pb-2 text-lg font-bold border-b-2 border-gray-300">SERVICE FEE</h2>
                <div class="grid grid-cols-1 gap-4 mt-4 sm:grid-cols-2">
                    <div>
                        <label class="mb-1.5 block font-semibold">Certificate Fee (Tk):</label>
                        <input name="certificate_fee" class="w-full p-2 border border-gray-300 rounded"
                            placeholder="Yearly Subscription to BEMEA (Tk)" type="number" value="2000" readonly />
                    </div>
        
                    <div>
                        <label class="mb-1.5 block font-semibold">Date:</label>
                        <input name="date" class="w-full p-2 border border-gray-300 rounded" placeholder="Total Head"
                            @if ($hasMembership) value="{{ $membership->payment_date->format('Y-m-d') }}" readonly @endif
                            type="date" />
                    </div>
                    <div>
                        <label class="mb-1.5 block font-semibold">For The Year:</label>
                        <input name="year" class="w-full p-2 border border-gray-300 rounded"
                            placeholder="For The Year:" type="number"
                            @if ($hasMembership) value="{{ $membership->payment_year }}" readonly @endif />
                    </div>
                </div>
            </div>

            <div class="mt-4 mb-10">
                <h2 class="pb-2 text-lg font-bold border-b-2 border-gray-300">SUBMIT YOUR DOCUMENT</h2>

                <div class="w-full mt-4 mb-6">
                    <label class="block mb-2 font-semibold text-gray-900">
                        Update Trade License
                    </label>
                    <div
                        class="flex flex-col items-center justify-center w-full h-64 bg-white border-2 border-gray-300 border-dashed rounded-lg cursor-pointer hover:border-gray-400 file-upload-container">
                        <div class="flex flex-col items-center justify-center pt-5 pb-6 preview-container">

                            @if ($hasCertificateRequest && $certificateRequest->verification_image_path)
                                <img src="{{ asset('storage/' . $certificateRequest->verification_image_path) }}"
                                    class="h-40 mb-2 preview-image" alt="Trade License Preview">
                            @else
                                <i class="mb-2 text-4xl text-gray-400 fas fa-cloud-upload-alt"></i>
                                <p class="mb-2 text-sm text-gray-500">
                                    <span class="font-semibold">Upload a File</span>
                                </p>
                                <p class="text-xs text-gray-500">Drag and drop files here</p>
                            @endif

                        </div>
                        <input id="verification_imageo" name="verification_image" type="file" class="hidden"
                            accept="image/*" />
                    </div>
                </div>


            </div>

            @if (!$hasCertificateRequest)
                <div class="mt-4">
                    <button type="submit"
                        class="h-14 w-45 rounded bg-gradient-to-t from-green-800 to-green-600 px-10 py-2 text-2xl font-semibold text-white shadow-inner shadow-white/50 transition-all duration-300 ease-in-out hover:shadow-[4px_4px_6px_rgba(255,255,255,0.5),-4px_-4px_6px_rgba(116,125,136,0.5),inset_-4px_-4px_6px_rgba(255,255,255,0.2),inset_4px_4px_6px_rgba(0,0,0,0.4)]">Submit</button>
                </div>
            @endif

    </form>

    <br>

    @if ($hasCertificateRequest)
        <!-- Payment -->
        <form enctype="multipart/form-data" method="POST"
            action="{{ route('certificate.requests.payment', $certificateRequest->id) }}"
            class="max-w-6xl p-8 mx-auto bg-white shadow-lg">
            @csrf
            <div class="flex items-center justify-between pb-4 mb-6 border-b-4 border-gray-300">
                <div>
                    <h1 class="text-2xl font-bold text-green-600">Certificate Payment</h1>
                    @if ($certificateRequest->expense_id)
                        @if ($certificateRequest->expense->is_verified)
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
                    Payment Invoice {{ $certificateRequest->certificate_fee }} BDT
                </label>
                <div
                    class="flex flex-col items-center justify-center w-full h-64 bg-white border-2 border-gray-300 border-dashed rounded-lg cursor-pointer hover:border-gray-400 file-upload-container">
                    <div class="flex flex-col items-center justify-center pt-5 pb-6 preview-container">
                        @if ($certificateRequest->expense_id && $certificateRequest->expense->images)
                            <div class="grid grid-cols-3 gap-2">
                                @foreach ($certificateRequest->expense->images as $photo)
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
            @if ($certificateRequest->expense_id)
                @if (!$certificateRequest->expense->is_verified)
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
