
import '../gen/assets.gen.dart';

class StoryData {
  final int id;
  final String name;
  final String imageFileName;
  final bool hasStory;
  final bool isViewed;
  final bool hasLive;

  StoryData({
    required this.id,
    required this.name,
    required this.imageFileName,
    required this.hasStory,
    required this.isViewed,
    required this.hasLive,
  });
}

class StoriesDatabase {
  static List<StoryData> get stories {
    return [
      StoryData(
        id: 1001,
        name: 'Your Story',
        imageFileName: Assets.images.stories.stories1.path,
        hasStory: true,
        isViewed: false,
        hasLive: false,
      ),
      StoryData(
        id: 1002,
        name: 'karennne',
        imageFileName: Assets.images.stories.stories10.path,
        hasStory: true,
        isViewed: false,
        hasLive: true,
      ),
      StoryData(
        id: 1003,
        name: 'zackjohn',
        imageFileName: Assets.images.stories.stories2.path,
        hasStory: true,
        isViewed: false,
        hasLive: false,
      ),
      StoryData(
        id: 1004,
        name: 'kieron_d',
        imageFileName: Assets.images.stories.stories9.path,
        hasStory: true,
        isViewed: false,
        hasLive: false,
      ),
      StoryData(
        id: 1005,
        name: 'craig_love',
        imageFileName: Assets.images.stories.stories12.path,
        hasStory: true,
        isViewed: false,
        hasLive: false,
      ),
      StoryData(
        id: 1006,
        name: 'jamie.franc',
        imageFileName: Assets.images.stories.stories4.path,
        hasStory: true,
        isViewed: false,
        hasLive: false,
      ),
      StoryData(
        id: 1007,
        name: 'maxjacob',
        imageFileName: Assets.images.stories.stories5.path,
        hasStory: true,
        isViewed: false,
        hasLive: false,
      ),
      StoryData(
        id: 1008,
        name: 'andrewww_',
        imageFileName: Assets.images.stories.stories6.path,
        hasStory: true,
        isViewed: false,
        hasLive: false,
      ),
      StoryData(
        id: 1009,
        name: 'mersad.dev',
        imageFileName: Assets.images.stories.stories0.path,
        hasStory: true,
        isViewed: false,
        hasLive: false,
      ),
      StoryData(
        id: 1010,
        name: 'joshua_l',
        imageFileName: Assets.images.stories.stories8.path,
        hasStory: true,
        isViewed: false,
        hasLive: false,
      ),
      StoryData(
        id: 1011,
        name: 'm_humph',
        imageFileName: Assets.images.stories.stories3.path,
        hasStory: true,
        isViewed: true,
        hasLive: false,
      ),
      StoryData(
        id: 1012,
        name: 'martini',
        imageFileName: Assets.images.stories.stories7.path,
        hasStory: true,
        isViewed: true,
        hasLive: false,
      ),
      StoryData(
        id: 1013,
        name: 'mis_potter',
        imageFileName: Assets.images.stories.stories11.path,
        hasStory: true,
        isViewed: true,
        hasLive: false,
      ),
    ];
  }
}
 