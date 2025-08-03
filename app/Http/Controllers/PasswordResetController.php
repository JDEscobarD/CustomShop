<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Carbon\Carbon;

class PasswordResetController extends Controller
{
    //enviar token
    public function sendResetToken(Request $request)
    {
        
        $validator = Validator::make($request->all(), [
            'email' => [
                'required',
                'email',
                Rule::exists('usuarios', 'email')->where(function ($query) {
                    //
                }),
            ],
        ], [
            'email.exists' => '',
        ]);

        
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first('email'),
            ], 422);
        }

        
        $token = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);

        
        DB::table('password_reset_tokens')->updateOrInsert(
            ['email' => $request->email],
            [
                'token' => Hash::make($token),
                'created_at' => Carbon::now()
            ]
        );

        
        Mail::send('emails.password-reset', ['token' => $token], function ($message) use ($request) {
            $message->to($request->email)->subject('Restablecimiento de contraseña');
        });

        
        session(['password_reset_email' => $request->email]);

        return response()->json(['success' => true]);
    }



    //validar el token
    public function validateToken(Request $request)
    {
        $request->validate([
            'email' => 'required|email|exists:usuarios,email',
            'token' => 'required|digits:6'
        ]);

        $record = DB::table('password_reset_tokens')->where('email', $request->email)->first();

        if (!$record || !Hash::check($request->token, $record->token)) {
            return response()->json([
                'success' => false,
                'message' => 'El token es inválido o ha expirado.'
            ], 422);
        }

        session(['password_reset_email' => $request->email, 'password_reset_token_validated' => true]);

        return response()->json([
            'success' => true,
            'redirect' => route('password.reset.form')
        ]);
    }
    
    //formulario de cambio de contraseña
    public function showResetForm(Request $request)
    {
        if (!$request->session()->has('password_reset_email') || !$request->session()->get('password_reset_token_validated')) {
            return redirect()->route('password.request')->with('error', 'Por favor, valida el token para continuar.');
        }

        $email = $request->session()->get('password_reset_email');
        $request->session()->forget('password_reset_token_validated');

        return view('auth.password-reset', compact('email'));
    }

    //cambio de contraseña
    public function resetPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email|exists:usuarios,email',
            'password' => 'required|confirmed|min:8'
        ]);

        $email = $request->input('email');

        DB::table('usuarios')->where('email', $email)->update([
            'password' => bcrypt($request->password),
        ]);

        
        DB::table('password_reset_tokens')->where('email', $email)->delete();

        $request->session()->forget(['password_reset_email', 'password_reset_token_validated']);

        return redirect()->route('login')->with('status', '¡Contraseña actualizada exitosamente! Ya puedes iniciar sesión.');
    }
}