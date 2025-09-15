<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificate Request</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #df5311;
        }

        .content {
            margin-top: 20px;
        }

        .content p {
            font-size: 16px;
        }

        .content table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .content table,
        th,
        td {
            border: 1px solid #ddd;
        }

        th,
        td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Certificate Request</h1>
        <div class="content">
            <p><strong>Company Name:</strong> {{ $record->company_name }}</p>
            <p><strong>Proprietor:</strong> {{ $record->proprietor }}</p>
            <p><strong>Director/Partner:</strong> {{ $record->director_partner }}</p>
            <p><strong>Address:</strong> {{ $record->address }}</p>
            <p><strong>Yearly Subscription:</strong> Tk. {{ $record->yearly_subscription }}</p>

            <h3>Machine Information:</h3>
            <table>
                <tr>
                    <th>Number of Machines</th>
                    <td>{{ $record->number_of_machines }}</td>
                </tr>
                <tr>
                    <th>Brand</th>
                    <td>{{ $record->brand }}</td>
                </tr>
                <tr>
                    <th>Needle/Colors</th>
                    <td>{{ $record->needle_colors }}</td>
                </tr>
            </table>
        </div>
    </div>
</body>

</html>
