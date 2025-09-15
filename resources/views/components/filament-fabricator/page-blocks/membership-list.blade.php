@aware(['page'])
<style>
    .member-card {
        margin-bottom: 20px;
    }

    .member-photo {
        width: 100%;
        height: auto;
        object-fit: cover;
    }
</style>

@php
    $members = \App\Models\Membership::where('is_active', true)->orderBy('company_name');

    if (request()->has('search')) {
        $members = $members->where(function ($query) {
            $search = request()->input('search');
            $query
                ->where('company_name', 'like', '%' . $search . '%')
                ->orWhere('membership_id', 'like', '%' . $search . '%');
        });
    }

    $members = $members->paginate(25);
@endphp

<div class="py-4">
    <div class="flex-wrap gap-3 d-flex" style="justify-content:center">

        @foreach ($members as $member)
            <div class="mb-3 card" style="max-width: 40rem;">
                <div class="row g-0">
                    <div class="col-md-6">
                        <img src="{{ Storage::url($member->director_photo) }}" class="img-fluid rounded-start"
                            alt="...">
                        <h6 class="mt-2 mb-0 text-center">{{ $member->director_name }}</h6>
                        
                        @if ($member->company_type == 'Limited Company')
                            <div class="text-center">Managing Director</div>
                        @elseif($member->company_type == 'Proprietorship')
                            <div class="text-center">Proprietor</div>
                        @else
                            <div class="text-center">Proprietor</div>
                        @endif
                    </div>
                    <div class="col-md-6">
                        <div class="card-body">
                            <h5 class="card-title">{{ $member->company_name }}</h5>
                            <p class="mb-0 card-text"><strong>Membership #:</strong>
                                {{ $member->membershipId() }}</p>
                            <p class="mb-0 card-text">{{ $member->address }}</p>
                            <p class="mb-0 card-text"><strong>Mobile:</strong> {{ $member->phone }}</p>
                            <p class="mb-0 card-text"><strong>Email:</strong>
                                <a href="mailto:{{ $member['email'] }}">{{ $member->email }}</a>
                            </p>
                            <p class="mb-0 card-text"><strong>Machine:</strong> {{ $member->machine_count }}</p>
                            <p class="mb-0 card-text"><strong><a
                                        href="{{ route('short-profile.index', $member->id) }}">Short
                                        Profile</a></strong></p>

                        </div>
                    </div>
                </div>
            </div>
        @endforeach

    </div>

    <div class="d-flex justify-content-between align-items-center mt-4 flex-wrap">
        <div class="mb-2 text-muted">
            Showing {{ $members->firstItem() }} to {{ $members->lastItem() }} of {{ $members->total() }} results
        </div>

        <nav aria-label="Page navigation example">
            {{ $members->withQueryString()->links('pagination::bootstrap-5') }}
        </nav>
    </div>

    {{-- <div class="d-flex justify-content-between align-items-center mt-4 flex-wrap">
        <div class="mb-2 text-muted">
            Showing {{ $members->firstItem() }} to {{ $members->lastItem() }} of {{ $members->total() }} results
        </div>

        <div>
            {{ $members->withQueryString()->links() }}
        </div>
    </div> --}}



</div>
