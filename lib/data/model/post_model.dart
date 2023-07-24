class PostModel {
  String id;
  String content;
  int likes;
  int views;
  String userId;
  DateTime createdAt;

  PostModel({
    required this.id,
    required this.content,
    required this.likes,
    required this.views,
    required this.userId,
    required this.createdAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      content: json['content'],
      likes: int.parse(json['likes']),
      views: int.parse(json['views']),
      userId: json['user_id'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(int.parse(json['create_at']) * 1000),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'likes': likes.toString(),
      'views': views.toString(),
      'user_id': userId,
      'create_at': (createdAt.millisecondsSinceEpoch ~/ 1000).toString(),
    };
  }
}