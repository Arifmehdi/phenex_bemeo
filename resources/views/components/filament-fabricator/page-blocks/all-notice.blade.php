@aware(['page'])
@props([
    'section_title' => 'All Notices',
    'notices' => null, // Populated by mutateData
])

<div class="py-5 bg-light">
    <div class="container" style="max-width: 900px;">
        <div class="mb-5 text-center">
            <h2 class="fw-bold">{{ $section_title }}</h2>
        </div>

        @if ($notices && $notices->count() > 0)
            <div class="row g-4">
                @foreach ($notices as $notice)
                    <div class="col-md-12">
                        <div class="border-0 shadow-sm card h-100">
                            <div class="row g-0">
                                @if ($notice->image)
                                    <div class="col-md-4">
                                        <img src="{{ Storage::url($notice->image) }}" width="200" class="img-fluid rounded-start" alt="{{ $notice->title ?? 'Notice Image' }}">
                                    </div>
                                @endif

                                <div class="{{ $notice->image ? 'col-md-8' : 'col-12' }}">
                                    <div class="card-body">
                                        <h5 class="mb-2 card-title">
                                            <a href="{{ $notice->link ?? '#' }}" 
                                               class="text-decoration-none link-primary" 
                                               {{ ($notice->is_external_link ?? false) && $notice->link ? 'target=_blank rel=noopener noreferrer' : '' }}>
                                                {{ $notice->title }}
                                            </a>
                                        </h5>
                                        <p class="mb-2 card-subtitle text-muted small">
                                            Published: {{ $notice->created_at->format('F d, Y') }}
                                            @if($notice->notice_date)
                                                <span class="mx-1">|</span>
                                                Event Date: {{ \Carbon\Carbon::parse($notice->notice_date)->format('F d, Y') }}
                                            @endif
                                        </p>
                                        <p class="card-text small">
                                            {!! Str::limit(strip_tags($notice->description), 250) !!}
                                        </p>
                                        
                                        @if ($notice->link || $notice->attachment)
                                            <div class="gap-3 mt-3 d-flex">
                                                @if ($notice->link)
                                                    <a href="{{ $notice->link }}" 
                                                       class="btn btn-sm btn-outline-primary" 
                                                       {{ ($notice->is_external_link ?? false) ? 'target=_blank rel=noopener noreferrer' : '' }}>
                                                        Read More →
                                                    </a>
                                                @endif
                                                @if ($notice->attachment)
                                                    <a href="{{ Storage::url($notice->attachment) }}" 
                                                       target="_blank" 
                                                       rel="noopener noreferrer" 
                                                       class="btn btn-sm btn-outline-secondary">
                                                        View Attachment
                                                    </a>
                                                @endif
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>

            <div class="mt-4">
                {{ $notices->links('pagination::bootstrap-5') }}
            </div>
        @else
            <div class="py-5 text-center">
                <div class="mb-3">
                    <i class="bi bi-folder-x text-secondary" style="font-size: 3rem;"></i>
                </div>
                <h5 class="text-muted">No notices found</h5>
                <p class="text-secondary">There are currently no active notices to display.</p>
            </div>
        @endif
    </div>
</div>
