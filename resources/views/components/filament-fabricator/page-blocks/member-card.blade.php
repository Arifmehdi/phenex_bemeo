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

<div class="py-4 ">
    <div class="flex-wrap gap-3 d-flex" style="justify-content:center">

        @foreach ($members as $member)
            <div class="mb-3 card" style="max-width: 53rem;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="{{ Storage::url($member['photo']) }}" class="img-fluid rounded-start" alt="...">
                        <h6 class="mt-2 mb-0 text-center">{{ $member['proprietor_name'] }}</h6>
                        <div class="text-center">{{ $member['proprietor_title'] }}</div>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">{{ $member['company_name'] }}</h5>
                            <p class="mb-0 card-text"><strong>Membership #:</strong> {{ $member['membership_no'] }}</p>
                            <p class="mb-0 card-text">{{ $member['address'] }}</p>
                            <p class="mb-0 card-text"><strong>Mobile:</strong> {{ $member['mobile'] }}</p>
                            <p class="mb-0 card-text"><strong>Email:</strong>
                                <a href="mailto:{{ $member['email'] }}">{{ $member['email'] }}</a>
                            </p>
                            <p class="mb-0 card-text"><strong>Machine:</strong> {{ $member['machine'] }}</p>
                            <p class="mb-0 card-text"><strong>Brand:</strong> {{ $member['brand'] }}</p>
                            <p class="mb-0 card-text"><strong>Total Head:</strong> {{ $member['total_head'] }}</p>
                            <p class="mb-0 card-text"><strong>Colours:</strong> {{ $member['colours'] }}</p>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach


    </div>
</div>
