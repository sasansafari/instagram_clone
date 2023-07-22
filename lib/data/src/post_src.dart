 

import 'package:dio/dio.dart';
import 'package:tec/data/model/post_model.dart';

abstract class IPostSrc {
  Future<List<PostModel>> getPosts(param);
  Future<List<PostModel>> getFiles(param);
}

class PostRemoteSrc implements IPostSrc {
  final Dio http;
  PostRemoteSrc({required this.http});

  @override
  Future<List<PostModel>> getFiles(param) {
    // TODO: implement getFiles
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getPosts(param) {
    List<PostModel> list = [];
    http.get("/api/v1/post/getposts?user_id=&random=true").then((value) {
      if (value.statusCode == 200) {
        for (var element in value.data as List) {
          list.add(PostModel.fromJson(element));
        }
      }
    });

    return Future.value(list);
  }
}

class PostDbSrc implements IPostSrc {
  @override
  Future<List<PostModel>> getFiles(param) {
    // TODO: implement getFiles
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getPosts(param) {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
