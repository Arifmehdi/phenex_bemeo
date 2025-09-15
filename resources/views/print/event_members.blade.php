<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>{{ 'Event Members' }}</title>
    <style>
        @page {}

        body {
            font-family: DejaVu Sans, sans-serif;
            margin: 0;
            padding: 0;
            color: black;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th,
        td {
            border: 1px solid #333;
            padding: 8px 12px;
            text-align: left;
        }

        th {
            background: #f2f2f2;
        }

        tr:nth-child(even) {
            background: #fafafa;
        }

        .member-img {
            width: auto;
            height: 60px;
            object-fit: cover;
            border-radius: 4px;
        }
    </style>
</head>

<body>
    <h1>{{ 'Event Members' }}</h1>
    <h2>{{ $eventMembers[0]->event->title }}</h2>
    <h3>{{ date('d/m/Y') }}</h3>
    <table>
        <thead>
            <tr>
                <th>Sl</th>
                <th>Companey Name</th>
                <th>Name</th>
                <th>Age</th>
                <th>Image</th>
                <th>Relation</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($eventMembers as $member)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $member->user->membership->company_name }}</td>
                    <td>{{ $member->name }}</td>
                    <td>{{ $member->age }}</td>
                    <td style="padding: 0">
                        @if ($member->image)
                            <img src="/storage/{{ $member->image }}" alt="Image" class="member-img" width="50"
                                height="50">
                        @else
                            N/A
                        @endif
                    </td>
                    <td>{{ $member->relation }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

    <script>
        window.onload = function() {
            window.print();
        };
    </script>
</body>

</html>
