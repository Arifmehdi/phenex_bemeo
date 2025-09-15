<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>{{ $event->title }}</title>
    <style>
        @page {
            size: A4;
            margin: 30px;
        }

        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        thead {
            background-color: #4CAF50;
            color: white;
        }

        th,
        td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tfoot {
            background-color: #f1f1f1;
            font-weight: bold;
        }

        .profile-img {
            width: 120px;
            height: 120px;
        }
    </style>
</head>

<body>

    <h2>{{ $event->title }}</h2>

    <table>
        <thead>
            <tr>
                <th>M.ID</th>
                <th>Name</th>
                <th>Photo</th>
                <th>Relation</th>
                <th>Age</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($event->members()->where('approved', 1)->get() as $member)
                <tr>
                    <td>{{ $member->user?->membership?->membership_id }}</td>
                    <td>{{ $member->name }}</td>
                    <td>
                        @php
                            $imagePath = storage_path('app/public/' . $member->image);
                        @endphp

                        @if ($member->image && file_exists($imagePath) && is_file($imagePath))
                            @php
                                $imageData = base64_encode(file_get_contents($imagePath));
                                $src = 'data:' . mime_content_type($imagePath) . ';base64,' . $imageData;
                            @endphp
                            <img class="profile-img" src="{{ $src }}">
                        @else
                            <img class="profile-img" src="{{ public_path('assets/images/gallery/gallery-1-1.png') }}">
                        @endif
                    </td>
                    <td>{{ $member->relation }}</td>
                    <td>{{ $member->age }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

</body>

</html>
