import 'package:dio/dio.dart';
import 'package:tec/common/response_validator.dart';
import 'package:tec/data/model/user_model.dart';

abstract class IUserSrc {
  Future<void> editUser(UserModel userModel, String password) async =>
      editUser(userModel, password);
  Future<UserModel> getUser(
          {required String userName, required int userId}) async =>
      getUser(userName: userName, userId: userId);
  Future<void> deleteUser({required int userId}) async =>
      deleteUser(userId: userId);
  Future<void> followOrUnfollowUser(
          {required int userId, required int followerId}) async =>
      followOrUnfollowUser(userId: userId, followerId: followerId);
}

class RemoteUserUrc with HttpResponseValidator implements IUserSrc {
  final Dio httpClient;

  RemoteUserUrc(this.httpClient);

  @override
  Future<void> deleteUser({required int userId}) async {
    final response = await httpClient.post(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/user/delete',
      data: {
        'user_id': userId,
      },
    );
    validateResponse(response);
  }

  @override
  Future<void> editUser(UserModel userModel, String password) async {
    final response = await httpClient.post(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/user/update',
      data: {
        'user_id': userModel.userId,
        'username': userModel.userName,
        'password': password,
        'full_name': userModel.fullName,
        'email': userModel.email,
        'phone': userModel.phone,
        'user_avatar': userModel.userAvatar,
      },
    );
    validateResponse(response);
  }

  @override
  Future<void> followOrUnfollowUser(
      {required int userId, required int followerId}) async {
    final response = await httpClient.post(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/user/follow',
      data: {
        'user_id': userId,
        'follower_id': followerId,
      },
    );
    validateResponse(response);
  }

  @override
  Future<UserModel> getUser(
      {required String userName, required int userId}) async {
    final response = await httpClient.get(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/user/getuser?username=$userName&user_id=${userId.toString()}',
    );
    validateResponse(response);
    return UserModel.fromJson(response.data);
  }
}
