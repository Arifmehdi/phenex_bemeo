<x-app-layout>
    @php
        $appSettings = app(App\Settings\AppSettings::class);
        $membership = Auth::user()->membership;
        $hasMembership = $membership !== null;
        $totalfee = $appSettings->subscription_fee + $appSettings->new_fee;
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

        label.required::after {
            content: " *";
            color: red;
        }

        #submitBtn:disabled {
            background: linear-gradient(to top, #9ca3af, #6b7280); /* gray gradient */
            cursor: not-allowed;
            box-shadow: none !important;
            opacity: 0.7;
        }
    </style>

    <br>

    <form enctype="multipart/form-data" method="POST"
        action="{{ $hasMembership ? route('membership.destroy') : route('membership.store') }}"
        class="max-w-6xl p-8 mx-auto bg-white shadow-lg">

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

        @if ($hasMembership)
            @method('delete')
        @endif

        <div class="flex items-center justify-between pb-4 mb-6 border-b-4 border-gray-300">
            <div>
                <h1 class="text-2xl font-bold text-green-600">
                    MEMBERSHIP REGISTRATION

                    @if ($hasMembership)
                        @if ($membership->is_active)
                            <span class="text-yellow-600">( Approved )</span>
                        @else
                            <span class="text-red-600">( Pending )</span>
                        @endif
                    @endif

                </h1>
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
                MEMBER TYPE
            </h2>

            <div class="border border-gray-300 rounded-lg p-4 mt-3">
                <!-- Radio buttons -->
                <div class="mb-4">
                    <label class="flex items-center gap-2">
                        <input type="radio" name="member_type" value="1" checked class="h-4 w-4 text-blue-600" @if ($hasMembership) {{ $membership->member_type == 1 ? 'checked' : '' }} disabled @endif>
                        <span>General Member</span>
                    </label>
                    <label class="flex items-center gap-2 mt-2">
                        <input type="radio" name="member_type" value="2" class="h-4 w-4 text-blue-600" required  @if ($hasMembership) {{ $membership->member_type == 2 ? 'checked' : '' }} disabled @endif>
                        <span>Existing Member</span>
                    </label>
                </div>

                <!-- Fees -->
                <div class="flex gap-4 mb-4">
                    <!-- Subscription Fee -->
                    <div class="w-1/2">
                        <div class="flex items-center gap-2 flex-nowrap">
                            <span class="whitespace-nowrap">Subscription Fee</span>
                            <input type="hidden" name="subscription_fee" value="{{ $appSettings->subscription_fee ?? ' ' }}">
                            <input type="number"
                                class="p-2 border border-gray-300 rounded flex-1" 
                                placeholder="Subscription Fee (BDT)"
                                required
                               value="{{ $appSettings->subscription_fee ?? ' ' }}" disabled/>
                            <span>BDT</span>
                        </div>
                    </div>

                    <!-- New Fee -->
                    <div class="w-1/2">
                        <div class="flex items-center gap-2 flex-nowrap">
                            <span class="whitespace-nowrap">New Fee</span>
                            <input type="hidden" name="new_fee" value="{{ $appSettings->new_fee ?? ' ' }}">
                            <input name="new_fee" 
                                type="number"
                                class="p-2 border border-gray-300 rounded flex-1" 
                                placeholder="New Fee (BDT)"
                                 value="{{ $appSettings->new_fee ?? ' ' }}" disabled/>
                            <span>BDT</span>
                        </div>
                    </div>
                </div>

                <!-- Total -->
                <div class="flex gap-4 mt-3 mb-3">
                    <label class="mb-1.5 block font-semibold"><strong>Total : {{$totalfee ?? 100}} BDT</strong></label>
                </div>
            </div>

            <!-- Life member Contribution -->
            <div class="border border-gray-300 rounded-lg p-4 mt-3">
                <div class="mb-4">
                    <label class="mb-1.5 block font-semibold">Life Member</label>
                    <div class="flex items-center gap-2">
                        <input type="hidden" name="life_member_fee" value="{{ $appSettings->life_member_fee ?? ' ' }}">
                        Contributions <input
                            type="number"
                            class="p-2 border border-gray-300 rounded w-40" 
                            placeholder="Amount"
                               value="{{$appSettings->life_member_fee ?? ' '}}" disabled 
                            required />
                        <span>BDT (Not Renewal)</span>
                    </div>
                </div>
            </div>

            <!-- Donor member Contribution -->
            <div class="border border-gray-300 rounded-lg p-4 mt-3">
                <div class="mb-4">
                    <label class="mb-1.5 block font-semibold">Donor Member</label>
                    <div class="flex items-center gap-2">
                        <input type="hidden" name="donor_member_fee" value="{{ $appSettings->donor_member_fee ?? ' ' }}">
                        Contributions <input  
                            type="number"
                            class="p-2 border border-gray-300 rounded w-40" 
                            placeholder="Amount"
                            value="{{$appSettings->donor_member_fee ?? 100}}" disabled  
                            required />
                        <span>BDT (Not Renewal)</span>
                    </div>
                </div>
            </div>



            <h2 class="pb-2 text-lg font-bold border-b-2 border-gray-300 mt-2">
                PERSONAL INFORMATION
            </h2>
            
            <div class="grid grid-cols-1 gap-4 mt-4 sm:grid-cols-2">
                
                <div>
                    <label class="mb-1.5 block font-semibold required">Full Name:</label>
                    <input name="full_name" class="w-full p-2 border border-gray-300 rounded" type="text"
                        required placeholder="Full Name"
                        @if ($hasMembership) value="{{ $membership->full_name }}" disabled @endif />
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold required">Father Name:</label>
                    <input name="father_name" class="w-full p-2 border border-gray-300 rounded"
                        placeholder="Father Name" type="text"
                        @if ($hasMembership) value="{{ $membership->father_name }}" disabled @endif required />
                </div>

                <div>
                    <label class="mb-1.5 block font-semibold required">Mobile:</label>
                    <input name="phone" class="w-full p-2 border border-gray-300 rounded" type="text"
                        required placeholder="Enter Mobile Number"
                        @if ($hasMembership) value="{{ $membership->phone }}" disabled @endif />
                </div>


                <div class="">
                    <label class="mb-1.5 block font-semibold required">Profession</label>
                    <select name="profession" id="" class="w-full p-2 border border-gray-300 rounded" required >
                        <option value="">--Select--</option>
                        <option value="Doctor" {{ (isset($membership) && $membership->profession == 'Doctor') ? 'selected' : '' }}>Doctor</option>
                        <option value="Business Man" {{ (isset($membership) && $membership->profession == 'Business Man') ? 'selected' : '' }}>Business Man</option>
                        <option value="Student" {{ (isset($membership) && $membership->profession == 'Student') ? 'selected' : '' }}>Student</option>
                        <option value="Other" {{ (isset($membership) && $membership->profession == 'Other') ? 'selected' : '' }}>Other</option>
                    </select>
                </div>

                <div class="">
                    <label class="mb-1.5 block font-semibold ">Profession Doc Type</label>
                    <select name="profession_doc_type" id="" class="w-full p-2 border border-gray-300 rounded">
                        <option value="">--Select--</option>
                        <option value="certificate" {{ (isset($membership) && $membership->profession_doc_type == 'certificate') ? 'selected' : '' }}>Certificate</option>
                        <option value="Tin Certificate" {{ (isset($membership) && $membership->profession_doc_type == 'Tin Certificate') ? 'selected' : '' }}>Tin Certificate</option>
                        <option value="NID" {{ (isset($membership) && $membership->profession_doc_type == 'NID') ? 'selected' : '' }}>NID</option>
                        <option value="Other" {{ (isset($membership) && $membership->profession_doc_type == 'Other') ? 'selected' : '' }}>Other</option>
                    </select>
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold required">Upload Document</label>
                    <input type="file" name="profession_doc" class="w-full p-2 border border-gray-300 rounded" />
                </div>

                <div>
                    <label class="mb-1.5 block font-semibold required">Present Address</label>
                    <input type="text" name="present_address" class="w-full p-2 border border-gray-300 rounded" placeholder="Present Address"  @if ($hasMembership) value="{{ $membership->present_address }}" disabled @endif required/>
                </div>
                <div class="">
                    <label class="mb-1.5 block font-semibold required">Parmanent Address</label>
                    <select name="permanent_address" id="" class="w-full p-2 border border-gray-300 rounded" required >
                        <option value="">--Select--</option>
                        <option value="Dhaka" {{ (isset($membership) && $membership->permanent_address == 'Dhaka') ? 'selected' : '' }}>Dhaka</option>
                        <option value="Khulna" {{ (isset($membership) && $membership->permanent_address == 'Khulna') ? 'selected' : '' }}>Khulna</option>
                        <option value="Chattogram" {{ (isset($membership) && $membership->permanent_address == 'Chattogram') ? 'selected' : '' }}>Chattogram</option>
                        <option value="Other" {{ (isset($membership) && $membership->permanent_address == 'Other') ? 'selected' : '' }}>Other</option>
                    </select>
                </div>
                <div class="">
                    <label class="mb-1.5 block font-semibold ">Union</label>
                    <select name="union_name" id="" class="w-full p-2 border border-gray-300 rounded" >
                        <option value="">--Select--</option>
                        <option value="Adara" {{ (isset($membership) && $membership->union_name == 'Adara') ? 'selected' : '' }}>Adara</option>
                        <option value="Hathajari" {{ (isset($membership) && $membership->union_name == 'Hathajari') ? 'selected' : '' }}>Hathajari </option>
                        <option value="Miradabad" {{ (isset($membership) && $membership->union_name == 'Miradabad') ? 'selected' : '' }}>Miradabad</option>
                        <option value="Other" {{ (isset($membership) && $membership->union_name == 'Other') ? 'selected' : '' }}>Other</option>
                    </select>
                </div>                
                <div class="">
                    <label class="mb-1.5 block font-semibold ">Ward Number</label>
                    <select name="ward" id="" class="w-full p-2 border border-gray-300 rounded" >
                        <option value="">--Select--</option>
                        <option value="1" {{ (isset($membership) && $membership->ward == 1) ? 'selected' : '' }}>1</option>
                        <option value="2" {{ (isset($membership) && $membership->ward == 2) ? 'selected' : '' }}>2</option>
                        <option value="3" {{ (isset($membership) && $membership->ward == 3) ? 'selected' : '' }}>3</option>
                        <option value="Other" {{ (isset($membership) && $membership->ward == 'Other') ? 'selected' : '' }}>Other</option>
                    </select>
                </div>
            </div>

            <!-- Guardian details -->
            <div class="border border-gray-300 bg-gray-100 rounded-lg p-4 mt-3">
                <h2 class="pb-2 text-lg font-bold">
                Guardian Details
                </h2>
                <span class="text-sm text-gray-600">If Permanent Address is outside Belabo</span>

                <!-- Radio buttons -->
                <div class="flex gap-6 mt-3 mb-4">
                    <label class="flex items-center gap-2">
                        <input type="radio" name="guardian_type" value="1"  class="h-4 w-4 text-blue-600"  @if ($hasMembership) {{ $membership->guardian_type == 1 ? 'checked' : '' }} disabled @endif>
                        <span>Husband</span>
                    </label>
                    <label class="flex items-center gap-2">
                        <input type="radio" name="guardian_type" value="2" class="h-4 w-4 text-blue-600"  @if ($hasMembership) {{ $membership->guardian_type == 2 ? 'checked' : '' }} disabled @endif>
                        <span>Father</span>
                    </label>
                </div>

                <!-- Guardian Mobile (full width) -->
                <div class="mb-4 ">
                    <label class="mb-1.5 block font-semibold required">Guardian Mobile:</label>
                    <input name="guardian_phone" 
                        class="w-full p-2 border border-gray-300 rounded" 
                        type="text"
                        required 
                        placeholder="Enter Guardian Mobile Number"
                        @if ($hasMembership) value="{{ $membership->guardian_phone }}" disabled @endif />
                </div>

                <h2 class="pb-2 text-lg font-bold">
                Present Address Verification
                </h2>

                <!-- Document Type & Upload Document (side by side col-6) -->
                <div class="flex gap-4 mb-4">
                    <!-- Document Type -->
                    <div class="flex-1 min-w-0">
                        <label class="mb-1.5 block required">Document Type:</label>
                        <select name="present_address_doc_type" class="w-full p-2 border border-gray-300 rounded" required>
                            <option value="">Select Document</option>
                            <option value="Cuurent Bill" {{ (isset($membership) && $membership->present_address_doc_type == 'Cuurent Bill') ? 'selected' : '' }}>
                                Cuurent Bill
                            </option>
                            <option value="Citizen Certificate" {{ (isset($membership) && $membership->present_address_doc_type == 'Citizen Certificate') ? 'selected' : '' }}>
                                Citizen Certificate
                            </option>
                            <option value="Water Bill Certificate" {{ (isset($membership) && $membership->present_address_doc_type == 'Water Bill Certificate') ? 'selected' : '' }}>
                                Water Bill Certificate
                            </option>
                        </select>
                    </div>

                    <!-- Upload Document -->
                    <div class="flex-1 min-w-0">
                        <label class="mb-1.5 block required">Upload Document:</label>
                        <input type="file" 
                            name="present_address_doc" 
                            class="w-full p-2 border border-gray-300 rounded" 
                            required />
                    </div>
                </div>

            </div>
        </div>

        <div class="flex gap-4 mb-4">
            <!-- Gender Identity -->
            <div class="flex-1 min-w-0">
                <label class="mb-1.5 block font-semibold required">Gender :</label>
                <div class="flex items-center space-x-4">
                    <label class="flex items-center">
                        <input class="mr-2" name="gender" type="radio" value="Male"
                            @if ($hasMembership) {{ $membership->gender == 'Male' ? 'checked' : '' }} disabled @endif
                            required />
                        Male
                    </label>
                    <label class="flex items-center">
                        <input class="mr-2" name="gender" type="radio" value="Female"
                            @if ($hasMembership) {{ $membership->gender == 'Female' ? 'checked' : '' }} disabled @endif
                            required />
                        Female
                    </label>
                </div>
            </div>

            <!-- Upload Document -->
            <div class="flex-1 min-w-0">
                <label class="mb-1.5 block ">Upload Photo</label>
                <input type="file" 
                    name="photo" 
                    class="w-full p-2 border border-gray-300 rounded" 
                    required />
            </div>
        </div>


        <div class="mb-6">
            <div class="flex items-center space-x-4">
                <label class="mb-1.5 flex items-center">
                    <input id="agreeCheckbox" class="mr-2" type="checkbox" />
                    আমি প্রদত্ত তথ্য সঠিক প্রদান করেছি। ভুল প্রমাণিত হলে &nbsp;
                    <span style="color:red"> কর্তৃপক্ষ প্রয়োজনীয় ব্যবস্থা নিতে পারবে।</span>
                </label>
            </div>
        </div>

        {{--@if ($membership && $membership->expense_id)
            @if (!$membership->expense->is_verified)--}}
        @if ($membership)
                <button id="submitBtn" type="submit"
                    class="mb-6 text-white font-semibold text-2xl px-10 py-2 w-45 h-14 rounded shadow-inner shadow-white/50 
                        transition-all duration-300 ease-in-out
                        bg-gradient-to-t from-green-800 to-green-600 
                        hover:shadow-[4px_4px_6px_rgba(255,255,255,0.5),-4px_-4px_6px_rgba(116,125,136,0.5),inset_-4px_-4px_6px_rgba(255,255,255,0.2),inset_4px_4px_6px_rgba(0,0,0,0.4)]
                        disabled:from-gray-400 disabled:to-gray-500 disabled:cursor-not-allowed disabled:shadow-none"
                    disabled>
                    Update
                </button>
            {{--@endif--}}
        @else
            <button id="submitBtn" type="submit"
                class="text-white font-semibold text-2xl px-10 py-2 w-45 h-14 rounded shadow-inner shadow-white/50 
                    transition-all duration-300 ease-in-out
                    bg-gradient-to-t from-green-800 to-green-600 
                    hover:shadow-[4px_4px_6px_rgba(255,255,255,0.5),-4px_-4px_6px_rgba(116,125,136,0.5),inset_-4px_-4px_6px_rgba(255,255,255,0.2),inset_4px_4px_6px_rgba(0,0,0,0.4)]
                    disabled:from-gray-400 disabled:to-gray-500 disabled:cursor-not-allowed disabled:shadow-none"
                disabled>
                Save
            </button>
        @endif
    </form>

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
                            membershipFee.value = {{ $appSettings->limited_company_fee }};
                        } else if (radio.value === 'Proprietorship') {
                            membershipFee.value = {{ $appSettings->proprietorship_fee }};
                        } else if (radio.value === 'Foreign Joint Venture') {
                            membershipFee.value = {{ $appSettings->foreign_joint_venture_fee }};
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

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const checkbox = document.getElementById("agreeCheckbox");
        const button = document.getElementById("submitBtn");

        // toggle button enable/disable
        checkbox.addEventListener("change", function () {
            button.disabled = !this.checked;
        });
    });
</script>
</x-app-layout>
