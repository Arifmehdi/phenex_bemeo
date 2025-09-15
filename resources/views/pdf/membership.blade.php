<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Membership Form</title>
    <style>
        @page {
            size: A4;
            margin: 30px;
        }

        body {
            font-family: sans-serif;
            font-size: 12px;
        }

        .logo {
            width: 80px;
        }

        .center {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .bordered th, .bordered td {
            border: 1px solid #000;
            padding: 5px;
        }

        .field {
            margin-bottom: 10px;
        }

        .label {
            font-weight: bold;
        }

        .underline {
            border-bottom: 1px dotted #000;
            display: inline-block;
            min-width: 300px;
        }

        .footer {
            margin-top: 40px;
        }

        .signature {
            margin-top: 50px;
        }

        .info-small {
            font-size: 10px;
        }

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <table>
        <tr>
            <td><img src="{{ public_path('images/bemea-logo.png') }}" class="logo" alt="logo"></td>
            <td class="center">
                <h3>BANGLADESH EMBROIDERY MANUFACTURERS & EXPORTERS ASSOCIATION (BEMEA)</h3>
                <p class="info-small">
                    House #16 (Gr. Floor), Road #06, Nikunja-2, Dhaka-1229, Bangladesh<br>
                    Cell: 01720578171, 01184182956, 01970578171 | Email: bemea@dhaka.net<br>
                    Web: www.bemeabd.com
                </p>
            </td>
        </tr>
    </table>

    <h4 class="center" style="margin: 20px 0; text-decoration: underline;">ENLISTMENT FORM FOR MEMBERSHIP</h4>

    <div class="field">(01) <span class="label">Name of Industry:</span> <span class="underline">&nbsp;</span></div>
    <div class="field">(02) <span class="label">Fac. Address:</span> <span class="underline">&nbsp;</span></div>

    <div class="field">(03) <span class="label">Designated Person:</span> <span class="underline">&nbsp;</span> &nbsp;&nbsp; <span class="label">Designation:</span> <span class="underline">&nbsp;</span></div>

    <div class="field">(04) <span class="label">Tel:</span> (off) <span class="underline">&nbsp;&nbsp;&nbsp;&nbsp;</span> (Fac): <span class="underline">&nbsp;&nbsp;&nbsp;&nbsp;</span> (Mob): <span class="underline">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>

    <div class="field">(05) <span class="label">Date of Commissioning:</span> <span class="underline">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>

    <div class="field">(06) <span class="label">Machines Details:</span></div>

    <table class="bordered">
        <thead>
            <tr>
                <th>Brand</th>
                <th>No. of Heads</th>
                <th>Quantity</th>
                <th>Remarks</th>
            </tr>
        </thead>
        <tbody>
            @for ($i = 0; $i < 3; $i++)
            <tr>
                <td>&nbsp;</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            @endfor
        </tbody>
    </table>

    <div class="field">(07) <span class="label">Number of Employees:</span> Male: ........ Female: ........ Total: ........</div>

    <div class="field">(08) <span class="label">Name of Directors/Partners/Owners:</span><br>
        A. <span class="underline">&nbsp;&nbsp;&nbsp;&nbsp;</span> B. <span class="underline">&nbsp;&nbsp;&nbsp;&nbsp;</span> C. <span class="underline">&nbsp;&nbsp;&nbsp;&nbsp;</span>
    </div>

    <div class="field">(09) <span class="label">TIN No:</span> <span class="underline">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
    <div class="field">(10) <span class="label">Trade Licenses:</span> <span class="underline">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>

    <div class="field" style="margin-top: 20px;">
        I ..........................................., Proprietor/Managing Director/Partner, .................................................... do hereby solemnly affirm that I will abide by all rules & regulations of the Association without any question and will not do any harmful act and uphold the honor of the Memorandum and Articles of Association of BEMEA at all cost.
    </div>

    <div class="signature">
        Date & Seal: ____________________ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Signature: ______________________
    </div>

    <hr>

    <div class="center"><strong>SPACE FOR OFFICIAL USE</strong></div>

    <div class="field">Sl. No: .................. &nbsp;&nbsp;&nbsp; Received Tk: ..................</div>
    <div class="field">
        Certified that the above-named industry has been enlisted for membership of the Association with effect from date ................... as a founder/general Member.
    </div>

    <div class="signature">
        Date & Seal: ____________________ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Secretary General, BEMEA
    </div>

</body>
</html>
