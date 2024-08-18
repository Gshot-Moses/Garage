// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyApiResponse _$CompanyApiResponseFromJson(Map<String, dynamic> json) =>
    CompanyApiResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      addressLine1: json['address_line_1'] as String,
      addressLine2: json['address_line_2'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      postalCode: json['postal_code'] as String,
      state: json['state'] as String,
      website: json['website'] as String,
      createdAt: json['CreatedAt'] as String,
      updatedAt: json['UpdatedAt'] as String,
    );

Map<String, dynamic> _$CompanyApiResponseToJson(CompanyApiResponse instance) =>
    <String, dynamic>{
      'address_line_1': instance.addressLine1,
      'address_line_2': instance.addressLine2,
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
      'email': instance.email,
      'phone': instance.phone,
      'postal_code': instance.postalCode,
      'state': instance.state,
      'website': instance.website,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
    };
