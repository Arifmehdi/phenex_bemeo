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
                    <input type="radio" name="member_type" value="1"
                        class="h-4 w-4 text-blue-600 member-type"
                        @if ($hasMembership) {{ $membership->member_type == 1 ? 'checked' : '' }} disabled @else checked @endif>
                    <span>General Member</span>
                </label>
                <label class="flex items-center gap-2 mt-2">
                    <input type="radio" name="member_type" value="2"
                        class="h-4 w-4 text-blue-600 member-type"
                        @if ($hasMembership) {{ $membership->member_type == 2 ? 'checked' : '' }} disabled @endif>
                    <span>Existing Member</span>
                </label>
            </div>

            <!-- Fees -->
            <div class="flex gap-4 mb-4">
                <!-- Subscription Fee -->
                <div class="w-1/2">
                    <div class="flex items-center gap-2 flex-nowrap">
                        <span class="whitespace-nowrap">Subscription Fee</span>
                        <input type="hidden" name="subscription_fee" id="subscription_fee" value="{{ $appSettings->subscription_fee ?? 0 }}">
                        <input type="number"
                            class="p-2 border border-gray-300 rounded flex-1" 
                            value="{{ $appSettings->subscription_fee ?? 0 }}" disabled/>
                        <span>BDT</span>
                    </div>
                </div>

                <!-- New Fee -->
                <div class="w-1/2">
                    <div class="flex items-center gap-2 flex-nowrap">
                        <span class="whitespace-nowrap">New Fee</span>
                        <input type="hidden" name="new_fee" id="new_fee" value="{{ $appSettings->new_fee ?? 0 }}">
                        <input type="number"
                            class="p-2 border border-gray-300 rounded flex-1" 
                            value="{{ $appSettings->new_fee ?? 0 }}" disabled/>
                        <span>BDT</span>
                    </div>
                </div>
            </div>

            <!-- Total -->
            <div class="flex gap-4 mt-3 mb-3">
                <label class="mb-1.5 block font-semibold">
                    <strong>Total : <span id="totalfee">{{ ($appSettings->subscription_fee + $appSettings->new_fee) ?? 0 }}</span> BDT</strong>
                </label>
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
                    <select name="profession" id="" class="w-full p-2 border border-gray-300 rounded" @if ($hasMembership) value="{{ $membership->profession }}" disabled @endif  required >
                        <option value="">-- Select Profession --</option>
                        <option value="Agriculture" {{ (isset($membership) && $membership->profession == 'Agriculture') ? 'selected' : '' }}>Agriculture</option>
                        <option value="Govt. Service Holder" {{ (isset($membership) && $membership->profession == 'Govt. Service Holder') ? 'selected' : '' }}>Govt. Service Holder</option>
                        <option value="Business" {{ (isset($membership) && $membership->profession == 'Business') ? 'selected' : '' }}>Business</option>
                        <option value="Private Service Holder" {{ (isset($membership) && $membership->profession == 'Private Service Holder') ? 'selected' : '' }}>Private Service Holder</option>
                        <option value="Housewife" {{ (isset($membership) && $membership->profession == 'Housewife') ? 'selected' : '' }}>Housewife</option>
                        <option value="Student" {{ (isset($membership) && $membership->profession == 'Student') ? 'selected' : '' }}>Student</option>
                        <option value="Other" {{ (isset($membership) && $membership->profession == 'Other') ? 'selected' : '' }}>Other</option>
                    </select>
                </div>

                <div class="">
                    <label class="mb-1.5 block font-semibold ">Profession Doc Type</label>
                    <select name="profession_doc_type" id="" class="w-full p-2 border border-gray-300 rounded"  @if ($hasMembership) value="{{ $membership->profession_doc_type }}" disabled @endif required>
                        <option value="">-- Select Profession Doc Type--</option>
                        <option value="Visiting card" {{ (isset($membership) && $membership->profession_doc_type == 'Visiting card') ? 'selected' : '' }}>Visiting card</option>
                        <option value="Trade License" {{ (isset($membership) && $membership->profession_doc_type == 'Trade License') ? 'selected' : '' }}>Trade License</option>
                        <option value=" Student ID card" {{ (isset($membership) && $membership->profession_doc_type == ' Student ID card') ? 'selected' : '' }}> Student ID card</option>
                        <option value="Other" {{ (isset($membership) && $membership->profession_doc_type == 'Other') ? 'selected' : '' }}>Other</option>
                    </select>
                </div>
                <div>
                    <label class="mb-1.5 block font-semibold required">Upload Document</label>
                    <input type="file" name="profession_doc" class="w-full p-2 border border-gray-300 rounded" />
                </div>

                <div class="sm:col-span-2">
                    <label class="mb-1.5 block font-semibold required">Present Address</label>
                    <input type="text" name="present_address" class="w-full p-2 border border-gray-300 rounded" placeholder="Present Address"  @if ($hasMembership) value="{{ $membership->present_address }}" disabled @endif required/>
                </div>

                <div class="">
                    <label class="mb-1.5 block font-semibold ">Thana</label>
                    <select name="pre_thana" id="thana" class="w-full p-2 border border-gray-300 rounded" @if ($hasMembership) value="{{ $membership->pre_thana }}" disabled @endif required>
                        <option value="">-- Select Thana --</option>

                        <!-- Dhaka North -->
                        <optgroup label="Dhaka North">
                            <option value="Banani" {{ (isset($membership) && $membership->pre_thana == 'Banani') ? 'selected' : '' }}>Banani</option>
                            <option value="Bhashantek" {{ (isset($membership) && $membership->pre_thana == 'Bhashantek') ? 'selected' : '' }}>Bhashantek</option>
                            <option value="Bhatara" {{ (isset($membership) && $membership->pre_thana == 'Bhatara') ? 'selected' : '' }}>Bhatara</option>
                            <option value="Cantonment" {{ (isset($membership) && $membership->pre_thana == 'Cantonment') ? 'selected' : '' }}>Cantonment</option>
                            <option value="Darus Salam" {{ (isset($membership) && $membership->pre_thana == 'Darus Salam') ? 'selected' : '' }}>Darus Salam</option>
                            <option value="Gulshan" {{ (isset($membership) && $membership->pre_thana == 'Gulshan') ? 'selected' : '' }}>Gulshan</option>
                            <option value="Kafrul" {{ (isset($membership) && $membership->pre_thana == 'Kafrul') ? 'selected' : '' }}>Kafrul</option>
                            <option value="Khilkhet" {{ (isset($membership) && $membership->pre_thana == 'Khilkhet') ? 'selected' : '' }}>Khilkhet</option>
                            <option value="Mirpur" {{ (isset($membership) && $membership->pre_thana == 'Mirpur') ? 'selected' : '' }}>Mirpur</option>
                            <option value="Pallabi" {{ (isset($membership) && $membership->pre_thana == 'Pallabi') ? 'selected' : '' }}>Pallabi</option>
                            <option value="Tejgaon" {{ (isset($membership) && $membership->pre_thana == 'Tejgaon') ? 'selected' : '' }}>Tejgaon</option>
                            <option value="Tejgaon Industrial Area" {{ (isset($membership) && $membership->pre_thana == 'Tejgaon Industrial Area') ? 'selected' : '' }}>Tejgaon Industrial Area</option>
                            <option value="Uttara East" {{ (isset($membership) && $membership->pre_thana == 'Uttara East') ? 'selected' : '' }}>Uttara East</option>
                            <option value="Uttara West" {{ (isset($membership) && $membership->pre_thana == 'Uttara West') ? 'selected' : '' }}>Uttara West</option>
                        </optgroup>

                        <!-- Dhaka South -->
                        <optgroup label="Dhaka South">
                            <option value="Bangshal" {{ (isset($membership) && $membership->pre_thana == 'Bangshal') ? 'selected' : '' }}>Bangshal</option>
                            <option value="Chawkbazar" {{ (isset($membership) && $membership->pre_thana == 'Chawkbazar') ? 'selected' : '' }}>Chawkbazar</option>
                            <option value="Demra" {{ (isset($membership) && $membership->pre_thana == 'Demra') ? 'selected' : '' }}>Demra</option>
                            <option value="Gandaria" {{ (isset($membership) && $membership->pre_thana == 'Gandaria') ? 'selected' : '' }}>Gandaria</option>
                            <option value="Hazaribagh" {{ (isset($membership) && $membership->pre_thana == 'Hazaribagh') ? 'selected' : '' }}>Hazaribagh</option>
                            <option value="Jatrabari" {{ (isset($membership) && $membership->pre_thana == 'Jatrabari') ? 'selected' : '' }}>Jatrabari</option>
                            <option value="Kadamtali" {{ (isset($membership) && $membership->pre_thana == 'Kadamtali') ? 'selected' : '' }}>Kadamtali</option>
                            <option value="Kamrangirchar" {{ (isset($membership) && $membership->pre_thana == 'Kamrangirchar') ? 'selected' : '' }}>Kamrangirchar</option>
                            <option value="Kotwali" {{ (isset($membership) && $membership->pre_thana == 'Kotwali') ? 'selected' : '' }}>Kotwali</option>
                            <option value="Lalbagh" {{ (isset($membership) && $membership->pre_thana == 'Lalbagh') ? 'selected' : '' }}>Lalbagh</option>
                            <option value="Motijheel" {{ (isset($membership) && $membership->pre_thana == 'Motijheel') ? 'selected' : '' }}>Motijheel</option>
                            <option value="Mugda" {{ (isset($membership) && $membership->pre_thana == 'Mugda') ? 'selected' : '' }}>Mugda</option>
                            <option value="Paltan" {{ (isset($membership) && $membership->pre_thana == 'Paltan') ? 'selected' : '' }}>Paltan</option>
                            <option value="Ramna" {{ (isset($membership) && $membership->pre_thana == 'Ramna') ? 'selected' : '' }}>Ramna</option>
                            <option value="Sabujbagh" {{ (isset($membership) && $membership->pre_thana == 'Sabujbagh') ? 'selected' : '' }}>Sabujbagh</option>
                            <option value="Shahbagh" {{ (isset($membership) && $membership->pre_thana == 'Shahbagh') ? 'selected' : '' }}>Shahbagh</option>
                            <option value="Shyampur" {{ (isset($membership) && $membership->pre_thana == 'Shyampur') ? 'selected' : '' }}>Shyampur</option>
                            <option value="Sutrapur" {{ (isset($membership) && $membership->pre_thana == 'Sutrapur') ? 'selected' : '' }}>Sutrapur</option>
                            <option value="Wari" {{ (isset($membership) && $membership->pre_thana == 'Wari') ? 'selected' : '' }}>Wari</option>
                        </optgroup>

                        <option value="Other" {{ (isset($membership) && $membership->pre_thana == 'Other') ? 'selected' : '' }}>Other</option>
                    </select>
                </div>

                <div class="">
                    <label class="mb-1.5 block font-semibold ">Ward Number</label>
                    <select name="pre_ward" id="pre_ward" class="w-full p-2 border border-gray-300 rounded">
                        <option value="">--Select--</option>
                    </select>
                </div>
                <div class="sm:col-span-2">
                    <label class="mb-1.5 block font-semibold required">Parmanent Address</label>
                    <input type="text" name="permanent_address" class="w-full p-2 border border-gray-300 rounded" placeholder="Permanent Address"  @if ($hasMembership) value="{{ $membership->permanent_address }}" disabled @endif required/>
                </div>
                <div class="sm:col-span-2">
                    <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                        <!-- District -->
                        <div>
                            <label class="mb-1.5 block font-semibold required">District (Permanent)</label>
                            <select name="permanent_district" id="district" class="w-full p-2 border border-gray-300 rounded" @if ($hasMembership) value="{{ $membership->permanent_district }}" disabled @endif required>
                                <option value="">-- Select --</option>
                                <option value="Dhaka" {{ (isset($membership) && $membership->permanent_district == 'Dhaka') ? 'selected' : '' }} >Dhaka</option>
                                <option value="Belabo" {{ (isset($membership) && $membership->permanent_district == 'Belabo') ? 'selected' : '' }} >Belabo</option>
                            </select>
                        </div>
                        <!-- Thana / Union -->
                        <div>
                            <label class="mb-1.5 block font-semibold">Thana / Union (Permanent)</label>
                            <select name="permanent_thana" id="permanent_thana" class="w-full p-2 border border-gray-300 rounded" required>
                                <option value="">-- Select --</option>
                            </select>
                        </div>

                        <!-- Ward -->
                        <div>
                            <label class="mb-1.5 block font-semibold">Ward Number  (Permanent)</label>
                            <select name="permanent_ward" id="permanent_ward" class="w-full p-2 border border-gray-300 rounded">
                                <option value="">-- Select --</option>
                            </select>
                        </div>
                    </div>
            </div>

            <!-- Guardian details -->
            <div id="guardianSection" class="border border-gray-300 bg-gray-100 rounded-lg p-4 mt-3 sm:col-span-2 hidden">
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
                        <select name="g_present_address_doc_type" class="w-full p-2 border border-gray-300 rounded" required>
                            <option value="">Select Document</option>
                            <option value="Electric Bill" {{ (isset($membership) && $membership->g_present_address_doc_type == 'Electric Bill') ? 'selected' : '' }}>
                                Electric Bill
                            </option>
                            <option value="Water bill" {{ (isset($membership) && $membership->g_present_address_doc_type == 'Water bill') ? 'selected' : '' }}>
                                Water bill
                            </option>
                            <option value="House rent slip" {{ (isset($membership) && $membership->g_present_address_doc_type == 'House rent slip') ? 'selected' : '' }}>
                                House rent slip
                            </option>
                            <option value="Others" {{ (isset($membership) && $membership->g_present_address_doc_type == 'Others') ? 'selected' : '' }}>
                                Others
                            </option>
                        </select>
                    </div>

                    <!-- Upload Document -->
                    <div class="flex-1 min-w-0">
                        <label class="mb-1.5 block required">Upload Document:</label>
                        <input type="file" 
                            name="g_present_address_doc" 
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


        <div class="flex gap-4 mb-4">
            <!-- Payment Type -->
            <div class="flex-1 min-w-0">
                <label class="mb-1.5 block font-semibold required">Payment Type :</label>
                <div class="flex items-center space-x-4">
                    <label class="flex items-center">
                        <input class="mr-2 payment-type" name="payment_type" type="radio" value="Cash" {{ (isset($membership) && $membership->payment_type == 'Cash') ? 'checked' : '' }} required>
                        Cash
                    </label>
                    <label class="flex items-center">
                        <input class="mr-2 payment-type" name="payment_type" type="radio" value="Bkash" {{ (isset($membership) && $membership->payment_type == 'Bkash') ? 'checked' : '' }}  required>
                        Bkash
                    </label>
                </div>
            </div>

            <!-- Dynamic Payment Fields -->
            <div class="flex-1 min-w-0" id="payment-extra"></div>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
        $(document).ready(function() {
            const isActive = parseInt("{{ $membership->is_active ?? 0 }}"); // 0 or 1
            const $checkbox = $("#agreeCheckbox");
            const $button = $("#submitBtn");

            // Initially disable button
            $button.prop("disabled", true);

            // Listen to checkbox change
            $checkbox.on("change", function() {
                if ($(this).is(":checked") && isActive !== 1) {
                    $button.prop("disabled", false); // Enable button
                } else {
                    $button.prop("disabled", true);  // Keep disabled
                }
            });
        });

    // new fees change according to radio button
    $(document).ready(function(){
        $(function () {
            function calculateTotal() {
                let subscription = parseInt($("#subscription_fee").val()) || 0;
                let newFee = parseInt($("#new_fee").val()) || 0;
                let memberType = $("input[name='member_type']:checked").val();

                let total = (memberType == 1) ? (subscription + newFee) : subscription;
                $("#totalfee").text(total);
            }

            // On page load
            calculateTotal();

            // On radio button change
            $(".member-type").on("change", function () {
                calculateTotal();
            });
        });
    })
