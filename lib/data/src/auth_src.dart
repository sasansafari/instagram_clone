import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../model/user_model.dart';

abstract class IAuthSrc {
  Future<UserModel> userLogin(param);
  Future<UserModel> registerUser(
    String userName,
    String password,
    String email,
  ) async =>
      registerUser(userName, password, email);
  Future<UserModel> checkUserActivate(param);
  Future<UserModel> useVerify(param);
  Future<UserModel> resendActivation(param);
}

class AuthRemoteSrc implements IAuthSrc {
  final Dio http;

  AuthRemoteSrc({required this.http});

  @override
  Future<UserModel> checkUserActivate(param) {
    // TODO: implement checkUserActivate
    throw UnimplementedError();
  }

  @override
  Future<UserModel> registerUser(
    String userName,
    String password,
    String email,
  ) async {
    late UserModel user;

    try {
      http.post(
        'https://maktabkhoneh-api.sasansafari.com/api/v1/auth/register',
        data: {
          'username': userName,
          'password': password,
          'email': email,
        },
      ).then((value) {
        if (value.statusCode == 200) {
          user = UserModel.fromJson(value.data);
        }
      });
    } catch (e) {
      debugPrint('Error registering User :  ${e.toString()}');
    }
    return user.copyWith(password: password, userName: userName);
  }

  @override
  Future<UserModel> resendActivation(param) {
    // TODO: implement resendActivation
    throw UnimplementedError();
  }

  @override
  Future<UserModel> useVerify(param) {
    // TODO: implement useVerify
    throw UnimplementedError();
  }

  @override
  Future<UserModel> userLogin(param) {
    // TODO: implement userLogin
    throw UnimplementedError();
  }
}
