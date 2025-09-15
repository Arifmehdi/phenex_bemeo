<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Bigraja\BulkSmsBD\Facades\BulkSmsBD;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;
use Illuminate\View\View;

class PasswordResetLinkController extends Controller
{
    /**
     * Display the password reset link request view.
     */
    public function create(): View
    {
        return view('auth.forgot-password');
    }

    /**
     * Handle an incoming password reset link request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'email' => ['required'],
        ]);

        // check email or mobile number
        if (!filter_var($request->email, FILTER_VALIDATE_EMAIL)) {
            // check bd mobile number format
            if (!preg_match('/^(\+8801[3-9]\d{8}|01[3-9]\d{8})$/', $request->email)) {
                return back()->withInput($request->only('email'))
                    ->withErrors(['email' => __('The email or mobile number is not valid.')]);
            }

            $user = User::where('mobile_number', $request->email)->first();

            if (!$user) {
                return back()->withInput($request->only('email'))
                    ->withErrors(['email' => __('No user found with this mobile number.')]);
            }

            // send sms with opt
            $otp = rand(100000, 999999);
            $message = "Bemea OTP is " . $otp;
            BulkSmsBD::send($request->email, $message);

            // Store the OTP in session or database for later verification
            session(['otp' => $otp, 'mobile_number' => $request->email]);
            return redirect()
                ->route('password.reset', ['token' => 'otp', 'mobile_number' => $request->email])
                ->with('status', __('A password reset code has been sent to your mobile number.'));
        }

        // We will send the password reset link to this user. Once we have attempted
        // to send the link, we will examine the response then see the message we
        // need to show to the user. Finally, we'll send out a proper response.
        $status = Password::sendResetLink(
            $request->only('email')
        );

        return $status == Password::RESET_LINK_SENT
            ? back()->with('status', __($status))
            : back()->withInput($request->only('email'))
                ->withErrors(['email' => __($status)]);
    }
}
