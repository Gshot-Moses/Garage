import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class CompanyApiResponse {
  @JsonKey(name: "address_line_1")
  final String addressLine1;

  @JsonKey(name: "address_line_2")
  final String addressLine2;

  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "city")
  final String city;

  @JsonKey(name: "country")
  final String country;

  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "phone")
  final String phone;

  @JsonKey(name: "postal_code")
  final String postalCode;

  @JsonKey(name: "state")
  final String state;

  @JsonKey(name: "website")
  final String website;

  @JsonKey(name: "CreatedAt")
  final String createdAt;

  @JsonKey(name: "UpdatedAt")
  final String updatedAt;

  CompanyApiResponse({
    required this.id,
    required this.name,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.country,
    required this.email,
    required this.phone,
    required this.postalCode,
    required this.state,
    required this.website,
    required this.createdAt,
    required this.updatedAt,
  });

  static fromJson(Map<String, dynamic> json) => _$CompanyApiResponseFromJson(json);

  static List<CompanyApiResponse> fromList(List<Map<String, dynamic>> values) {
    print(values);
    print(values[0]["address_line_1"]);
    return values.map((element) => _$CompanyApiResponseFromJson(element)).toList();
  }
}