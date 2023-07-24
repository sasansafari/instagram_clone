class UserModel {
  final int userId;
  final String userName;
  final String? fullName;
  final String email;
  final int? phone;
  final String? userAvatar;
  final String veryfyToken;
  final String? activeToken;
  final String password;

  UserModel(
    this.userId,
    this.userName,
    this.fullName,
    this.email,
    this.phone,
    this.userAvatar,
    this.veryfyToken,
    this.activeToken,
    this.password,
  );
  UserModel.fromJson(Map<String, dynamic> json)
      : userId = json['id'],
        userName = json['username'],
        fullName = json['full_name'],
        email = json['user_email'],
        phone = json['phone'],
        userAvatar = json['user_avatar'],
        veryfyToken = json['veryfy_token'],
        activeToken = json['active_token'],
        password = json['password'];
}
