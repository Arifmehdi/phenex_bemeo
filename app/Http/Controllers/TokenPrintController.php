<?php

namespace App\Http\Controllers;

use App\Models\EventMemberToken;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;

class TokenPrintController extends Controller
{
    public function print()
    {
        $ids = session('print_token_ids', []);
        $tokens = EventMemberToken::whereIn('id', $ids)->get();

        $pdf = Pdf::loadView('pdf.token', [
            'tokens' => $tokens,
        ])->setPaper('a4')
            ->setOption(['defaultFont' => 'sans-serif'])
            ->setWarnings(false);

        return $pdf->stream('token.pdf'); // অথবা download('token.pdf')
    }
}
