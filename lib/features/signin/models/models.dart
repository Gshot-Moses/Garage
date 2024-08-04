import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class LoginResponse {
  final String username;
  final String email;
  final String accessToken;
  final String refreshToken;

  LoginResponse({
    required this.username,
    required this.email,
    required this.accessToken,
    required this.refreshToken
  });

  static fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}