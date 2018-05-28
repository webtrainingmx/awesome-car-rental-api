<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\Exceptions\HttpResponseException;

use Tymon\JWTAuth\Exceptions\TokenBlacklistedException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Validator;
use Tymon\JWTAuth\Facades\JWTAuth;


class TokensController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        $validator = Validator::make($credentials, [
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'code' => 1,
                'message' => 'Wrong validation',
                'errors' => $validator->errors()
            ], 422);
        }

        $token = JWTAuth::attempt($credentials);

        if ($token) {
            return response()->json(['token' => $token]);
        } else {
            return response()->json([
                'code' => 2,
                'message' => 'Wrong credentials',
                'errors' => $validator->errors()], 401);
        }
    }

    public function refreshToken()
    {

        $token = JWTAuth::getToken();

        try {
            $token = JWTAuth::refresh($token);
            return response()->json(['token' => $token]);
        } catch (TokenExpiredException $ex) {
            // We were unable to refresh the token, our user needs to login again
            throw new HttpResponseException(
                \response()->json(['code' => 3, 'message' => 'Need to login again, please!'])
            );
        } catch (TokenBlacklistedException $ex) {
            // Blacklisted token
            throw new HttpResponseException(
                \response()->json(['code' => 4, 'message' => 'Need to login again, please!'])
            );
        }

    }

    public function invalidateToken()
    {

        $token = JWTAuth::getToken();

        try {
            $token = JWTAuth::invalidate($token);
            return response()->json(['token' => $token]);
        } catch (TokenExpiredException $ex) {
            throw new HttpResponseException(
                \response()->json(['code' => 3, 'message' => 'Need to login again, please!'])
            );
        }

    }
}
