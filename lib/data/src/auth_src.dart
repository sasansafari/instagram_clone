import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../model/auth_model.dart';

abstract class IAuthSrc {
  Future<AuthModel> userLogin(param);
  Future<AuthModel> registerUser(
    String userName,
    String password,
    String email,
  );
  Future<AuthModel> checkUserActivate(param);
  Future<AuthModel> useVerify(param);
  Future<AuthModel> resendActivation(param);
}

class AuthRemoteSrc implements IAuthSrc {
  final Dio http;

  AuthRemoteSrc({required this.http});

  @override
  Future<AuthModel> checkUserActivate(param) {
    // TODO: implement checkUserActivate
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> registerUser(
    String userName,
    String password,
    String email,
  ) async {
    late AuthModel auth;

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
          auth = AuthModel.fromJson(value.data);
        }
      });
    } catch (e) {
      debugPrint('Error registering User :  ${e.toString()}');
    }
    return auth;
  }

  @override
  Future<AuthModel> resendActivation(param) {
    // TODO: implement resendActivation
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> useVerify(param) {
    // TODO: implement useVerify
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> userLogin(param) {
    // TODO: implement userLogin
    throw UnimplementedError();
  }
}
