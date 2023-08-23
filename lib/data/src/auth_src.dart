import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec/common/http_error_handler.dart';
import 'package:tec/data/constant.dart';

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
    int? userId = preferences.getInt(RemoteKey.userId);

    try {
      final response = await http.post(
        RemoteConstants.userActivate,
        data: {
          RemoteKey.userId: userId,
        },
      );

      HttpResponseHandler(
        response: response,
      ).validate();

      // httpErrorHandle(
      //     response: response,
      //     onSuccess: () {
      //       msg = jsonDecode(response.data)['ms'];
      //     });
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
        RemoteConstants.register,
        data: {
          RemoteKey.userName: userName,
          RemoteKey.password: password,
          RemoteKey.email: email,
          RemoteKey.fullName: fullName,
          RemoteKey.phone: phone,
          RemoteKey.userAvatar: userAvatar
        },
      );
      HttpResponseHandler(
        response: response,
        on200: () async {
          //! as we dont use statemanager yet, we cant use model because in  login we need
          //! to add auth token to this object by copywith method
          //! so for now we just use sharedpreferences

          String token = jsonDecode(response.data)[RemoteKey.verifyToken];
          int userId = jsonDecode(response.data)[RemoteKey.userId];
          await preferences.setInt(RemoteKey.userId, userId);
          await preferences.setString(RemoteKey.verifyToken, token);
          // auth = AuthModel.fromJson(response.data);
        },
      ).validate();
    } catch (e) {
      debugPrint('Error in Auth src user register :  ${e.toString()}');
    }
  }

  @override
  Future<void> resendActivation(param) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? userId = preferences.getInt(RemoteKey.userId);
    String? token = preferences.getString(RemoteKey.verifyToken);
    try {
      final response = await http.post(
        RemoteConstants.resendActivation,
        data: {
          RemoteKey.userId: userId,
          RemoteKey.verifyToken: token,
        },
      );
      HttpResponseHandler(
        response: response,
      ).validate();
    } catch (e) {
      debugPrint('Error in Auth src resendActivation :  ${e.toString()}');
    }
  }

  @override
  Future<void> userVerify(int activeToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? userId = preferences.getInt(RemoteKey.userId);
    String? token = preferences.getString(RemoteKey.verifyToken);
    try {
      final response = await http.post(
        RemoteConstants.verify,
        data: {
          RemoteKey.userId: userId,
          RemoteKey.verifyToken: token,
          RemoteKey.activeToken: activeToken,
        },
      );
      HttpResponseHandler(
        response: response,
      ).validate();
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
        RemoteConstants.login,
        data: {
          RemoteKey.userName: userName,
          RemoteKey.password: password,
          RemoteKey.email: email,
        },
      );
      HttpResponseHandler(
        response: response,
        on200: () async {
          String token = jsonDecode(response.data)[RemoteKey.authToken];

          await preferences.setString(RemoteKey.authToken, token);
        },
      ).validate();
    } catch (e) {
      debugPrint('Error in Auth src user login :  ${e.toString()}');
    }
  }
}
