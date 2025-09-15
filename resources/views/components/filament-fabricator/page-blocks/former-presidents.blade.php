@aware(['page'])

<style>
    .main-timeline {
        position: relative;
    }

    /* The central line */
    .main-timeline::after {
        content: '';
        position: absolute;
        width: 6px;
        background-color: #55c5cc;
        top: 0;
        bottom: 0;
        left: 50%;
        margin-left: -3px;
    }

    .timeline-item {
        padding: 10px 40px;
        position: relative;
        background-color: inherit;
        width: 50%;
    }

    /* The circle on the timeline */
    .timeline-item::after {
        content: '';
        position: absolute;
        width: 20px;
        height: 20px;
        right: -10px;
        background-color: white;
        border: 5px solid #55c5cc;
        top: 55px;
        border-radius: 50%;
        z-index: 1;
    }

    /* Left-aligned items */
    .timeline-item:nth-child(odd) {
        left: 0;
        padding-right: 70px;
    }

    /* Right-aligned items */
    .timeline-item:nth-child(even) {
        left: 50%;
        padding-left: 70px;
    }

    /* Arrow for left items */
    .timeline-item:nth-child(odd) .timeline-content::before {
        content: " ";
        height: 0;
        position: absolute;
        top: 60px;
        width: 0;
        z-index: 1;
        right: 30px;
        border: medium solid white;
        border-width: 10px 0 10px 10px;
        border-color: transparent transparent transparent #fff;
    }

    /* Arrow for right items */
    .timeline-item:nth-child(even) .timeline-content::before {
        content: " ";
        height: 0;
        position: absolute;
        top: 60px;
        width: 0;
        z-index: 1;
        left: 30px;
        border: medium solid white;
        border-width: 10px 10px 10px 0;
        border-color: transparent #fff transparent transparent;
    }


    .timeline-item:nth-child(even)::after {
        left: -10px;
    }

    .timeline-content {
        background-color: white;
        position: relative;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 10px;
        text-align: center;
    }

    .timeline-date-top {
        position: absolute;
        top: -35px;
        left: 50%;
        transform: translateX(-50%);
        background-color: #55c5cc;
        color: white;
        padding: 5px 15px;
        border-radius: 20px;
        font-size: 0.9rem;
        font-weight: 500;
        white-space: nowrap;
    }

    .content-inner {
        padding-top: 20px;
    }

    .timeline-img {
        width: 200px;
        height: 200px;
        border-radius: 50%;
        border: 3px solid #f1f1f1;
        margin-bottom: 10px;
    }

    .timeline-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: #333;
        margin-bottom: 5px;
    }

    .timeline-subtitle {
        font-size: 0.9rem;
        color: #666;
        margin: 0;
    }

    /* --- Mobile Responsive --- */
    @media screen and (max-width: 768px) {

        /* Move timeline to the left */
        .main-timeline::after {
            left: 31px;
        }

        .timeline-item {
            width: 100%;
            padding-left: 70px;
            padding-right: 25px;
        }

        /* All items on the right side */
        .timeline-item:nth-child(odd),
        .timeline-item:nth-child(even) {
            left: 0;
        }

        .timeline-item:nth-child(odd) {
            padding-right: 25px;
            /* reset padding */
        }

        /* Move circles to the left */
        .timeline-item::after {
            left: 21px;
        }

        .timeline-item:nth-child(even)::after {
            left: 21px;
            /* ensure even items also align */
        }

        /* Point arrows to the left */
        .timeline-content::before,
        .timeline-item:nth-child(even) .timeline-content::before,
        .timeline-item:nth-child(odd) .timeline-content::before {
            left: -10px;
            border-width: 10px 10px 10px 0;
            border-color: transparent #fff transparent transparent;
        }

        .timeline-date-top {
            font-size: 0.8rem;
            position: relative;
            transform: none;
            left: auto;
            top: auto;
            display: inline-block;
            margin-bottom: 15px;
        }

        .content-inner {
            padding-top: 0;
        }

        .timeline-content {
            text-align: left;
            display: flex;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .timeline-img {
            width: 150px;
            height: 150px;
            margin-bottom: 20px;
        }
    }
</style>

<div class="container py-5">
    <div class="main-timeline">

        @if (isset($presidents) && is_array($presidents))
            @foreach ($presidents as $president)
                <div class="timeline-item">
                    <div class="timeline-content">
                        <div class="timeline-date-top">{{ $president['time_period'] ?? '' }}</div>
                        <div class="content-inner">
                            @if (isset($president['image']))
                                <img src="{{ Storage::url($president['image']) }}" class="timeline-img"
                                    alt="{{ $president['name'] ?? 'President Image' }}">
                            @endif
                            <h5 class="timeline-title">{{ $president['name'] ?? 'President Name' }}</h5>
                            @if (isset($president['description']))
                                <p class="timeline-subtitle">{{ $president['description'] }}</p>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        @endif

    </div>
</div>
