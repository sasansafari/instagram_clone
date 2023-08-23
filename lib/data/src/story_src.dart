import 'package:dio/dio.dart';
import 'package:tec/common/http_error_handler.dart';
import 'package:tec/data/constant.dart';

import '../model/story_model.dart';

abstract class IStorySrc {
  Future<List<StoryModel>> getStories({
    required int userId,
    bool random = true,
  }) async =>
      getStories(userId: userId);
}

class StoryRemoteSrc implements IStorySrc {
  final Dio http;
  StoryRemoteSrc({required this.http});

  @override
  Future<List<StoryModel>> getStories({
    required int userId,
    bool random = true,
  }) async {
    List<StoryModel> storyModelList = [];

    final response = await http.get(
      RemoteConstants.getPostList,
      queryParameters: {'user_id': userId, 'random': random},
    );
    HttpResponseHandler(
      response: response,
      on200: () {
        for (var storyItem in (response.data as List)) {
          storyModelList.add(StoryModel.fromJson(storyItem));
        }
      },
    ).validate();

    return storyModelList;
  }
}

class StoryDbSrc implements IStorySrc {
  final Dio httpClient;

  StoryDbSrc(this.httpClient);
  @override
  Future<List<StoryModel>> getStories({
    required int userId,
    bool random = true,
  }) async {
    List<StoryModel> storyModelList = [];

    final response = await httpClient.get(
      RemoteConstants.getStoryList,
      queryParameters: {'user_id': userId, 'random': random},
    );
    HttpResponseHandler(
      response: response,
      on200: () {
        for (var storyItem in (response.data as List)) {
          storyModelList.add(StoryModel.fromJson(storyItem));
        }
      },
    ).validate();

    return storyModelList;
  }
}
