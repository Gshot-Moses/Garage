// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SignInService extends SignInService {
  _$SignInService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SignInService;

  @override
  Future<Response<dynamic>> login(Map<String, dynamic> data) {
    final Uri $url = Uri.parse('/signin');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUserInfo() {
    final Uri $url = Uri.parse('/users/me');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
