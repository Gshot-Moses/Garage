import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class UserInfo {

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

  UserInfo({
    required this.createdAt,
    required this.updatedAt,
    required this.email,
    required this.id,
    required this.externalId,
    required this.firstName,
    required this.lastName
  });

  static fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}