<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>{{ $event->title }}</title>
    <style>
        @page {
            margin: 0px;
        }

        body {
            font-family: DejaVu Sans, sans-serif;
            margin: 0;
            padding: 0;
            color: black;
        }

        .container {}

        .page {
            page-break-after: always;
            width: 100vw;
            height: 100vh;
        }

        .badge {
            display: inline-block;
            width: 2.125in;
            height: 3.375in;
            margin: 20px;
            vertical-align: top;
            border: 1px solid #00b894;
            position: relative;
            overflow: hidden;
            color: black;
        }

        .heading-text {
            text-align: center;
            margin: 0px;
            margin-top: 15px;
            z-index: 100;
            color: white;
            padding: 0;
        }

        .heading-text2 {
            text-align: center;
            margin: 0px;
            z-index: 100;
            color: white;
            padding: 0;
        }

        .profile-img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            position: absolute;
            margin-left: -100px;
            margin-top: -100px;
            top: 35%;
            left: 50%;
            border: 5px solid rgb(3, 214, 98);
        }

        .top-bg {
            width: 500px;
            height: 500px;
            background: #00b894;
            position: absolute;
            border-radius: 50%;
            overflow: hidden;
            margin-left: -250px;
            margin-top: -250px;
            top: 1%;
            left: 50%;
        }

        .details-text {
            margin: 20px;
            font-size: 15px;
        }

        .qr-code {
            position: absolute;
            right: 6%;
            bottom: 3%;
        }

        .logo {
            position: absolute;
            left: 1%;
            top: 0%;
            width: 100px;
            height: 100px;
        }
    </style>
</head>

<body>
    <div class="container">

        @php
            $number = 1;
        @endphp

        @foreach ($event->members()->where('approved', 1)->get()->chunk(9) as $pageMembers)
            <div class="page">
                @foreach ($pageMembers as $member)
                    <div class="badge">
                        <div class="top-bg"></div>
                        <h4 class="heading-text">BEMEA</h4>
                        <h6 class="heading-text2">{{ $member->event->title }}</h6>

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

                        <br><br><br><br><br>
                        <img src="{{ public_path('assets/images/bemea.png') }}" class="logo">
                        <div class="details-text">
                            <div>
                                <div><strong>Id Number: </strong>{{ $number }}</div>
                                <div><strong>Name: </strong>{{ $member->name }}</div>
                                <div><strong>Companey Name: </strong>{{ $member->user->membership?->company_name }}
                                </div>
                            </div>
                            <div>
                                @php
                                    $writer = new Endroid\QrCode\Writer\PngWriter();

                                    // Create QR code
                                    $qrCode = new Endroid\QrCode\QrCode(
                                        data: 'https://bemeabd.com/members/' . $member->user->membership?->id,
                                        encoding: new Endroid\QrCode\Encoding\Encoding('UTF-8'),
                                        errorCorrectionLevel: Endroid\QrCode\ErrorCorrectionLevel::Low,
                                        size: 150,
                                        margin: 0,
                                        roundBlockSizeMode: Endroid\QrCode\RoundBlockSizeMode::Margin,
                                        foregroundColor: new Endroid\QrCode\Color\Color(0, 0, 0),
                                        backgroundColor: new Endroid\QrCode\Color\Color(255, 255, 255),
                                    );

                                    $result = $writer->write($qrCode);

                                    // Generate a data URI to include image data inline (i.e. inside an <img> tag)
                                    $dataUri = $result->getDataUri();

                                    $number++;
                                @endphp

                                <img src="{{ $dataUri }}" alt="QR Code" class="qr-code">
                            </div>
                        </div>

                    </div>
                @endforeach
            </div>
        @endforeach
    </div>
</body>

</html>
