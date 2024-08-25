// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      username: json['username'] as String,
      email: json['email'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

GetCurrentUserResponse _$GetCurrentUserResponseFromJson(
        Map<String, dynamic> json) =>
    GetCurrentUserResponse(
      createdAt: json['CreatedAt'] as String,
      updatedAt: json['UpdatedAt'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
      externalId: json['external_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );

Map<String, dynamic> _$GetCurrentUserResponseToJson(
        GetCurrentUserResponse instance) =>
    <String, dynamic>{
      'CreatedAt': instance.createdAt,
      'email': instance.email,
      'external_id': instance.externalId,
      'first_name': instance.firstName,
      'id': instance.id,
      'last_name': instance.lastName,
      'UpdatedAt': instance.updatedAt,
    };
