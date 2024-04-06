<?php

use Illuminate\Auth\Middleware\EnsureEmailIsVerified;
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

use App\Http\Controllers\UserAuthController;

Route::post('register', [ UserAuthController::class, 'register' ]);
Route::post('login', [ UserAuthController::class, 'login' ]);

Route::middleware([ 'auth:sanctum', 'verified'])->group(function () {
    Route::post('logout', [ UserAuthController::class, 'logout' ]);
    Route::get('user', [ UserAuthController::class, 'getUser' ]);
    Route::put('user', [ UserAuthController::class, 'updateUser' ]);
});

Route::post('email/verify', [ UserAuthController::class, 'verifyEmail' ])->name('email.verify');
Route::post('email/resend', [ UserAuthController::class, 'resendVerificationEmail' ])->name('email.resend');
