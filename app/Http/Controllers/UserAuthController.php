<?php

namespace App\Http\Controllers;

use App\Notifications\VerifyEmail;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserAuthController extends Controller
{
    public function register(Request $request)
    {
        $registerUserData = $request->validate([
            'name'=>'required|string',
            'email'=>'required|string|email|unique:users',
            'password'=>'required|min:8',
            'profile_image' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);


        $user = User::create([
            'name' => $registerUserData['name'],
            'email' => $registerUserData['email'],
            'password' => Hash::make($registerUserData['password']),
        ]);

        // Handle profile photo upload
        if ($request->hasFile('profile_image')) {
            $user->addMedia($request->file('profile_image'))->toMediaCollection();
        }

        $token = $user->createToken($user->name.'-AuthToken')->plainTextToken;

        $otp = random_int(100000, 999999);
        $user->otp = $otp;
        $user->save();
        $user->notify(new VerifyEmail($otp));

        return response()->json([
            'access_token' => $token,
        ]);
    }

    public function login(Request $request)
    {
        $loginUserData = $request->validate([
            'email'=>'required|string|email',
            'password'=>'required|min:8'
        ]);
        $user = User::where('email', $loginUserData['email'])->first();
        if (!$user || !Hash::check($loginUserData['password'], $user->password)) {
            return response()->json([
                'message' => 'Invalid Credentials'
            ], 401);
        }
        $token = $user->createToken($user->name.'-AuthToken')->plainTextToken;
        return response()->json([
            'access_token' => $token,
        ]);
    }

    public function logout()
    {
        auth()->user()->tokens()->delete();

        return response()->json([
            "message"=>"logged out"
        ]);
    }

    public function getUser()
    {
        $user = auth()->user();
        return response()->json([
            'user' => $user
        ]);
    }

    public function updateUser(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'profile_image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
        $user = auth()->user();

        // Handle profile photo upload
        if ($request->hasFile('profile_image')) {
            $user->clearMediaCollection();
            $user->addMedia($request->file('profile_image'))->toMediaCollection();
        }

        $user->name = $request->input('name');
        $user->save();

        return response()->json([
            'message' => 'User updated successfully',
            'user' => $user
        ]);
    }

    public function verifyEmail(Request $request)
    {
        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        if ($request->otp === $user->otp) {
            $user->email_verified_at = now();
            $user->otp = null; // Clear OTP after verification
            $user->save();

            return response()->json(['message' => 'Email verified successfully']);
        }

        return response()->json(['message' => 'Invalid OTP'], 400);
    }

    public function resendVerificationEmail(Request $request)
    {
        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        $otp = random_int(100000, 999999);
        $user->otp = $otp;
        $user->save();

        // Send email with OTP
        $user->notify(new VerifyEmail($otp));

        return response()->json(['message' => 'Verification email resent successfully'], 200);
    }
}
