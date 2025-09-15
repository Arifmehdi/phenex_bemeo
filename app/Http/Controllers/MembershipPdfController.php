<?php

namespace App\Http\Controllers;

use App\Models\Membership;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;

class MembershipPdfController extends Controller
{
    public function download(Membership $membership)
    {
        $pdf = Pdf::loadView('pdf.membership', compact('membership'));
        
        // return $pdf->download("membership_{$membership->id}.pdf");
        return $pdf->stream("membership_{$membership->id}.pdf");
    }
}
