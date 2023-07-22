

import 'package:tec/data/model/post_model.dart';
import 'package:tec/data/src/post_src.dart';

abstract class IPostReop{
  Future<List<PostModel>> getPosts(param);
  Future<List<PostModel>> getFiles(param);
}


class PostRepo implements  IPostReop{
  final IPostSrc src;

  PostRepo({required this.src});

  @override
  Future<List<PostModel>> getFiles(param) {
    // TODO: implement getFiles
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getPosts(param) {
    return src.getPosts(param);
  }
}