// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      createdAt: json['CreatedAt'] as String,
      updatedAt: json['UpdatedAt'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
      externalId: json['external_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'CreatedAt': instance.createdAt,
      'email': instance.email,
      'external_id': instance.externalId,
      'first_name': instance.firstName,
      'id': instance.id,
      'last_name': instance.lastName,
      'UpdatedAt': instance.updatedAt,
    };
