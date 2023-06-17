import 'package:tec/gen/assets.gen.dart';

class PostsModel {
  final int id;
  final String userNameId;
  final List<String> imagesUrl;
  final String profilePic;
  final String firstLike;
  final String otherLikes;
  final String shortCaption;
  final String location;
  PostsModel({
    required this.id,
    required this.userNameId,
    required this.imagesUrl,
    required this.profilePic,
    required this.firstLike,
    required this.otherLikes,
    required this.shortCaption,
    required this.location,
  });
}

class PostsDatabase {
  static List<PostsModel> get posts {
    return [
      PostsModel(
        id: 1,
        userNameId: 'mahdyar',
        imagesUrl: [
          Assets.images.item0.keyName,
          Assets.images.item1.keyName,
        ],
        profilePic: Assets.images.profilePicture.keyName,
        firstLike: 'karennne',
        otherLikes: '23,326',
        shortCaption:
            'The game in Japan was amazing and I want to share some photos',
        location: 'Tokyo, Japan',
      ),
      PostsModel(
        id: 424,
        userNameId: 'karennne',
        imagesUrl: [
          Assets.images.item10.keyName,
        ],
        profilePic: Assets.images.profilePicture.keyName,
        firstLike: 'karennne',
        otherLikes: '23,326',
        shortCaption:
            'The game in Japan was amazing and I want to share some photos',
        location: 'Tokyo, Japan',
      ),
      PostsModel(
        id: 5654,
        userNameId: 'zackjohn',
        imagesUrl: [
          Assets.images.item0.keyName,
          Assets.images.item11.keyName,
          Assets.images.item12.keyName,
        ],
        profilePic: Assets.images.profilePicture.keyName,
        firstLike: 'karennne',
        otherLikes: '23,326',
        shortCaption:
            'The game in Japan was amazing and I want to share some photos',
        location: 'Tokyo, Japan',
      ),
      PostsModel(
        id: 45,
        userNameId: 'kieron_d',
        imagesUrl: [
          Assets.images.item13.keyName,
          Assets.images.item14.keyName,
          Assets.images.item15.keyName,
        ],
        profilePic: Assets.images.profilePicture.keyName,
        firstLike: 'karennne',
        otherLikes: '23,326',
        shortCaption:
            'The game in Japan was amazing and I want to share some photos',
        location: 'Tokyo, Japan',
      ),
      PostsModel(
        id: 78,
        userNameId: 'craig_love',
        imagesUrl: [
          Assets.images.item18.keyName,
          Assets.images.item0.keyName,
        ],
        profilePic: Assets.images.profilePicture.keyName,
        firstLike: 'karennne',
        otherLikes: '23,326',
        shortCaption:
            'The game in Japan was amazing and I want to share some photos',
        location: 'Tokyo, Japan',
      ),
      PostsModel(
        id: 56,
        userNameId: 'jamie.franc',
        imagesUrl: [
          Assets.images.item19.keyName,
        ],
        profilePic: Assets.images.profilePicture.keyName,
        firstLike: 'karennne',
        otherLikes: '23,326',
        shortCaption:
            'The game in Japan was amazing and I want to share some photos',
        location: 'Tokyo, Japan',
      ),
      PostsModel(
        id: 44,
        userNameId: 'maxjacob',
        imagesUrl: [
          Assets.images.item0.keyName,
        ],
        profilePic: Assets.images.profilePicture.keyName,
        firstLike: 'karennne',
        otherLikes: '23,326',
        shortCaption:
            'The game in Japan was amazing and I want to share some photos',
        location: 'Tokyo, Japan',
      ),
      PostsModel(
        id: 123,
        userNameId: 'andrewww_',
        imagesUrl: [
          Assets.images.item0.keyName,
        ],
        profilePic: Assets.images.profilePicture.keyName,
        firstLike: 'karennne',
        otherLikes: '23,326',
        shortCaption:
            'The game in Japan was amazing and I want to share some photos',
        location: 'Tokyo, Japan',
      ),
      PostsModel(
        id: 687,
        userNameId: 'mersad.dev',
        imagesUrl: [
          Assets.images.item0.keyName,
        ],
        profilePic: Assets.images.profilePicture.keyName,
        firstLike: 'karennne',
        otherLikes: '23,326',
        shortCaption:
            'The game in Japan was amazing and I want to share some photos',
        location: 'Tokyo, Japan',
      ),
      PostsModel(
        id: 45,
        userNameId: 'joshua_l',
        imagesUrl: [
          Assets.images.item0.keyName,
        ],
        profilePic: Assets.images.profilePicture.keyName,
        firstLike: 'karennne',
        otherLikes: '23,326',
        shortCaption:
            'The game in Japan was amazing and I want to share some photos',
        location: 'Tokyo, Japan',
      ),
      PostsModel(
        id: 78,
        userNameId: 'm_humph',
        imagesUrl: [
          Assets.images.item0.keyName,
        ],
        profilePic: Assets.images.profilePicture.keyName,
        firstLike: 'karennne',
        otherLikes: '23,326',
        shortCaption:
            'The game in Japan was amazing and I want to share some photos',
        location: 'Tokyo, Japan',
      ),
    ];
  }
}
