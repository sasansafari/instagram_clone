import 'package:dio/dio.dart';
import 'package:tec/common/response_validator.dart';
import 'package:tec/data/model/post_model.dart';

abstract class IPostSrc {
  Future<void> addPost({required int userId, String content = ''}) async {
    addPost(userId: userId);
  }
  Future<void> editPost({required int userId, required int postId, String content = ''}) async {
    editPost(userId: userId, postId: postId);
  }
  Future<void> deletePost({required int userId, required int postId,}) async {
    editPost(userId: userId, postId: postId);
  }
  Future<void> likeAndDislike({required int userId, required int postId,}) async {
    likeAndDislike(userId: userId, postId: postId);
  }
  Future<List<PostModel>> getPosts({required int userId, bool random = true,}) async {
    return getPosts(userId: userId);
  }
  Future<PostModel> getPost({required int userId, required int postId,}) async {
    return getPost(userId: userId, postId: postId);
  }
  Future<void> postFileUpload({required int userId, required int postId,required List<String> file}) async {
     getPost(userId: userId, postId: postId);
  }
  Future<PostModel> postFileDelete({required int userId, required int fileId,}) async {
    return postFileDelete(userId: userId, fileId: fileId);
  }
  Future<PostModel> getFiles({required int userId, required int postId,}) async {
    return getFiles(userId: userId, postId: postId);
  }
}

class RemotePostSrc with HttpResponseValidator implements IPostSrc {

  final Dio httpClient;
  RemotePostSrc(this.httpClient);



  @override
  Future<void> addPost({required int userId, String content = ''}) async {
    final response = await httpClient.post(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/post/add',
      data: {
        'user_id': userId,
        'content' : content,
      },
    );
    validateResponse(response);
  }

  @override
  Future<void> deletePost({required int userId, required int postId}) async{
    final response = await httpClient.post(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/post/delete',
      data: {
        'user_id': userId,
        'post_id': postId,
      },
    );
    validateResponse(response);
  }

  @override
  Future<void> editPost({required int userId, required int postId, String content = ''}) async{
    final response = await httpClient.post(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/post/edit',
      data: {
        'user_id': userId,
        'post_id': postId,
        'content' : content,
      },
    );
    validateResponse(response);
  }

  @override
  Future<PostModel> getFiles({required int userId, required int postId}) {
    // TODO: implement getFiles
    throw UnimplementedError();
  }

  @override
  Future<PostModel> getPost({required int userId, required int postId}) async{
    final response = await httpClient.get(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/post/getpost?user_id=19&post_id=',
    );
    validateResponse(response);
    return PostModel.fromMapJson(response.data);
  }

  @override
  Future<List<PostModel>> getPosts({required int userId, bool random = true}) async{
    final response = await httpClient.get(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/post/getposts?user_id=$userId&random=$random',
    );
    validateResponse(response);
    List<PostModel> posts = [];
    for (var post in (response.data as List)) {
      posts.add(PostModel.fromMapJson(post));
    }
    return posts;
  }

  @override
  Future<void> likeAndDislike({required int userId, required int postId}) async{
    final response = await httpClient.post(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/post/like',
      data: {
        'user_id': userId,
        'post_id': postId,
      },
    );
    validateResponse(response);
  }

  @override
  Future<PostModel> postFileDelete({required int userId, required int fileId}) async{
    final response = await httpClient.post(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/post/deletefile',
      data: {
        'user_id': userId,
        'file_id': fileId,
      },
    );
    validateResponse(response);
    return PostModel.fromMapJson(response.data);
  }

  @override
  Future<void> postFileUpload({required int userId, required int postId, required List<String> file}) async{
    final response = await httpClient.post(
      'https://maktabkhoneh-api.sasansafari.com/api/v1/post/fileupload',
      data: {
        'user_id': userId,
        'post_id': postId,
        'file': file,
      },
    );
    validateResponse(response);
  }
}

