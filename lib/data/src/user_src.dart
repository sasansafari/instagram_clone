import 'package:dio/dio.dart';
import 'package:tec/data/model/user_model.dart';

import '../../common/http_error_handler.dart';

abstract class IUserSrc {
  Future<void> editUser(UserModel userModel, String password) async =>
      editUser(userModel, password);

  Future<UserModel> getUser({
    required String userName,
    required int userId,
  }) async =>
      getUser(userName: userName, userId: userId);

  Future<void> deleteUser({required int userId}) async =>
      deleteUser(userId: userId);

  Future<void> followUnfollow({
    required int userId,
    required int followerId,
  }) async =>
      followUnfollow(userId: userId, followerId: followerId);
}

class RemoteUserUrc implements IUserSrc {
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
    HttpResponseHandler(
      response: response,
    ).validate();
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
    HttpResponseHandler(
      response: response,
    ).validate();
  }

  @override
  Future<void> followUnfollow({
    required int userId,
    required int followerId,
  }) async {
    final response = await httpClient.post(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/user/follow',
      data: {
        'user_id': userId,
        'follower_id': followerId,
      },
    );
    HttpResponseHandler(
      response: response,
    ).validate();
  }

  @override
  Future<UserModel> getUser({
    required String userName,
    required int userId,
  }) async {
    UserModel userModel = UserModel.empty();

    final response = await httpClient.get(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/user/getuser?username=$userName&user_id=${userId.toString()}',
    );
    HttpResponseHandler(
      response: response,
      on200: () {
        userModel = UserModel.fromJson(response.data);
      },
    ).validate();
    return userModel;
  }
}
