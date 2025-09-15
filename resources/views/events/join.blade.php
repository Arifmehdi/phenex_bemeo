@php
    $appSettings = app(\App\Settings\AppSettings::class);
@endphp

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Event Registration Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        bengali: ['"Noto Sans Bengali"', 'sans-serif'],
                    }
                }
            }
        }
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Bengali&display=swap" rel="stylesheet">
</head>

<body
    class="flex items-center justify-center min-h-screen p-4 bg-gradient-to-tr from-indigo-300 via-blue-200 to-pink-200 font-bengali">

    <div class="w-full max-w-4xl p-10 shadow-2xl bg-white/90 backdrop-blur-md rounded-3xl">
        <h2 class="mb-8 text-4xl font-extrabold text-center text-indigo-700">📋 Event Registration Form</h2>

        <form id="eventForm" class="space-y-8" enctype="multipart/form-data">
            <input type="hidden" id="is_free" name="is_free" value="{{ $event->is_free }}">
            <div id="members" class="space-y-8">
                <div
                    class="relative p-8 transition bg-white border-l-4 border-indigo-400 shadow-md member rounded-2xl group hover:shadow-xl">
                    <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
                        <div>
                            <label class="block font-semibold text-gray-700">Name</label>
                            <input type="text" name="name[]" required placeholder="Enter your name"
                                class="w-full px-5 py-3 mt-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400">
                        </div>
                        <div>
                            <label class="block font-semibold text-gray-700">Age</label>
                            <input type="number" name="age[]" min="0" required placeholder="Enter your age"
                                class="w-full px-5 py-3 mt-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400">
                        </div>
                        <div>
                            <label class="block font-semibold text-gray-700">Relation</label>
                            <select name="relation[]" required
                                class="w-full px-5 py-3 mt-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400">
                                <option value="">Select relation</option>

                                <!-- ব্যক্তিগত সম্পর্ক -->
                                <option value="Father">Father</option>
                                <option value="Mother">Mother</option>
                                <option value="Brother">Brother</option>
                                <option value="Sister">Sister</option>
                                <option value="Spouse">Spouse</option>
                                <option value="Son">Son</option>
                                <option value="Daughter">Daughter</option>
                                <option value="Uncle">Uncle</option>
                                <option value="Aunt">Aunt</option>
                                <option value="Nephew">Nephew</option>
                                <option value="Niece">Niece</option>
                                <option value="Grandfather">Grandfather</option>
                                <option value="Grandmother">Grandmother</option>
                                <option value="Cousin">Cousin</option>
                                <option value="Guardian">Guardian</option>

                                <!-- পেশাগত সম্পর্ক -->
                                <option value="Employer">Employer</option>
                                <option value="Employee">Employee</option>
                                <option value="Manager">Manager</option>
                                <option value="Supervisor">Supervisor</option>
                                <option value="Colleague">Colleague</option>
                                <option value="Business Partner">Business Partner</option>
                                <option value="Client">Client</option>
                                <option value="Mentor">Mentor</option>
                                <option value="Intern">Intern</option>
                                <option value="Vendor">Vendor</option>

                                <!-- সামাজিক পরিচয় -->
                                <option value="Friend">Friend</option>
                                <option value="Neighbor">Neighbor</option>
                                <option value="Teacher">Teacher</option>
                                <option value="Student">Student</option>
                                <option value="Landlord">Landlord</option>
                                <option value="Tenant">Tenant</option>
                                <option value="Acquaintance">Acquaintance</option>
                                <option value="Well-wisher">Well-wisher</option>

                                <!-- অন্যান্য -->
                                <option value="Caregiver">Caregiver</option>
                                <option value="Legal Guardian">Legal Guardian</option>
                                <option value="Other">Other</option>
                            </select>

                        </div>
                        <div>
                            <label class="block font-semibold text-gray-700">Upload Photo</label>
                            <label
                                class="flex flex-col items-center justify-center px-5 py-5 mt-2 text-white transition bg-indigo-500 rounded-lg cursor-pointer hover:bg-indigo-600">
                                📸 Select File
                                <input type="file" name="photo[]" accept="image/*" onchange="previewImage(event, this)"
                                    required class="hidden">
                                <img src="" alt="Photo Preview"
                                    class="hidden object-cover w-24 h-24 mt-3 rounded-full preview-img">
                            </label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="flex flex-wrap justify-center gap-6">
                <button type="button" onclick="addMember()"
                    class="flex items-center gap-2 px-6 py-3 font-semibold text-white transition bg-green-500 rounded-lg shadow hover:bg-green-600">
                    ➕ Add Member
                </button>
                @if ($event->is_free == 0)
                    <button type="button" onclick="calculateCost()"
                        class="flex items-center gap-2 px-6 py-3 font-semibold text-white transition bg-blue-600 rounded-lg shadow hover:bg-blue-700">
                        💰 Calculate
                    </button>
                @else
                    <button type="button"
                        class="flex items-center gap-2 px-6 py-3 font-semibold text-white transition bg-gray-600 rounded-lg shadow hover:bg-gray-700">
                        Free Event
                    </button>
                @endif

            </div>

            <div id="totalCost" class="text-2xl font-bold text-center text-green-700"></div>

            <button type="button" onclick="submitForm({{ $event->id }})"
                class="w-full py-4 mt-8 text-xl font-bold text-white transition rounded-lg shadow-lg bg-emerald-600 hover:bg-emerald-700">
                ✅ Submit
            </button>
        </form>
    </div>

    <div id="loadingSpinner" class="fixed inset-0 flex items-center justify-center hidden bg-gray-500/50">
        <div class="w-16 h-16 border-8 border-t-8 border-gray-200 border-solid rounded-full animate-spin"></div>
    </div>

    <div id="modalPopup" class="fixed inset-0 flex items-center justify-center hidden bg-gray-500/70">
        <div class="p-6 text-center bg-white rounded-lg w-96">
            <h3 class="text-2xl font-semibold text-indigo-600">Form Submitted!</h3>
            <p class="mt-4 text-gray-700">Thank you! Your form has been successfully submitted.</p>
            <button onclick="closeModal()"
                class="px-6 py-2 mt-4 text-white transition bg-green-600 rounded-lg hover:bg-green-700">
                OK
            </button>
        </div>
    </div>

    <script>
        function addMember() {
            const index = document.querySelectorAll('.member').length + 1;
            const memberDiv = document.createElement('div');
            memberDiv.className =
                'member bg-white border-l-4 border-indigo-400 p-8 rounded-2xl shadow-md relative group hover:shadow-xl transition mt-6';
            memberDiv.innerHTML = `
        <button type="button"
          onclick="this.parentElement.remove()"
          class="absolute hidden text-2xl font-bold text-red-500 transition top-4 right-4 hover:text-red-700 group-hover:block">
          ✖
        </button>
        <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
          <div>
            <label class="block font-semibold text-gray-700">Name</label>
            <input type="text" name="name[]" required placeholder="Enter your name"
              class="w-full px-5 py-3 mt-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400">
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Age</label>
            <input type="number" name="age[]" min="0" required placeholder="Enter your age"
              class="w-full px-5 py-3 mt-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400">
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Relation</label>
            <select name="relation[]" required
              class="w-full px-5 py-3 mt-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400">
              <option value="">Select relation</option>
                   <!-- ব্যক্তিগত সম্পর্ক -->
                                <option value="Father">Father</option>
                                <option value="Mother">Mother</option>
                                <option value="Brother">Brother</option>
                                <option value="Sister">Sister</option>
                                <option value="Spouse">Spouse</option>
                                <option value="Son">Son</option>
                                <option value="Daughter">Daughter</option>
                                <option value="Uncle">Uncle</option>
                                <option value="Aunt">Aunt</option>
                                <option value="Nephew">Nephew</option>
                                <option value="Niece">Niece</option>
                                <option value="Grandfather">Grandfather</option>
                                <option value="Grandmother">Grandmother</option>
                                <option value="Cousin">Cousin</option>
                                <option value="Guardian">Guardian</option>

                                <!-- পেশাগত সম্পর্ক -->
                                <option value="Employer">Employer</option>
                                <option value="Employee">Employee</option>
                                <option value="Manager">Manager</option>
                                <option value="Supervisor">Supervisor</option>
                                <option value="Colleague">Colleague</option>
                                <option value="Business Partner">Business Partner</option>
                                <option value="Client">Client</option>
                                <option value="Mentor">Mentor</option>
                                <option value="Intern">Intern</option>
                                <option value="Vendor">Vendor</option>

                                <!-- সামাজিক পরিচয় -->
                                <option value="Friend">Friend</option>
                                <option value="Neighbor">Neighbor</option>
                                <option value="Teacher">Teacher</option>
                                <option value="Student">Student</option>
                                <option value="Landlord">Landlord</option>
                                <option value="Tenant">Tenant</option>
                                <option value="Acquaintance">Acquaintance</option>
                                <option value="Well-wisher">Well-wisher</option>

                                <!-- অন্যান্য -->
                                <option value="Caregiver">Caregiver</option>
                                <option value="Legal Guardian">Legal Guardian</option>
                                <option value="Other">Other</option>
            </select>
          </div>
          <div>
            <label class="block font-semibold text-gray-700">Upload Photo</label>
            <label class="flex flex-col items-center justify-center px-5 py-5 mt-2 text-white transition bg-indigo-500 rounded-lg cursor-pointer hover:bg-indigo-600">
              📸 Select File
              <input type="file" name="photo[]" accept="image/*" onchange="previewImage(event, this)" required class="hidden">
              <img src="" alt="Photo Preview" class="hidden object-cover w-24 h-24 mt-3 rounded-full preview-img">
            </label>
          </div>
        </div>
      `;
            document.getElementById('members').appendChild(memberDiv);
        }

        function previewImage(event, input) {
            const preview = input.parentElement.querySelector('.preview-img');
            preview.src = URL.createObjectURL(event.target.files[0]);
            preview.classList.remove('hidden');
        }

        function calculateCost() {
            const nameInputs = document.getElementsByName('name[]');
            const ageInputs = document.getElementsByName('age[]');
            const relationInputs = document.getElementsByName('relation[]');
            let valid = true;

            for (let i = 0; i < nameInputs.length; i++) {
                if (nameInputs[i].value.trim() === '' || ageInputs[i].value.trim() === '' || relationInputs[i].value
                    .trim() === '') {
                    valid = false;
                    break;
                }
            }

            if (!valid) {
                alert('❗ Please fill all the information first!');
                return;
            }

            let total = 0;
            for (let i = 0; i < ageInputs.length; i++) {
                const age = parseInt(ageInputs[i].value);
                total += (age < 10) ? {{ $appSettings->age_1_to_9 }} : {{ $appSettings->age_10_up }};
            }
            document.getElementById('totalCost').textContent = `Total Amount: ${total} Taka`;
        }

        function submitForm(eventId) {
            document.getElementById('loadingSpinner').classList.remove('hidden');

            const form = document.getElementById('eventForm');
            const nameInputs = document.getElementsByName('name[]');
            const is_free = document.getElementById('is_free');
            const ageInputs = document.getElementsByName('age[]');
            const relationInputs = document.getElementsByName('relation[]');
            const fileInputs = document.getElementsByName('photo[]');
            let valid = true;

            for (let i = 0; i < nameInputs.length; i++) {
                if (
                    nameInputs[i].value.trim() === '' ||
                    ageInputs[i].value.trim() === '' ||
                    relationInputs[i].value.trim() === ''
                ) {
                    valid = false;
                    break;
                }
            }

            if (!valid) {
                alert('❗ Please fill all the information first!');
                document.getElementById('loadingSpinner').classList.add('hidden');
                return;
            }

            const formData = new FormData();
            formData.append('is_free', is_free.value);

            // Append name, age, relation
            for (let i = 0; i < nameInputs.length; i++) {
                formData.append('names[]', nameInputs[i].value);
                formData.append('ages[]', ageInputs[i].value);
                formData.append('relations[]', relationInputs[i].value);

                // Append each file if selected
                if (fileInputs[i].files[0]) {
                    formData.append('photo[]', fileInputs[i].files[0]);
                } else {
                    formData.append('photo[]', null);
                }
            }

            // CSRF token
            const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            fetch(`/events/${eventId}/join`, {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                },
                body: formData
            })
                .then(response => {
                    if (!response.ok) throw new Error('Something went wrong!');
                    return response.json();
                })
                .then(data => {
                    document.getElementById('eventForm').reset();
                    document.getElementById('modalPopup').classList.remove('hidden');
                    window.location = '/dashboard';
                })
                .catch(error => {
                    alert('Error submitting the form.');
                    console.error(error);
                })
                .finally(() => {
                    document.getElementById('loadingSpinner').classList.add('hidden');
                });
        }


        function closeModal() {
            document.getElementById('modalPopup').classList.add('hidden');
        }
    </script>

</body>

</html>