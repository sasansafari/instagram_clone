import 'package:tec/data/src/story_src.dart';

import '../model/story_model.dart';

abstract class IStoryRepo {
  Future<List<StoryModel>> getStories(param);
}

class StoryRepo implements IStoryRepo {
  final IStorySrc src;

  StoryRepo({required this.src});

  @override
  Future<List<StoryModel>> getStories(param) {
    // TODO: implement getStory
    throw UnimplementedError();
  }
}
