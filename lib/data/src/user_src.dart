import 'package:dio/dio.dart';
import 'package:tec/data/constant.dart';
import 'package:tec/data/model/user_model.dart';

import '../../common/http_error_handler.dart';

abstract class IUserSrc {
  Future<void> editUser(UserModel userModel) async => editUser(userModel);

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
      RemoteConstants.deleteUser,
      data: {
        RemoteKey.userId: userId,
      },
    );
    HttpResponseHandler(
      response: response,
    ).validate();
  }

  @override
  Future<void> editUser(UserModel userModel) async {
    final response = await httpClient.post(
      RemoteConstants.updateUser,
      data: userModel.toJson(),
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
      RemoteConstants.followUser,
      data: {
        RemoteKey.userId: userId,
        RemoteKey.followerId: followerId,
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
      RemoteConstants.getUser,
      queryParameters: {
        RemoteKey.userName: userName,
        RemoteKey.userId: userId.toString()
      },
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
