// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_remote_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CompanyRemoteApi extends CompanyRemoteApi {
  _$CompanyRemoteApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CompanyRemoteApi;

  @override
  Future<Response<dynamic>> getCompanies() {
    final Uri $url = Uri.parse('/companies');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
