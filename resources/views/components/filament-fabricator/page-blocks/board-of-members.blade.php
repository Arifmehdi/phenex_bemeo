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
            <div class="mb-3 card" style="max-width: 20rem;">

                <img src="{{ Storage::url($member['photo']) }}" class="img-fluid rounded-start" alt="...">
                <h6 class="mt-2 mb-0 text-center">{{ $member['proprietor_name'] }}</h6>
                <div class="text-center">{{ $member['proprietor_title'] }}</div>

            </div>
        @endforeach

    </div>
</div>
