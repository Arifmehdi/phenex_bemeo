<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Short Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="min-h-screen py-10 bg-gradient-to-r from-indigo-100 via-purple-100 to-pink-100">

    <!-- Profile Section -->
    <div class="max-w-5xl px-6 py-8 mx-auto overflow-hidden bg-white shadow-2xl">
        <div class="grid items-center grid-cols-1 gap-6 md:grid-cols-3">

            <!-- Profile Picture -->
            <div class="flex justify-center">
                <img src="/storage/{{ $membership->director_photo }}" alt="My Photo"
                    class="object-cover w-40 h-40 border-4 border-white rounded-full shadow-lg" />
            </div>

            <!-- Personal Details -->
            <div class="md:col-span-2">
                <h1 class="text-3xl font-extrabold text-purple-700">{{ $membership->director_name }}</h1>
                <p class="mt-1 text-lg font-medium text-purple-500">{{ $membership->company_name }}</p>

                <div class="mt-4 space-y-1 text-sm text-gray-600">
                    <p><span class="font-semibold">📧 Email:</span> {{ $membership->email }}</p>
                    <p><span class="font-semibold">📱 Phone:</span> {{ $membership->phone }}</p>
                    <p><span class="font-semibold">📍 Location:</span> {{ $membership->address }}</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Portfolio Section -->
    <div class="max-w-5xl p-6 mx-auto bg-white shadow-xl">
        <h2 class="pb-2 mb-4 text-2xl font-bold text-indigo-700 border-b">🎨 Nomination Certificate</h2>
        <div class="grid grid-cols-1 gap-6 sm:grid-cols-2 md:grid-cols-3">
            <div class="p-4 transition rounded-lg shadow bg-indigo-50 hover:shadow-md">
                <img src="/storage/{{ $membership->nomination_certificate }}" alt="Project 1"
                    class="object-cover w-full h-32 mb-2 rounded-md" />
                <p class="font-semibold text-center text-indigo-700">Nomination Certificate</p>
            </div>
        </div>
    </div>

    @if (count($membership->factory_photos))
        <div class="max-w-5xl p-6 mx-auto bg-white shadow-xl">
            <h2 class="pb-2 mb-4 text-2xl font-bold text-indigo-700 border-b">🎨 My Factory Image</h2>
            <div class="grid grid-cols-1 gap-6 sm:grid-cols-2 md:grid-cols-3">
                @foreach ($membership->factory_photos as $k => $p)
                    <div class="p-4 transition rounded-lg shadow bg-indigo-50 hover:shadow-md">
                        <img src="/storage/{{ $p }}" alt="Project 1"
                            class="object-cover w-full h-32 mb-2 rounded-md" />
                        <p class="font-semibold text-center text-indigo-700">Photo {{ $k }}</p>
                    </div>
                @endforeach
            </div>
        </div>
    @endif
    
    <div class="max-w-5xl p-6 mx-auto bg-white shadow-xl">
        <h2 class="pb-2 mb-4 text-2xl font-bold text-indigo-700 border-b">My Factory Details</h2>
        <div class="grid grid-cols-1 gap-6 sm:grid-cols-2 md:grid-cols-3">
            {{ $membership->remarks }}
        </div>
    </div>

</body>

</html>
