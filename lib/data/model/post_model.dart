class PostModel {
   Info info;
   List<String> files;

   PostModel(
    this.info,
    this.files,
  );

  factory PostModel.fromMapJson(Map<String, dynamic> json) {
    return PostModel(
      Info.fromMapJson(json['data']['info']),
      json['data']['files'],
    );
  }
}

class Info {
  String id;
  String content;
  String likes;
  String views;
  String userId;

  Info(
    this.id,
    this.content,
    this.likes,
    this.views,
    this.userId,
  );

  factory Info.fromMapJson(Map<String, dynamic> jsonObject) {
    return Info(
      jsonObject['id'],
      jsonObject['content'],
      jsonObject['likes'],
      jsonObject['views'],
      jsonObject['user_id'],
    );
  }
}
