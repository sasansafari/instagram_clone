import '../src/auth_src.dart';

abstract class IAuthRepo {
  Future<void> userLogin(param);
  Future<void> registerUser(
    String userName,
    String password,
    String email,
    String? fullName,
    String? phone,
    String? userAvatar,
  );
  Future<void> checkUserActivate(param);
  Future<void> useVerify(param);
  Future<void> resendActivation(param);
}

class AuthRepo implements IAuthRepo {
  final IAuthSrc src;

  AuthRepo({required this.src});

  @override
  Future<void> checkUserActivate(param) {
    return src.checkUserActivate(param);
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
    return src.registerUser(
      userName,
      password,
      email,
      fullName,
      phone,
      userAvatar,
    );
  }

  @override
  Future<void> resendActivation(param) {
    return src.resendActivation(param);
  }

  @override
  Future<void> useVerify(param) {
    return src.useVerify(param);
  }

  @override
  Future<void> userLogin(param) {
    return src.userLogin(param);
  }
}
