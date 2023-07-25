import 'dart:convert';

class AuthModel {
  final String verifyToken;
  final int userId;
  final String? activeToken;
  AuthModel({
    required this.verifyToken,
    required this.userId,
    this.activeToken,
  });

  AuthModel copyWith({
    String? verifyToken,
    int? userId,
    String? activeToken,
  }) {
    return AuthModel(
      verifyToken: verifyToken ?? this.verifyToken,
      userId: userId ?? this.userId,
      activeToken: activeToken ?? this.activeToken,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'verifyToken': verifyToken});
    result.addAll({'userId': userId});
    if (activeToken != null) {
      result.addAll({'activeToken': activeToken});
    }

    return result;
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      verifyToken: map['verify_token'] ?? '',
      userId: map['user_id']?.toInt() ?? 0,
      activeToken: map['active_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AuthModel(verifyToken: $verifyToken, userId: $userId, activeToken: $activeToken)';
}
