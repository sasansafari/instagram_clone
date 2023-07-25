import '../model/auth_model.dart';
import '../src/auth_src.dart';

abstract class IAuthRepo {
  Future<AuthModel> userLogin(param);
  Future<AuthModel> registerUser(
    String userName,
    String password,
    String email,
    String? fullName,
    String? phone,
    String? userAvatar,
  );
  Future<AuthModel> checkUserActivate(param);
  Future<AuthModel> useVerify(param);
  Future<AuthModel> resendActivation(param);
}

class AuthRepo implements IAuthRepo {
  final IAuthSrc src;

  AuthRepo({required this.src});

  @override
  Future<AuthModel> checkUserActivate(param) {
    return src.checkUserActivate(param);
  }

  @override
  Future<AuthModel> registerUser(
    String userName,
    String password,
    String email,
    String? fullName,
    String? phone,
    String? userAvatar,
  ) async {
    return src.registerUser(
        userName, password, email, fullName, phone, userAvatar);
  }

  @override
  Future<AuthModel> resendActivation(param) {
    return src.resendActivation(param);
  }

  @override
  Future<AuthModel> useVerify(param) {
    return src.useVerify(param);
  }

  @override
  Future<AuthModel> userLogin(param) {
    return src.userLogin(param);
  }
}
