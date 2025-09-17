<?php


use App\Http\Controllers\NoticeController;
use App\Http\Controllers\PrintController;
use Bigraja\BulkSmsBD\Models\BulkSmsBDLog;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\MembershipController;
use App\Http\Controllers\MembershipPdfController;
use App\Http\Controllers\CertificateRequestController;
use App\Http\Controllers\DonationController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\JobApplicationController;
use App\Http\Controllers\RenewMembershipController;
use App\Http\Controllers\ShortProfileController;
use App\Http\Controllers\SponsorController;
use App\Http\Controllers\TokenPrintController;
use App\Models\EventMemberToken;
use Barryvdh\DomPDF\Facade\Pdf;

Route::get('/admin/memberships/{membership}/pdf', [MembershipPdfController::class, 'download'])->name('memberships.pdf');

Route::get('/adm/memberships/print', [MembershipController::class, 'print'])->name('memberships.print');

Route::get('events/{event}/pdf', [EventController::class, 'pdfPrint'])->name('event-member.pdf');
Route::get('events/{event}/badge', [EventController::class, 'badgePdfPrint'])->name('badge.pdf');
Route::get('/print-tokens', [TokenPrintController::class, 'print'])->name('print.tokens');

Route::controller(PrintController::class)
    ->prefix('print')
    ->name('print.')
    ->group(function () {
        Route::get('event-members', 'printEventMembers')->name('event-members');
    });

Route::get('members/{membership}', [ShortProfileController::class, 'index'])->name('short-profile.index');

Route::get('test', function () {
    // Event ডাটা রিট্রিভ করুন
    $students = [
        ['name' => 'Rahim Uddin', 'id' => 'ST123', 'class' => 'Ten', 'photo' => 'rahim.jpg'],
        ['name' => 'Karim Ali', 'id' => 'ST124', 'class' => 'Nine', 'photo' => 'karim.jpg'],
    ];

    $pdf = Pdf::loadView('pdf.test', compact('students'))
        ->setPaper([0, 0, 242.6, 306], 'portrait'); // 85.6mm × 108mm = 242.6pt × 306pt

    return response($pdf->output(), 200)
        ->header('Content-Type', 'application/pdf')
        ->header('Content-Disposition', 'inline; filename="token.pdf"');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::get('/members/{member}/download-photo', [MembershipController::class, 'downloadPhoto'])
    ->name('members.downloadPhoto');
    
Route::get('/qrcode/{member}/download-photo', [CertificateRequestController::class, 'qrcode'])
    ->name('qrcode.downloadPhoto');


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // membership route
    Route::get('new/membership/create', [MembershipController::class, 'mcreate'])->name('new.membership.create');
    Route::get('membership/create', [MembershipController::class, 'create'])->name('membership.create');
    Route::post('membership', [MembershipController::class, 'store'])->name('membership.store');
    Route::delete('/membership/destroy', [MembershipController::class, 'destroy'])->name('membership.destroy');
    Route::post('membership/{membership}/payment', [MembershipController::class, 'payment'])->name('membership.payment');

    // certificate requests routes
    Route::get('/certificate-requests', [CertificateRequestController::class, 'create'])->name('certificate.requests.create');
    Route::post('/certificate-requests', [CertificateRequestController::class, 'store'])->name('certificate.requests.store');
    Route::post('certificate-requests/{certificateRequest}/payment', [CertificateRequestController::class, 'payment'])->name('certificate.requests.payment');

    // events
    Route::get('events/{event}', [EventController::class, 'show'])->name('events.show');
    Route::get('events/{event}/join', [EventController::class, 'join'])->name('events.join');
    Route::post('events/{event}/join', [EventController::class, 'joinStore'])->name('events.joinStore');

    Route::get('events/{event}/pay', [EventController::class, 'pay'])->name('events.pay');
    Route::post('events/{event}/pay', [EventController::class, 'payStore'])->name('events.payStore');
    Route::get('events/{event}/dowenload-token', [EventController::class, 'DowenloadToken']);

    // sponsor
    Route::get('/sponsors/create', [SponsorController::class, 'create'])->name('sponsors.create');
    Route::post('/sponsors', [SponsorController::class, 'store'])->name('sponsors.store');
    Route::post('/sponsors/{sponsor}/payment', [SponsorController::class, 'payment'])->name('sponsors.payment');

    Route::get('renew-membership/create', [RenewMembershipController::class, 'create'])->name('renew-membership.create');
    Route::post('renew-membership', [RenewMembershipController::class, 'store'])->name('renew-membership.store');
    Route::post('renew-membership/{renewMembership}/payment', [RenewMembershipController::class, 'payment'])->name('renew-membership.payment');

    Route::get('/notices', [NoticeController::class, 'index'])->name('notices.index');
    Route::get('/notices/create', [NoticeController::class, 'create'])->name('notices.create'); // For frontend form if any
    Route::post('/notices', [NoticeController::class, 'store'])->name('notices.store'); // For frontend form if any
    Route::get('/notices/{notice}', [NoticeController::class, 'show'])->name('notices.show');
    Route::delete('/notices/{notice}', [NoticeController::class, 'destroy'])->name('notices.destroy'); // For frontend form if any

});

// ... other routes

Route::post('/apply-job', [JobApplicationController::class, 'store'])->name('job.apply');

Route::get('/donate', [DonationController::class, 'create'])->name('donations.create');
Route::post('/donate', [DonationController::class, 'store'])->name('donations.store');
Route::get('/donate/thank-you', [DonationController::class, 'thankYou'])->name('donations.thankyou');

// ... other routes

require __DIR__ . '/auth.php';