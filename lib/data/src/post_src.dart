import 'package:dio/dio.dart';
import 'package:tec/data/constant.dart';
import 'package:tec/data/model/post_model.dart';

import '../../common/http_error_handler.dart';

abstract class IPostSrc {
  Future<void> addPost({required int userId, String content = ''}) async {
    addPost(userId: userId);
  }

  Future<void> editPost({
    required int userId,
    required int postId,
    String content = '',
  }) async {
    editPost(userId: userId, postId: postId);
  }

  Future<void> deletePost({
    required int userId,
    required int postId,
  }) async {
    editPost(userId: userId, postId: postId);
  }

  Future<void> likeAndDislike({
    required int userId,
    required int postId,
  }) async {
    likeAndDislike(userId: userId, postId: postId);
  }

  Future<List<PostModel>> getPostsList({
    required int userId,
    bool random = true,
  }) async {
    return getPostsList(userId: userId);
  }

  Future<PostModel> getSinglePost({
    required int userId,
    required int postId,
  }) async {
    return getSinglePost(userId: userId, postId: postId);
  }

  Future<void> postFileUpload({
    required int userId,
    required int postId,
    required List<String> file,
  }) async {
    getSinglePost(userId: userId, postId: postId);
  }

  Future<PostModel> postFileDelete({
    required int userId,
    required int fileId,
  }) async {
    return postFileDelete(userId: userId, fileId: fileId);
  }

  Future<PostModel> getFiles({
    required int userId,
    required int postId,
  }) async {
    return getFiles(userId: userId, postId: postId);
  }
}

class RemotePostSrc implements IPostSrc {
  final Dio httpClient;
  RemotePostSrc(this.httpClient);

  @override
  Future<void> addPost({required int userId, String content = ''}) async {
    final response = await httpClient.post(
      RemoteConstants.postAdd,
      data: {
        RemoteKey.userId: userId,
        RemoteKey.content: content,
      },
    );
    HttpResponseHandler(
      response: response,
    ).validate();
  }

  @override
  Future<void> deletePost({required int userId, required int postId}) async {
    final response = await httpClient.post(
      RemoteConstants.deletePost,
      data: {
        RemoteKey.userId: userId,
        RemoteKey.postId: postId,
      },
    );
    HttpResponseHandler(
      response: response,
    ).validate();
  }

  @override
  Future<void> editPost({
    required int userId,
    required int postId,
    String content = '',
  }) async {
    final response = await httpClient.post(
      RemoteConstants.editPost,
      data: {
        RemoteKey.userId: userId,
        RemoteKey.postId: postId,
        RemoteKey.content: content,
      },
    );
    HttpResponseHandler(
      response: response,
    ).validate();
  }

  @override
  Future<PostModel> getFiles({required int userId, required int postId}) {
    // TODO: implement getFiles
    throw UnimplementedError();
  }

  @override
  Future<PostModel> getSinglePost({
    required int userId,
    required int postId,
  }) async {
    PostModel postModel = PostModel.empty();

    final response = await httpClient.get(
      RemoteConstants.getSinglePost,
      queryParameters: {'user_id': userId, 'post_id': postId},
    );

    HttpResponseHandler(
      response: response,
      on200: () {
        postModel = PostModel.fromMapJson(response.data);
      },
    ).validate();
    return postModel;
  }

  @override
  Future<List<PostModel>> getPostsList({
    required int userId,
    bool random = true,
  }) async {
    List<PostModel> postModelList = [];

    final response = await httpClient.get(
      RemoteConstants.getPostList,
      queryParameters: {'user_id': userId, 'random': random},
    );
    HttpResponseHandler(
      response: response,
      on200: () {
        for (var post in (response.data as List)) {
          postModelList.add(PostModel.fromMapJson(post));
        }
      },
    ).validate();

    return postModelList;
  }

  @override
  Future<void> likeAndDislike({
    required int userId,
    required int postId,
  }) async {
    final response = await httpClient.post(
      RemoteConstants.likePost,
      data: {
        RemoteKey.userId: userId,
        RemoteKey.postId: postId,
      },
    );
    HttpResponseHandler(
      response: response,
    ).validate();
  }

  @override
  Future<PostModel> postFileDelete({
    required int userId,
    required int fileId,
  }) async {
    PostModel postModel = PostModel.empty();

    final response = await httpClient.post(
      RemoteConstants.deleteFile,
      data: {
        RemoteKey.userId: userId,
        RemoteKey.fileId: fileId,
      },
    );
    HttpResponseHandler(
      response: response,
      on200: () {
        postModel = PostModel.fromMapJson(response.data);
      },
    ).validate();
    return postModel;
  }

  @override
  Future<void> postFileUpload({
    required int userId,
    required int postId,
    required List<String> file,
  }) async {
    final response = await httpClient.post(
      RemoteConstants.uploadFile,
      data: {
        RemoteKey.userId: userId,
        RemoteKey.postId: postId,
        RemoteKey.file: file,
      },
    );
    HttpResponseHandler(
      response: response,
    ).validate();
  }
}
