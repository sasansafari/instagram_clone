import 'package:tec/data/model/post_model.dart';
import 'package:tec/data/src/post_src.dart';

abstract class IPostRepo implements IPostSrc{}

class PostRepo implements IPostRepo{

  final IPostSrc dataSource;
  PostRepo(this.dataSource);


  @override
  Future<void> addPost({required int userId, String content = ''}) =>
      dataSource.addPost(userId: userId);


  @override
  Future<void> deletePost({required int userId, required int postId}) =>
      dataSource.deletePost(userId: userId, postId: postId);

  @override
  Future<void> editPost({required int userId, required int postId, String content = ''}) =>
      dataSource.editPost(userId: userId, postId: postId);

  @override
  Future<PostModel> getFiles({required int userId, required int postId}) =>
      dataSource.getFiles(userId: userId, postId: postId);

  @override
  Future<PostModel> getSinglePost({required int userId, required int postId}) =>
      dataSource.getSinglePost(userId: userId, postId: postId);

  @override
  Future<List<PostModel>> getPostsList({required int userId, bool random = true}) =>
      dataSource.getPostsList(userId: userId);

  @override
  Future<void> likeAndDislike({required int userId, required int postId}) =>
      dataSource.likeAndDislike(userId: userId, postId: postId);

  @override
  Future<PostModel> postFileDelete({required int userId, required int fileId}) =>
      dataSource.postFileDelete(userId: userId, fileId: fileId);

  @override
  Future<void> postFileUpload({required int userId, required int postId, required List<String> file}) =>
      dataSource.postFileUpload(userId: userId, postId: postId, file: file);
}