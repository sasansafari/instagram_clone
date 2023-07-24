import 'package:dio/dio.dart';

import '../model/story_model.dart';

abstract class IStorySrc {
  Future<List<StoryModel>> getStories(param);
}

class StoryRemoteSrc implements IStorySrc {
  final Dio http;
  StoryRemoteSrc({required this.http});

  @override
  Future<List<StoryModel>> getStories(param) {
    List<StoryModel> list = [];

    http.get('/api/v1/post/getposts?user_id=&random=true').then((value) {
      if (value.statusCode == 200) {
        for (var element in value.data as List) {
          list.add(StoryModel.fromJson(element));
        }
      }
    });

    return Future.value(list);
  }
}

class StoryDbSrc implements IStorySrc {
  @override
  Future<List<StoryModel>> getStories(param) {
    // TODO: implement getStory
    throw UnimplementedError();
  }
}
