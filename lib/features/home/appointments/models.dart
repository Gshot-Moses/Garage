import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class GetAppointmentsApiResponse {
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "CreatedAt")
  final String createdAt;

  @JsonKey(name: "UpdatedAt")
  final String updatedAt;

  @JsonKey(name: "customer_id")
  final String customerId;

  @JsonKey(name: "location_id")
  final String locationId;

  @JsonKey(name: "service_id")
  final String serviceId;

  GetAppointmentsApiResponse({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.customerId,
    required this.locationId,
    required this.serviceId
  });

  static fromJson(Map<String, dynamic> json) => _$GetAppointmentsApiResponseFromJson(json);

  static List<GetAppointmentsApiResponse> fromList(List<Map<String, dynamic>> values) {
    return values.map((element) => _$GetAppointmentsApiResponseFromJson(element)).toList();
  }
}