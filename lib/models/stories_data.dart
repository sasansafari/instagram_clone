import '../gen/assets.gen.dart';

class StoryData {
  final int id;
  final String name;
  final String imageFileName;
  final bool isViewed;
  final bool isLive;

  StoryData({
    required this.id,
    required this.name,
    required this.imageFileName,
    required this.isViewed,
    required this.isLive,
  });
}

class StoriesDatabase {
  static List<StoryData> get stories {
    return [
      StoryData(
        id: 1001,
        name: 'Your Story',
        imageFileName: Assets.images.stories.stories1.path,
        isViewed: false,
        isLive: false,
      ),
      StoryData(
        id: 1002,
        name: 'karennne',
        imageFileName: Assets.images.stories.stories10.path,
        isViewed: false,
        isLive: true,
      ),
      StoryData(
        id: 1003,
        name: 'zackjohn',
        imageFileName: Assets.images.stories.stories2.path,
        isViewed: false,
        isLive: false,
      ),
      StoryData(
        id: 1004,
        name: 'kieron_d ',
        imageFileName: Assets.images.stories.stories9.path,
        isViewed: false,
        isLive: false,
      ),
      StoryData(
        id: 1005,
        name: 'jamie.franc',
        imageFileName: Assets.images.stories.stories4.path,
        isViewed: false,
        isLive: false,
      ),
      StoryData(
        id: 1006,
        name: 'maxjacob',
        imageFileName: Assets.images.stories.stories5.path,
        isViewed: false,
        isLive: false,
      ),
      StoryData(
        id: 1007,
        name: 'andrewww_',
        imageFileName: Assets.images.stories.stories6.path,
        isViewed: false,
        isLive: false,
      ),
      StoryData(
        id: 1008,
        name: 'mersad.dev',
        imageFileName: Assets.images.stories.stories0.path,
        isViewed: false,
        isLive: false,
      ),
      StoryData(
        id: 1009,
        name: 'joshua_l',
        imageFileName: Assets.images.stories.stories8.path,
        isViewed: false,
        isLive: false,
      ),
      StoryData(
        id: 1010,
        name: 'm_humph',
        imageFileName: Assets.images.stories.stories3.path,
        isViewed: true,
        isLive: false,
      ),
      StoryData(
        id: 1011,
        name: 'martini',
        imageFileName: Assets.images.stories.stories7.path,
        isViewed: true,
        isLive: false,
      ),
    ];
  }
}
