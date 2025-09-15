<!DOCTYPE html>
<html>

<head>
    <style>
        @page {
            margin: 0px;
            size: 85.6mm 108mm;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
        }

        .card {
            width: 85.6mm;
            height: 108mm;
            box-sizing: border-box;
            background: red ;
        }
    </style>
</head>

<body>

    @foreach ($students as $student)
        <div class="card">
            <div class="front">
                <h4>{{ $student['name'] }}</h4>
                <p>ID: {{ $student['id'] }}</p>
                <p>Class: {{ $student['class'] }}</p>
                <img src="{{ public_path('images/' . $student['photo']) }}" alt="Photo">
            </div>
            <div class="back">
                <p>Institute: Your Name</p>
                <p>Address: Your Address</p>
                <p>Phone: 01XXXXXXXXX</p>
            </div>
        </div>
        {{-- <div style="page-break-after: always;"></div> --}}
    @endforeach

</body>

</html>
