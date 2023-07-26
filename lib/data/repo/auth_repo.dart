import '../src/auth_src.dart';

abstract class IAuthRepo {
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
  Future<void> useVerify(int activeToken);
  Future<void> resendActivation(param);
}

class AuthRepo implements IAuthRepo {
  final IAuthSrc src;

  AuthRepo({required this.src});

  @override
  Future<String> checkUserActivate(param) {
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
  Future<void> useVerify(int activeToken) {
    return src.userVerify(activeToken);
  }

  @override
  Future<void> userLogin(
    String? userName,
    String password,
    String? email,
  ) {
    return src.userLogin(userName, password, email);
  }
}
