<x-app-layout>
    <div class="container px-4 py-8 mx-auto">
        <div class="flex items-center justify-between mb-6">
            <h1 class="text-2xl font-semibold">
                @auth
                    Your Notices
                @else
                    Active Notices
                @endauth
            </h1>
            @auth
                <a href="{{ route('notices.create') }}"
                    class="px-4 py-2 font-bold text-white bg-blue-500 rounded hover:bg-blue-700">
                    Create New Notice
                </a>
            @endauth
        </div>

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

        @if ($notices->count() > 0)
            <div class="grid grid-cols-1 gap-6 md:grid-cols-2 lg:grid-cols-3">
                @foreach ($notices as $notice)
                    <div class="overflow-hidden bg-white rounded-lg shadow-md">
                        @if ($notice->image)
                            <img src="{{ Storage::url($notice->image) }}" alt="{{ $notice->title }}"
                                class="object-cover w-full h-48">
                        @endif
                        <div class="p-6">
                            <h2 class="mb-2 text-xl font-semibold">{{ $notice->title }}</h2>
                            <p class="mb-1 text-sm text-gray-700">
                                {!! Str::limit(strip_tags($notice->description), 150) !!}
                            </p>
                            <p class="mb-3 text-xs text-gray-500">
                                Posted on: {{ $notice->created_at->format('M d, Y') }}
                                @if ($notice->start_date)
                                    | Starts: {{ $notice->start_date->format('M d, Y') }}
                                @endif
                                @if ($notice->end_date)
                                    | Ends: {{ $notice->end_date->format('M d, Y') }}
                                @endif
                            </p>
                            <span
                                class="px-2 py-1 text-xs font-semibold rounded-full {{ $notice->is_active ? 'bg-green-200 text-green-800' : 'bg-red-200 text-red-800' }}">
                                {{ $notice->is_active ? 'Active' : 'Inactive' }}
                            </span>
                            {{-- Add link to view full notice if you have a show page --}}
                            {{-- <a href="{{ route('notices.show', $notice) }}" class="inline-block mt-2 text-blue-500 hover:underline">Read More</a> --}}
                            <form action="{{ route('notices.destroy', $notice->id) }}" method="post">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="inline-block mt-2 text-red-500 hover:underline">
                                    Delete Notice
                                </button>
                            </form>
                        </div>
                    </div>
                @endforeach
            </div>
        @else
            <p class="text-gray-700">No notices found.</p>
        @endif
    </div>
</x-app-layout>
