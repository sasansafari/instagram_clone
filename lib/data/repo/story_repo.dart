import 'package:tec/data/src/story_src.dart';

import '../model/story_model.dart';

abstract class IStoryRepo implements IStorySrc {}

class StoryRepo implements IStoryRepo {
  final IStorySrc src;

  StoryRepo({required this.src});

  @override
  Future<List<StoryModel>> getStories({
    required int userId,
    bool random = true,
  }) async =>
      getStories(userId: userId);
}
