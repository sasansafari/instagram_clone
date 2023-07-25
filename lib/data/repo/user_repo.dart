import 'package:tec/data/model/user_model.dart';
import 'package:tec/data/src/user_src.dart';

abstract class IUserRepo implements IUserSrc {}

class UserRepo implements IUserRepo {
  final IUserSrc dataSource;

  UserRepo(this.dataSource);

  @override
  Future<void> deleteUser({required int userId}) async =>
      dataSource.deleteUser(userId: userId);

  @override
  Future<void> editUser(UserModel userModel, String password) async {
    return dataSource.editUser(userModel, password);
  }

  @override
  Future<void> followOrUnfollowUser({
    required int userId,
    required int followerId,
  }) async =>
      dataSource.followOrUnfollowUser(userId: userId, followerId: followerId);

  @override
  Future<UserModel> getUser({
    required String userName,
    required int userId,
  }) async =>
      dataSource.getUser(userName: userName, userId: userId);
}
