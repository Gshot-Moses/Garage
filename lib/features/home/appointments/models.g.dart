// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAppointmentsApiResponse _$GetAppointmentsApiResponseFromJson(
        Map<String, dynamic> json) =>
    GetAppointmentsApiResponse(
      id: json['id'] as String,
      updatedAt: json['UpdatedAt'] as String,
      createdAt: json['CreatedAt'] as String,
      customerId: json['customer_id'] as String,
      locationId: json['location_id'] as String,
      serviceId: json['service_id'] as String,
    );

Map<String, dynamic> _$GetAppointmentsApiResponseToJson(
        GetAppointmentsApiResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'customer_id': instance.customerId,
      'location_id': instance.locationId,
      'service_id': instance.serviceId,
    };
