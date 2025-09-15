<!DOCTYPE html>
<html>

<head>
    <title>Membership List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 5px;
            text-align: left;
        }

        th {
            background: #f4f4f4;
        }

        .print-button {
            margin: 20px 0;
        }

        @media print {
            .print-button {
                display: none;
            }
        }
    </style>
</head>

<body>
    <h1>Membership List</h1>
    <button class="print-button" onclick="window.print()">Print</button>

    <table>
        <thead>
            <tr>
                <th>Membership ID</th>
                <th>Company Name</th>
                <th>Company Type</th>
                <th>Director</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Machines</th>
                <th>Opening</th>
                <th>Bad Debit</th>
                <th>Discount</th>
                <th>Subscription</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($memberships as $membership)
                <tr>
                    <td>{{ $membership->membership_id }}</td>
                    <td>{{ $membership->company_name }}</td>
                    <td>{{ $membership->company_type }}</td>
                    <td>{{ $membership->director_name }}</td>
                    <td>{{ $membership->phone }}</td>
                    <td>{{ $membership->email }}</td>
                    <td>{{ $membership->machine_count }}</td>
                    <td>{{ $membership->openint_balance ?? 'N/A' }}</td>
                    <td>{{ $membership->bad_debit ?? 'N/A' }}</td>
                    <td>{{ $membership->discount ?? 'N/A' }}</td>
                    <td>{{ number_format($membership->yearly_subscription, 2) }}</td>
                    <td>{{ $membership->is_active ? 'Active' : 'Inactive' }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <script>
        window.print()
    </script>
</body>

</html>
