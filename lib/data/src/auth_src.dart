import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:tec/common/http_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthSrc {
  Future<void> userLogin(
    String? userName,
    String password,
    String? email,
  );
  Future<void> registerUser(
    String userName,
    String password,
    String email,
    String? fullName,
    String? phone,
    String? userAvatar,
  );
  Future<String> checkUserActivate(param);
  Future<void> userVerify(int activeToken);
  Future<void> resendActivation(param);
}

class AuthRemoteSrc implements IAuthSrc {
  final Dio http;

  AuthRemoteSrc({required this.http});

  @override
  Future<String> checkUserActivate(param) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String msg = '';
    int? userId = preferences.getInt('user_id');

    try {
      final response = await http.post(
        'https://maktabkhoneh-api.sasansafari.com/api/v1/auth/check_active',
        data: {
          'user_id': userId,
        },
      );
      httpErrorHandle(
          response: response,
          onSuccess: () {
            msg = jsonDecode(response.data)['ms'];
          });
    } catch (e) {
      debugPrint('Error in Auth src check Activation :  ${e.toString()}');
    }
    return msg;
  }

  @override
  Future<void> registerUser(
    String userName,
    String password,
    String email,
    String? fullName,
    String? phone,
    String? userAvatar,
  ) async {
    try {
      // AuthModel auth = AuthModel(verifyToken: '', userId: 0);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final response = await http.post(
        'https://maktabkhoneh-api.sasansafari.com/api/v1/auth/register',
        data: {
          'username': userName,
          'password': password,
          'email': email,
          'fullName': fullName,
          'phone': phone,
          'userAvatar': userAvatar
        },
      );
      httpErrorHandle(
        response: response,
        onSuccess: () async {
          //! as we dont use statemanager yet, we cant use model because in  login we need
          //! to add auth token to this object by copywith method
          //! so for now we just use sharedpreferences

          String token = jsonDecode(response.data)['verify_token'];
          int userId = jsonDecode(response.data)['user_id'];
          await preferences.setInt('user_id', userId);
          await preferences.setString('verify_token', token);
          // auth = AuthModel.fromJson(response.data);
        },
      );
    } catch (e) {
      debugPrint('Error in Auth src user register :  ${e.toString()}');
    }
  }

  @override
  Future<void> resendActivation(param) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? userId = preferences.getInt('user_id');
    String? token = preferences.getString('verify_token');
    try {
      final response = await http.post(
        'https://maktabkhoneh-api.sasansafari.com/api/v1/auth/resend_token',
        data: {
          'user_id': userId,
          'verify_token': token,
        },
      );
      httpErrorHandle(response: response, onSuccess: () {});
    } catch (e) {
      debugPrint('Error in Auth src resendActivation :  ${e.toString()}');
    }
  }

  @override
  Future<void> userVerify(int activeToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? userId = preferences.getInt('user_id');
    String? token = preferences.getString('verify_token');
    try {
      final response = await http.post(
        'https://maktabkhoneh-api.sasansafari.com/api/v1/auth/verify',
        data: {
          'user_id': userId,
          'verify_token': token,
          'active_token': activeToken,
        },
      );
      httpErrorHandle(response: response, onSuccess: () {});
    } catch (e) {
      debugPrint('Error in Auth src user verify :  ${e.toString()}');
    }
  }

  @override
  Future<void> userLogin(
    String? userName,
    String password,
    String? email,
  ) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final response = await http.post(
        'https://maktabkhoneh-api.sasansafari.com/api/v1/auth/login',
        data: {
          'username': userName,
          'password': password,
          'email': email,
        },
      );

      httpErrorHandle(
        response: response,
        onSuccess: () async {
          String token = jsonDecode(response.data)['auth_token'];

          await preferences.setString('auth_token', token);
        },
      );
    } catch (e) {
      debugPrint('Error in Auth src user login :  ${e.toString()}');
    }
  }
}
