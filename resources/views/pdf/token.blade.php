<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Token</title>
    <style>
        @page {
            margin: 8px;
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
            width: 4in;
            height: 2in;
            margin: 0px;
            vertical-align: top;
            border: 1px solid #00b894;
            position: relative;
            overflow: hidden;
            color: black;
            margin-bottom: 5px;
        }

        .heading-text {
            text-align: center;
            margin: 0px;
            margin-top: 15px;
            z-index: 100;
            padding: 0;
        }

        .heading-text2 {
            text-align: center;
            margin: 0px;
            z-index: 100;
            padding: 0;
        }

        .details-text {
            font-size: 11px;
            margin-left: 5px;
        }

        .qr-code {
            position: absolute;
            right: 2px;
            bottom: 2px;
        }

        .logo {
            position: absolute;
            left: 1%;
            top: 0%;
            width: 50px;
            height: 50px;
        }

        .token-name {
            background: #00b894;
            color: #fff;
            text-align: center;
        }
    </style>
</head>

<body>
    <div class="container">

        @foreach ($tokens->chunk(10) as $tokenChunk)
            <div class="page">
                @foreach ($tokenChunk as $token)
                    <div class="badge">
                        <img src="{{ public_path('assets/images/bemea.png') }}" class="logo">
                        <h4 class="heading-text">BEMEA</h4>
                        <h6 class="heading-text2">{{ $token->event->title }}</h6>
                        <h4 class="token-name">{{ $token->name }}</h4>

                        <div class="details-text">

                            <div><strong>Token Number: </strong>{{ $token->id }}</div>
                            <div><strong>Name: </strong>{{ $token->eventMember->name }}</div>
                            <div><strong>Companey Name:
                                </strong>{{ $token->eventMember->user->membership?->company_name }}</div>

                            @php
                                $writer = new Endroid\QrCode\Writer\PngWriter();

                                // Create QR code
                                $qrCode = new Endroid\QrCode\QrCode(
                                    data: 'Life',
                                    encoding: new Endroid\QrCode\Encoding\Encoding('UTF-8'),
                                    errorCorrectionLevel: Endroid\QrCode\ErrorCorrectionLevel::Low,
                                    size: 70,
                                    margin: 0,
                                    roundBlockSizeMode: Endroid\QrCode\RoundBlockSizeMode::Margin,
                                    foregroundColor: new Endroid\QrCode\Color\Color(0, 0, 0),
                                    backgroundColor: new Endroid\QrCode\Color\Color(255, 255, 255),
                                );

                                $result = $writer->write($qrCode);

                                // Generate a data URI to include image data inline (i.e. inside an <img> tag)
                                $dataUri = $result->getDataUri();

                            @endphp

                            <img src="{{ $dataUri }}" alt="QR Code" class="qr-code">
                        </div>


                    </div>
                @endforeach
            </div>
        @endforeach

    </div>
</body>

</html>
