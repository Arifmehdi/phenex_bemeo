<x-app-layout>

    <div class="container px-4 py-8 mx-auto">
        <h1 class="mb-6 text-2xl font-semibold">Create New Notice</h1>

        @if (session('success'))
            <div class="relative px-4 py-3 mb-4 text-green-700 bg-green-100 border border-green-400 rounded"
                role="alert">
                <strong class="font-bold">Success!</strong>
                <span class="block sm:inline">{{ session('success') }}</span>
            </div>
        @endif

        @if (session('error'))
            <div class="relative px-4 py-3 mb-4 text-red-700 bg-red-100 border border-red-400 rounded" role="alert">
                <strong class="font-bold">Error!</strong>
                <span class="block sm:inline">{{ session('error') }}</span>
            </div>
        @endif

        @if ($errors->any())
            <div class="relative px-4 py-3 mb-4 text-red-700 bg-red-100 border border-red-400 rounded" role="alert">
                <strong class="font-bold">Please fix the following errors:</strong>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('notices.store') }}" method="POST" enctype="multipart/form-data"
            class="px-8 pt-6 pb-8 mb-4 bg-white rounded shadow-md">
            @csrf

            <div class="mb-4">
                <label class="block mb-2 text-sm font-bold text-gray-700" for="title">
                    Title <span class="text-red-500">*</span>
                </label>
                <input
                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline @error('title') border-red-500 @enderror"
                    id="title" name="title" type="text" placeholder="Notice Title" value="{{ old('title') }}"
                    required>
                @error('title')
                    <p class="text-xs italic text-red-500">{{ $message }}</p>
                @enderror
            </div>

            <div class="mb-4">
                <label class="block mb-2 text-sm font-bold text-gray-700" for="description">
                    Description <span class="text-red-500">*</span>
                </label>
                <textarea
                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline @error('description') border-red-500 @enderror"
                    id="description" name="description" rows="5" placeholder="Notice Description" required>{{ old('description') }}</textarea>
                @error('description')
                    <p class="text-xs italic text-red-500">{{ $message }}</p>
                @enderror
            </div>

            <div class="mb-4">
                <label class="block mb-2 text-sm font-bold text-gray-700" for="image">
                    Image (Optional)
                </label>
                <input
                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline @error('image') border-red-500 @enderror"
                    id="image" name="image" type="file" accept="image/png, image/jpeg, image/jpg">
                @error('image')
                    <p class="text-xs italic text-red-500">{{ $message }}</p>
                @enderror
            </div>

            <div class="flex items-center justify-between">
                <button
                    class="px-4 py-2 font-bold text-white bg-blue-500 rounded hover:bg-blue-700 focus:outline-none focus:shadow-outline"
                    type="submit">
                    Create Notice
                </button>
                <a href="{{ route('notices.index') }}"
                    class="inline-block text-sm font-bold text-blue-500 align-baseline hover:text-blue-800">
                    Cancel
                </a>
            </div>
        </form>
    </div>

</x-app-layout>