</script>
<script>
    const wards = {
        // Dhaka North
        "Banani": [18, 19, 20],
        "Bhashantek": [1, 2],
        "Bhatara": [1, 2, 3],
        "Cantonment": [1, 2],
        "Darus Salam": [1, 2, 3, 4],
        "Gulshan": [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17],
        "Kafrul": [1,2,3,4,5,6,7,8,9,10],
        "Khilkhet": [1,2,3,4,5,6],
        "Mirpur": [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
        "Pallabi": [1,2,3,4,5,6],
        "Tejgaon": [1,2,3,4,5,6],
        "Tejgaon Industrial Area": [1,2,3],
        "Uttara East": [1,2,3,4,5,6],
        "Uttara West": [1,2,3,4,5,6],

        // Dhaka South
        "Bangshal": [1,2,3,4,5,6],
        "Chawkbazar": [1,2,3],
        "Demra": [1,2,3,4],
        "Gandaria": [1,2,3,4],
        "Hazaribagh": [1,2,3],
        "Jatrabari": [1,2,3,4],
        "Kadamtali": [1,2],
        "Kamrangirchar": [1,2,3],
        "Kotwali": [1,2,3,4],
        "Lalbagh": [1,2,3,4],
        "Motijheel": [1,2,3,4],
        "Mugda": [1,2,3],
        "Paltan": [1,2,3,4],
        "Ramna": [1,2,3,4],
        "Sabujbagh": [1,2,3],
        "Shahbagh": [1,2,3],
        "Shyampur": [1,2,3],
        "Sutrapur": [1,2,3],
        "Wari": [1,2,3]
    };

    $('#thana').change(function() {
        const thana = $(this).val();
        const wardSelect = $('#pre_ward');
        wardSelect.empty().append('<option value="">--Select--</option>');

        if (wards[thana]) {
            wards[thana].forEach(w => {
                wardSelect.append('<option value="'+w+'">'+w+'</option>');
            });
        }
    });

    // Preselect ward if membership exists
    $(document).ready(function(){
        const selectedThana = $('#thana').val();
        const selectedWard = "{{ isset($membership) ? $membership->ward : '' }}";
        if(selectedThana && wards[selectedThana]) {
            const wardSelect = $('#pre_ward');
            wardSelect.empty().append('<option value="">--Select--</option>');
            wards[selectedThana].forEach(w => {
                const selected = (w == selectedWard) ? 'selected' : '';
                wardSelect.append('<option value="'+w+'" '+selected+'>'+w+'</option>');
            });
        }
    });
</script>
<script>
    const permanentWards = {
        // Dhaka
        "Banani": [18, 19, 20],
        "Bhashantek": [1, 2],
        "Bhatara": [1, 2, 3],
        "Cantonment": [1, 2],
        "Darus Salam": [1, 2, 3, 4],
        "Gulshan": [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17],
        "Kafrul": [1,2,3,4,5,6,7,8,9,10],
        "Khilkhet": [1,2,3,4,5,6],
        "Mirpur": [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
        "Pallabi": [1,2,3,4,5,6],
        "Tejgaon": [1,2,3,4,5,6],
        "Tejgaon Industrial Area": [1,2,3],
        "Uttara East": [1,2,3,4,5,6],
        "Uttara West": [1,2,3,4,5,6],
        "Bangshal": [1,2,3,4,5,6],
        "Chawkbazar": [1,2,3],
        "Demra": [1,2,3,4],
        "Gandaria": [1,2,3,4],
        "Hazaribagh": [1,2,3],
        "Jatrabari": [1,2,3,4],
        "Kadamtali": [1,2],
        "Kamrangirchar": [1,2,3],
        "Kotwali": [1,2,3,4],
        "Lalbagh": [1,2,3,4],
        "Motijheel": [1,2,3,4],
        "Mugda": [1,2,3],
        "Paltan": [1,2,3,4],
        "Ramna": [1,2,3,4],
        "Sabujbagh": [1,2,3],
        "Shahbagh": [1,2,3],
        "Shyampur": [1,2,3],
        "Sutrapur": [1,2,3],
        "Wari": [1,2,3],

        // Belabo Unions
        "Amlaba": [1,2,3,4,5,6,7,8,9],
        "Bajnaba": [1,2,3,4,5,6,7,8,9],
        "Belabo": [1,2,3,4,5,6,7,8,9],
        "Binnabaid": [1,2,3,4,5,6,7,8,9],
        "Char Uzilab": [1,2,3,4,5,6,7,8,9],
        "Narayanpur": [1,2,3,4,5,6,7,8,9],
        "Patuli": [1,2,3,4,5,6,7,8,9],
        "Sallabad": [1,2,3,4,5,6,7,8,9]
    };

        const belaboUnions = ["Amlaba","Bajnaba","Belabo","Binnabaid","Char Uzilab","Narayanpur","Patuli","Sallabad"];

        // Saved values from backend
        const savedDistrict = "{{ isset($membership) ? $membership->permanent_district : '' }}";
        const savedThana    = "{{ isset($membership) ? $membership->permanent_thana : '' }}";
        const savedWard     = "{{ isset($membership) ? $membership->permanent_ward : '' }}";

        $('#district').change(function () {
            const district = $(this).val();
            const thanaSelect = $('#permanent_thana');
            const wardSelect  = $('#permanent_ward');

            thanaSelect.empty().append('<option value="">-- Select --</option>');
            wardSelect.empty().append('<option value="">-- Select --</option>');

            let thanas = [];

            if (district === 'Dhaka') {
                thanas = Object.keys(permanentWards).filter(k => !belaboUnions.includes(k));
            } else if (district === 'Belabo') {
                thanas = belaboUnions;
            }

            // Populate thanas
            thanas.forEach(t => {
                const selected = (t === savedThana) ? 'selected' : '';
                thanaSelect.append('<option value="'+t+'" '+selected+'>'+t+'</option>');
            });

            // If we have a saved thana, populate wards immediately
            if (savedThana && permanentWards[savedThana]) {
                permanentWards[savedThana].forEach(w => {
                    const selected = (w == savedWard) ? 'selected' : '';
                    wardSelect.append('<option value="'+w+'" '+selected+'>'+w+'</option>');
                });
            }
        });

        // ✅ On page load, set district → thana → ward
        $(document).ready(function(){
            if (savedDistrict) {
                $('#district').val(savedDistrict).trigger('change');
            }
        });
        
// ✅ Correct selector (permanent_thana instead of thana)
$('#permanent_thana').change(function () {
    const thana = $(this).val();
    const wardSelect = $('#permanent_ward');
    wardSelect.empty().append('<option value="">-- Select --</option>');

    if (permanentWards[thana]) {
        permanentWards[thana].forEach(w => {
            wardSelect.append('<option value="'+w+'">'+w+'</option>');
        });
    }
});

// Preselect if editing membership
$(document).ready(function(){
    const selectedThana = $('#permanent_thana').val();
    const selectedWard = "{{ isset($membership) ? $membership->ward : '' }}";
    if(selectedThana && permanentWards[selectedThana]) {
        const wardSelect = $('#permanent_ward');
        wardSelect.empty().append('<option value="">--Select--</option>');
        permanentWards[selectedThana].forEach(w => {
            const selected = (w == selectedWard) ? 'selected' : '';
            wardSelect.append('<option value="'+w+'" '+selected+'>'+w+'</option>');
        });
    }
});

// hide guardian details section 
$('#district').change(function () {
    const district = $(this).val();

    if (district === 'Dhaka') {
        $('#guardianSection').removeClass('hidden');
        // Make guardian fields required
        $('#guardianSection').find('input,select').attr('required', true);
    } else {
        $('#guardianSection').addClass('hidden');
        // Remove required attribute to skip validation
        $('#guardianSection').find('input,select').removeAttr('required');
    }
});

// ✅ Run once on page load (for edit mode)
$(document).ready(function(){
    const district = $('#district').val();
    if (district === 'Dhaka') {
        $('#guardianSection').removeClass('hidden');
        $('#guardianSection').find('input,select').attr('required', true);
    } else {
        $('#guardianSection').addClass('hidden');
        $('#guardianSection').find('input,select').removeAttr('required');
    }
    

    function updatePaymentFields() {
        let type = $('input[name="payment_type"]:checked').val();
        let extraField = $("#payment-extra");
        extraField.empty();

        if(type === "Cash"){
            extraField.html(`
                <label class="mb-1.5 block font-semibold required">Receiver Name</label>
                <input type="text" name="payment_reciever" 
                       class="w-full p-2 border border-gray-300 rounded" 
                       required placeholder="Enter Receiver Name"
                       value="{{ $hasMembership && $membership->payment_type == 'Cash' ? $membership->payment_reciever : '' }}"
                       {{ $hasMembership ? 'disabled' : '' }}/>
            `);
        } 
        else if(type === "Bkash"){
            extraField.html(`
                <label class="mb-1.5 block font-semibold required">Bkash Payment</label>
                <div class="flex flex-col gap-2">
                    <span class="text-sm font-semibold text-green-700">Bkash Number: 017XXXXXXXX</span>
                    <input type="text" name="transaction_id" 
                           class="w-full p-2 border border-gray-300 rounded" 
                           required placeholder="Enter Transaction ID"
                           value="{{ $hasMembership && $membership->payment_type == 'Bkash' ? $membership->transaction_id : '' }}"
                           {{ $hasMembership ? 'disabled' : '' }}/>
                </div>
            `);
        }
    }

    // Run once on load
    updatePaymentFields();

    // Run on change
    $('input[name="payment_type"]').change(function(){
        updatePaymentFields();
    });
});



</script>
</x-app-layout>
