import 'dart:convert';

//! i didn't used this model in repository because we dont have state management yet
class AuthModel {
  final String verifyToken;
  final int userId;
  final String? authToken;
  AuthModel({
    required this.verifyToken,
    required this.userId,
    this.authToken,
  });

  AuthModel copyWith({
    String? verifyToken,
    int? userId,
    String? authToken,
  }) {
    return AuthModel(
      verifyToken: verifyToken ?? this.verifyToken,
      userId: userId ?? this.userId,
      authToken: authToken ?? this.authToken,
    );
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      verifyToken: map['verify_token'] ?? '',
      userId: map['user_id']?.toInt() ?? 0,
      authToken: map['auth_token'],
    );
  }

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AuthModel(verifyToken: $verifyToken, userId: $userId, authToken: $authToken)';
}
