import '../model/user_model.dart';
import '../src/auth_src.dart';

abstract class IAuthRepo {
  Future<UserModel> userLogin(param);
  Future<UserModel> registerUser(
    String userName,
    String password,
    String email,
  );
  Future<UserModel> checkUserActivate(param);
  Future<UserModel> useVerify(param);
  Future<UserModel> resendActivation(param);
}

class AuthRepo implements IAuthRepo {
  final IAuthSrc src;

  AuthRepo({required this.src});

  @override
  Future<UserModel> checkUserActivate(param) {
    return src.checkUserActivate(param);
  }

  @override
  Future<UserModel> registerUser(
    String userName,
    String password,
    String email,
  ) async {
    return src.registerUser(userName, password, email);
  }

  @override
  Future<UserModel> resendActivation(param) {
    return src.resendActivation(param);
  }

  @override
  Future<UserModel> useVerify(param) {
    return src.useVerify(param);
  }

  @override
  Future<UserModel> userLogin(param) {
    return src.userLogin(param);
  }
}
