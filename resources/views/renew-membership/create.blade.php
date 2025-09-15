<x-app-layout>
    @php
        $appSettings = app(App\Settings\AppSettings::class);
        $membership = Auth::user()->membership;
        $hasMembership = $membership !== null;
    @endphp

    <style>
        .file-upload-container {
            transition: all 0.3s ease;
        }

        .file-upload-container:hover {
            border-color: #9CA3AF;
        }

        .preview-image {
            object-fit: cover;
            border: 1px solid #E5E7EB;
            border-radius: 0.375rem;
        }
    </style>

    <br>

    <form enctype="multipart/form-data" method="POST" action="{{ route('renew-membership.store') }}"
        class="max-w-6xl p-8 mx-auto bg-white shadow-lg">
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

        @csrf

        <div class="flex items-center justify-between pb-4 mb-6 border-b-4 border-gray-300">
            <div>
                <h1 class="text-2xl font-bold text-green-600">
                    MEMBERSHIP RENEWAL
                </h1>
                @if ($hasMembership)
                    @if ($membership->renewal() && !$membership->renewal()->is_active)
                        <span class="text-yellow-600">( Pending )</span>
                    @else
                        <span class="text-red-600 " style="display: block">( Pleace Renew Your Membership )</span>
                    @endif
                @endif
                @if ($hasMembership)
                    @if ($membership->membership_expire_date)
                        <span class="text-yellow-600 d-block">Membership expire at
                            {{ $membership->membership_expire_date->format('d M Y') }}</span>
                    @endif
                @endif
            </div>
            <div>
                <img alt="HealthDoc Connect logo" class="w-12 h-12" height="50"
                    src="/storage/{{ $appSettings->app_logo }}" width="50" />
            </div>
        </div>

        <div class="mb-6">
            <h2 class="pb-2 text-lg font-bold border-b-2 border-gray-300">
                PERSONAL INFORMATION
            </h2>
            <div class="grid grid-cols-1 gap-4 mt-4 sm:grid-cols-2">
                <div class="">
                    <label class="mb-1.5 block font-semibold">Name of Company:</label>
                    <input name="company_name" class="w-full p-2 border border-gray-300 rounded" type="text"
                        placeholder="Name of Unit/Company" required
                        @if ($hasMembership) value="{{ $membership->company_name }}" disabled @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Type Of Company :</label>
                    <div class="flex items-center" style="flex-wrap: wrap;justify-content: space-between;">
                        <label class="mb-1.5 flex items-center">
                            <input class="mr-2 company-type" name="company_type" type="radio" required
                                @if ($hasMembership) {{ $membership->company_type == 'Limited Company' ? 'checked' : '' }} disabled @endif
                                value="Limited Company" />
                            Limited Company
                        </label>
                        <label class="mb-1.5 flex items-center">
                            <input class="mr-2 company-type" name="company_type" type="radio" required
                                @if ($hasMembership) {{ $membership->company_type == 'Proprietorship' ? 'checked' : '' }} disabled @endif
                                value="Proprietorship" />
                            Proprietorship
                        </label>
                        <label class="mb-1.5 flex items-center">
                            <input class="mr-2 company-type" name="company_type" type="radio" required
                                @if ($hasMembership) {{ $membership->company_type == 'Partnership' ? 'checked' : '' }} disabled @endif
                                value="Partnership" />
                            Partnership
                        </label>
                        <label class="mb-1.5 flex items-center">
                            <input class="mr-2 company-type" name="company_type" type="radio" required
                                @if ($hasMembership) {{ $membership->company_type == 'Foreign Joint Venture' ? 'checked' : '' }} disabled @endif
                                value="Foreign Joint Venture" />
                            Foreign Joint Venture
                        </label>
                    </div>
                </div>

                <div>
                    <label class="mb-1.5 block font-semibold">Proprietor/Managing Director:</label>
                    <input name="director_name" class="w-full p-2 border border-gray-300 rounded" type="text"
                        required placeholder="Proprietor/Managing Director"
                        @if ($hasMembership) value="{{ $membership->director_name }}" disabled @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Nominated Director/Partner (If any):</label>
                    <input name="nominated_director" class="w-full p-2 border border-gray-300 rounded"
                        placeholder="Nominated Director/Partner (If any)" type="text" required
                        @if ($hasMembership) value="{{ $membership->nominated_director }}" disabled @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Address:</label>
                    <input name="address" class="w-full p-2 border border-gray-300 rounded" type="text" required
                        placeholder="Address"
                        @if ($hasMembership) value="{{ $membership->address }}" disabled @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Telephone</label>
                    <input name="telephone" class="w-full p-2 border border-gray-300 rounded" placeholder="Telephone"
                        required type="number"
                        @if ($hasMembership) value="{{ $membership->telephone }}" disabled @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Phone Number:</label>
                    <input name="phone" class="w-full p-2 border border-gray-300 rounded" type="number" required
                        @if ($hasMembership) value="{{ $membership->phone }}" disabled @endif />
                </div>

                <div>
                    <label class="mb-1.5 block font-semibold">Email:</label>
                    <input name="email" class="w-full p-2 border border-gray-300 rounded" type="email" required
                        @if ($hasMembership) value="{{ $membership->email }}" disabled @endif
                        placeholder="Email" />
                </div>

                <div>
                    <label class="mb-1.5 block font-semibold">Gender Identity:</label>
                    <div class="flex items-center space-x-4">
                        <label class="mb-1.5 flex items-center">
                            <input class="mr-2" name="gender" type="radio" value="Male"
                                @if ($hasMembership) {{ $membership->gender == 'Male' ? 'checked' : '' }} disabled @endif
                                required />
                            Male
                        </label>
                        <label class="mb-1.5 flex items-center">
                            <input class="mr-2" name="gender" type="radio" value="Female"
                                @if ($hasMembership) {{ $membership->gender == 'Female' ? 'checked' : '' }} disabled @endif
                                required />
                            Female
                        </label>
                    </div>
                </div>

                <div>
                    <label class="mb-1.5 block font-semibold">Membership Fee :</label>
                    <input name="membership_fee" id="membership_fee" disabled
                        @if ($hasMembership) value="{{ $membership->membership_fee }}" @endif
                        class="w-full p-2 border border-gray-300 rounded disabled:bg-gray-100" type="number" />
                </div>

            </div>
        </div>

        <div class="mb-6">
            <h2 class="pb-2 text-lg font-bold border-b-2 border-gray-300">
                MATCHING DETAILS
            </h2>

            <div class="grid grid-cols-1 gap-4 mt-4 sm:grid-cols-2">
                <div>
                    <label class="mb-1.5 block font-semibold">Number of Machines:</label>
                    <input name="machine_count" id="number_of_machines"
                        class="w-full p-2 border border-gray-300 rounded" placeholder="Number of Machines"
                        type="number" required
                        @if ($hasMembership) value="{{ $membership->machine_count }}" @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Brand:</label>
                    <input name="brand" class="w-full p-2 border border-gray-300 rounded" placeholder="Brand Name"
                        type="text" required
                        @if ($hasMembership) value="{{ $membership->brand }}" disabled @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Total Head:</label>
                    <input name="total_head" class="w-full p-2 border border-gray-300 rounded"
                        placeholder="Total Head" type="text" required
                        @if ($hasMembership) value="{{ $membership->total_head }}" disabled @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Needle/Colors:</label>
                    <input name="needle_colors" class="w-full p-2 border border-gray-300 rounded"
                        placeholder="Needle/Colors:" type="text" required
                        @if ($hasMembership) value="{{ $membership->needle_colors }}" disabled @endif />
                </div>
            </div>
            <div class="mt-4 mb-6">
                <h1 class="font-semibold text-red-600">
                    (Note: Please make up-to-date payment to BEMEA fees. This is
                    compulsory for printing your factory details in Yearly Directory).
                </h1>
            </div>
        </div>

        <div class="mb-6">
            <h2 class="pb-2 text-lg font-bold border-b-2 border-gray-300">
                SERVICE FEE
            </h2>
            <div class="grid grid-cols-1 gap-4 mt-4 sm:grid-cols-2">

                <div>
                    <label class="mb-1.5 block font-semibold">Yearly Subscription to BEMEA (Tk):</label>
                    <input name="yearly_subscription" id="yearly_fee" disabled
                        class="w-full p-2 border border-gray-300 rounded disabled:bg-gray-100"
                        placeholder="Yearly Subscription to BEMEA (Tk)" type="number" required
                        @if ($hasMembership) value="{{ $membership->yearly_subscription }}" @endif />
                </div>

                <div>
                    <label class="mb-1.5 block font-semibold">Date:</label>
                    <input name="payment_date" class="w-full p-2 border border-gray-300 rounded"
                        placeholder="Total Head" type="date" required value="{{ now()->format('Y-m-d') }}"
                        disabled />
                </div>

                <div>
                    <label class="mb-1.5 block font-semibold">For The Year:</label>
                    <input name="payment_year" class="w-full p-2 border border-gray-300 rounded"
                        placeholder="For The Year:" type="number" required min="1"
                        @if ($hasMembership) value="{{ $membership->payment_year }}" @endif />
                    <h1 class="font-semibold text-red-600" style=" margin-top: 1rem;">
                        (Note: For New Membership Have to Pay a two-year Subscription Fee).
                    </h1>
                </div>
            </div>
        </div>

        <div class="mb-6">
            <h2 class="pb-2 text-lg font-bold border-b-2 border-gray-300">
                AFFILIATED ORGANIZATION
            </h2>

            <div class="grid grid-cols-1 gap-4 mt-4 sm:grid-cols-2">
                <div>
                    <label class="mb-1.5 block font-semibold">Sister Concerned Units/Group/Companies:</label>
                    <input name="sister_concerns" class="w-full p-2 border border-gray-300 rounded"
                        placeholder="Enter Sister Concerned Units/Group/Companies" type="text" required
                        @if ($hasMembership) value="{{ $membership->sister_concerns }}" disabled @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold">Any Details/Remarks:</label>
                    <input name="remarks" class="w-full p-2 border border-gray-300 rounded"
                        placeholder="Enter Additional Details or Remarks" type="text" required
                        @if ($hasMembership) value="{{ $membership->remarks }}" disabled @endif />
                </div>
            </div>
        </div>

        <div class="mt-4 mb-6">
            <h2 class="pb-2 text-lg font-bold border-b-2 border-gray-300">
                SUBMIT YOUR DOCUMENTS
            </h2>
            <div class="grid grid-cols-1 gap-4 md:grid-cols-2">
                <!-- Nomination Certificate -->
                <div class="w-full mt-4 mb-6">
                    <label class="block mb-2 font-semibold text-gray-900">
                        Nomination Certificate Image Upload
                    </label>
                    <div
                        class="flex flex-col items-center justify-center w-full h-64 bg-white border-2 border-gray-300 border-dashed rounded-lg cursor-pointer hover:border-gray-400 file-upload-container">
                        <div class="flex flex-col items-center justify-center pt-5 pb-6 preview-container">
                            @if ($hasMembership && $membership->nomination_certificate)
                                <img src="{{ asset('storage/' . $membership->nomination_certificate) }}"
                                    class="h-40 mb-2 preview-image" alt="Nomination Certificate Preview">
                            @else
                                <i class="mb-2 text-4xl text-gray-400 fas fa-cloud-upload-alt"></i>
                                <p class="mb-2 text-sm text-gray-500">
                                    <span class="font-semibold">Upload a File</span>
                                </p>
                                <p class="text-xs text-gray-500">Drag and drop files here</p>
                            @endif
                        </div>
                        <input id="nomination-certificate" name="nomination_certificate" type="file"
                            class="hidden" accept="image/*" />
                    </div>
                </div>

                <!-- Trade License -->
                <div class="w-full mt-4 mb-6">
                    <label class="block mb-2 font-semibold text-gray-900">
                        Trade license Must , If Have - Vat, Tin
                    </label>
                    <div
                        class="flex flex-col items-center justify-center w-full h-64 bg-white border-2 border-gray-300 border-dashed rounded-lg cursor-pointer hover:border-gray-400 file-upload-container">
                        <div class="flex flex-col items-center justify-center pt-5 pb-6 preview-container">

                            @if ($hasMembership && $membership->renewal() && !$membership->renewal()->is_active)
                                <img src="{{ asset('storage/' . $membership->trade_license) }}"
                                    class="h-40 mb-2 preview-image" alt="Trade License Preview">
                            @else
                                <i class="mb-2 text-4xl text-gray-400 fas fa-cloud-upload-alt"></i>
                                <p class="mb-2 text-sm text-gray-500">
                                    <span class="font-semibold">Upload a File</span>
                                </p>
                                <p class="text-xs text-gray-500">Drag and drop files here</p>
                            @endif
                        </div>
                        <input id="trade-license" name="trade_license" type="file" class="hidden"
                            accept="image/*" />
                    </div>
                </div>

                <!-- Factory Photos -->
                <div class="w-full mt-4 mb-6">
                    <label class="block mb-2 font-semibold text-gray-900">
                        Factory Photo Upload - Minimum 3 pcs Maximum 5 pcs
                    </label>
                    <div
                        class="flex flex-col items-center justify-center w-full h-64 bg-white border-2 border-gray-300 border-dashed rounded-lg cursor-pointer hover:border-gray-400 file-upload-container">
                        <div class="flex flex-col items-center justify-center pt-5 pb-6 preview-container">
                            @if ($hasMembership && $membership->factory_photos)
                                <div class="grid grid-cols-3 gap-2">
                                    @foreach ($membership->factory_photos as $photo)
                                        <img src="{{ asset('storage/' . $photo) }}" class="h-20 preview-image"
                                            alt="Factory Photo Preview">
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
                        <input id="factory-photos" name="factory_photos[]" type="file" class="hidden"
                            accept="image/*" multiple />
                    </div>
                </div>

                <!-- Director Photo -->
                <div class="w-full mt-4 mb-6">
                    <label class="block mb-2 font-semibold text-gray-900">
                        Proprietor/Managing Director Photo Upload
                    </label>
                    <div
                        class="flex flex-col items-center justify-center w-full h-64 bg-white border-2 border-gray-300 border-dashed rounded-lg cursor-pointer hover:border-gray-400 file-upload-container">
                        <div class="flex flex-col items-center justify-center pt-5 pb-6 preview-container">
                            @if ($hasMembership && $membership->director_photo)
                                <img src="{{ asset('storage/' . $membership->director_photo) }}"
                                    class="h-40 mb-2 preview-image" alt="Director Photo Preview">
                            @else
                                <i class="mb-2 text-4xl text-gray-400 fas fa-cloud-upload-alt"></i>
                                <p class="mb-2 text-sm text-gray-500">
                                    <span class="font-semibold">Upload a File</span>
                                </p>
                                <p class="text-xs text-gray-500">Drag and drop files here</p>
                            @endif
                        </div>
                        <input id="director-photo" name="director_photo" type="file" class="hidden"
                            accept="image/*" />
                    </div>
                </div>

            </div>
            <div class="mt-1 mb-6">
                <h1 class="font-semibold text-red-600">
                    ( Note: Pixel 800*800 , Background White Must )
                </h1>
            </div>
        </div>

        <div class="flex justify-between mt-6">
            @if (
                ($membership->renewal() && $membership->renewal()->renew_expire_date < Carbon\Carbon::now()) ||
                    !$membership->renewal())
                <button type="submit"
                    class="text-white font-semibold text-2xl px-10 py-2 w-45 h-14 rounded shadow-inner shadow-white/50 bg-gradient-to-t from-green-800 to-green-600 hover:shadow-[4px_4px_6px_rgba(255,255,255,0.5),-4px_-4px_6px_rgba(116,125,136,0.5),inset_-4px_-4px_6px_rgba(255,255,255,0.2),inset_4px_4px_6px_rgba(0,0,0,0.4)] transition-all duration-300 ease-in-out">
                    Submit
                </button>
            @endif
        </div>
    </form>

    <br>

    @if ($hasMembership && $membership->renewal() && !$membership->renewal()->is_active)
        <!-- Payment -->
        <form enctype="multipart/form-data" method="POST"
            action="{{ route('renew-membership.payment', $membership->renewal()->id) }}"
            class="max-w-6xl p-8 mx-auto bg-white shadow-lg">
            @csrf
            <div class="flex items-center justify-between pb-4 mb-6 border-b-4 border-gray-300">
                <div>
                    <h1 class="text-2xl font-bold text-green-600">Membership Renew Payment</h1>
                    @if ($membership->renewal()->expense_id)
                        @if ($membership->renewal()->expense->is_verified)
                            <span class="text-yellow-600">( Verified )</span>
                        @else
                            <span class="text-red-600">( Unverified )</span>
                        @endif
                    @else
                        <span class="text-yellow-600">Pleace payment {{ $membership->renewal()->renew_amount }}</span>
                    @endif
                </div>
            </div>

            <div class="w-full mt-4 mb-6">
                <label class="block mb-2 font-semibold text-gray-900">
                    Payment Invoice {{ $membership->renewal()->renew_amount }} Tk.
                </label>
                <div
                    class="flex flex-col items-center justify-center w-full h-64 bg-white border-2 border-gray-300 border-dashed rounded-lg cursor-pointer hover:border-gray-400 file-upload-container">
                    <div class="flex flex-col items-center justify-center pt-5 pb-6 preview-container">
                        @if ($membership->renewal()->expense_id && $membership->renewal()->expense->images)
                            <div class="grid grid-cols-3 gap-2">
                                @foreach ($membership->renewal()->expense->images as $photo)
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
            @if ($membership->renewal() && $membership->renewal()->expense_id)
                @if (!$membership->renewal() && $membership->renewal()->expense->is_verified)
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

    <br>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const machineInput = document.getElementById('number_of_machines');
            const yearlyFeeInput = document.getElementById('yearly_fee');

            machineInput.addEventListener('input', function() {
                const val = parseInt(this.value);
                if (val >= 1 && val <= 4) {
                    yearlyFeeInput.value = {{ $appSettings->machine_fee_1_to_4 }};
                } else if (val >= 5 && val <= 9) {
                    yearlyFeeInput.value = {{ $appSettings->machine_fee_5_to_9 }};
                } else if (val >= 10) {
                    yearlyFeeInput.value = {{ $appSettings->machine_fee_10_plus }};
                } else {
                    yearlyFeeInput.value = '';
                }
            });

            const typeRadios = document.querySelectorAll('.company-type');
            const membershipFee = document.getElementById('membership_fee');
            typeRadios.forEach(radio => {
                radio.addEventListener('change', () => {
                    if (radio.checked) {
                        if (radio.value === 'Limited Company') {
                            membershipFee.value = 10000;
                        } else if (radio.value === 'Proprietorship') {
                            membershipFee.value = 5000;
                        } else if (radio.value === 'Foreign Joint Venture') {
                            membershipFee.value = 20000;
                        } else if (radio.value === 'Partnership') {
                            membershipFee.value = {{ $appSettings->partnership }};
                        }
                    }
                });
            });
        });
    </script>

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
