<x-app-layout>
    <x-slot name="header">
        <h2 class="text-xl font-semibold leading-tight text-gray-800">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="overflow-hidden bg-white shadow-sm sm:rounded-lg">

                @php
                    $eventJoinedCompany = App\Models\EventJoinedCompany::where('user_id', auth()->user()->id)->get();
                @endphp

                @if (count($eventJoinedCompany))
                    <div class="p-6 text-3xl font-bold text-gray-900 text-green-500">
                        Joined Events
                    </div>
                @endif

                @foreach ($eventJoinedCompany as $joinedEvent)
                    <div class="p-6 text-gray-900">

                        <div class="overflow-x-auto">
                            <table class="min-w-full text-sm text-left text-gray-700 border border-gray-300 rounded-lg">
                                <thead class="text-xs font-semibold text-gray-900 uppercase bg-gray-100">
                                    <tr>
                                        <th class="px-4 py-3 border-b">Event Name</th>
                                        <th class="px-4 py-3 border-b">Total Joined Member</th>
                                        <th class="px-4 py-3 border-b">Amount</th>
                                        <th class="px-4 py-3 border-b">Payment Status</th>
                                        <th class="px-4 py-3 border-b">Payment Review</th>
                                        <th class="px-4 py-3 border-b">Tokens</th>
                                        <th class="px-4 py-3 border-b">Pay</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white">
                                    <tr class="transition-colors hover:bg-gray-50">
                                        <td class="px-4 py-3 border-b">{{ $joinedEvent->event->title }}</td>
                                        <td class="px-4 py-3 border-b">
                                            {{ $joinedEvent->eventMembers()->count() }}
                                        </td>
                                        <td class="px-4 py-3 border-b">{{ $joinedEvent->amount }}</td>
                                        <td class="px-4 py-3 border-b">
                                            <span
                                                class="inline-block px-2 py-1 text-xs font-medium rounded 
                        {{ $joinedEvent->paid ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700' }}">
                                                {{ $joinedEvent->paid ? 'Paid' : 'Unpaid' }}
                                            </span>
                                        </td>
                                        <td class="px-4 py-3 border-b">
                                            @if ($joinedEvent->expense_id)
                                                @if ($joinedEvent->expense->is_verified)
                                                    <span class="font-medium text-green-600">Verified</span>
                                                @else
                                                    <span class="font-medium text-yellow-600">Not Verified</span>
                                                @endif
                                            @else
                                                <span class="text-red-600">Please pay to the bank account</span>
                                            @endif
                                        <td class="px-4 py-3 text-blue-700 border-b">
                                            @if ($joinedEvent->paid)
                                                <a
                                                    href="/events/{{ $joinedEvent->event->id }}/dowenload-token">Dowenload</a>
                                            @endif
                                        </td>
                                        <td class="px-4 py-3 text-blue-700 border-b">
                                            @if ($joinedEvent->paid)
                                                <a href="{{ route('events.pay', $joinedEvent->id) }}">Pay Now</a>
                                            @else
                                                <span class="text-gray-400">Wait for Approval</span>
                                            @endif
                                        </td>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>


                    </div>
                @endforeach

            </div>
        </div>
    </div>
</x-app-layout>
