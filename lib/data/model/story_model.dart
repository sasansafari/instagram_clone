class StoryModel {
  late int id;
  late int userId;
  late String profilePic;
  late String imageUrl;

  StoryModel({
    required this.id,
    required this.userId,
    required this.profilePic,
    required this.imageUrl,
  });

  StoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    profilePic = json['profilePic'];
    imageUrl = json['imageUrl'];
  }
}
