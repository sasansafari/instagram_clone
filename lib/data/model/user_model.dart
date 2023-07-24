class UserModel {
  final int userId;
  final String userName;
  final int fullName;
  final int email;
  final int phone;
  final int userAvatar;

  UserModel(
    this.userId,
    this.userName,
    this.fullName,
    this.email,
    this.phone,
    this.userAvatar,
  );
  UserModel.fromJson(Map<String, dynamic> json)
      : userId = json['id'],
        userName = json['username'],
        fullName = json['full_name'],
        email = json['email'],
        phone = json['phone'],
        userAvatar = json['user_avatar'];
}
