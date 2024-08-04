import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class SignUpResponse {
  final String username;
  final String email;
  final String accessToken;
  final String refreshToken;

  SignUpResponse({
    required this.username,
    required this.email,
    required this.accessToken,
    required this.refreshToken
  });

  static fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);
}