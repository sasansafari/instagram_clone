
class PostModel {

  late int id;
  late String userNameId;
  late List<String> imagesUrl;
  late String profilePic;
  late String firstLike;
  late String otherLikes;
  late String shortCaption;
  late String location;

  PostModel({
    required this.id,
    required this.userNameId,
    required this.imagesUrl,
    required this.profilePic,
    required this.firstLike,
    required this.otherLikes,
    required this.shortCaption,
    required this.location,
  });

  PostModel.fromJson(Map<String,dynamic> element){
    id = element['id'];
    userNameId=element['userNameId'];
    imagesUrl=element['imagesUrl'];
    profilePic=element['profilePic'];
    firstLike=element['firstLike'];
    otherLikes=element['otherLikes'];
    shortCaption=element['shortCaption'];
    location=element['location'];
  }

}
