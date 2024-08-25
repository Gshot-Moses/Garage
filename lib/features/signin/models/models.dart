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

@JsonSerializable()
class GetCurrentUserResponse {

  @JsonKey(name: "CreatedAt")
  final String createdAt;

  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "external_id")
  final String externalId;

  @JsonKey(name: "first_name")
  final String firstName;

  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "last_name")
  final String lastName;

  @JsonKey(name: "UpdatedAt")
  final String updatedAt;

  GetCurrentUserResponse({
    required this.createdAt,
    required this.updatedAt,
    required this.email,
    required this.id,
    required this.externalId,
    required this.firstName,
    required this.lastName
  });

  static fromJson(Map<String, dynamic> json) => _$GetCurrentUserResponseFromJson(json);
}