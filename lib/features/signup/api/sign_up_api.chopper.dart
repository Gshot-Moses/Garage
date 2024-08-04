// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SignUpService extends SignUpService {
  _$SignUpService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SignUpService;

  @override
  Future<Response<dynamic>> signUp(Map<String, dynamic> data) {
    final Uri $url = Uri.parse('/signup');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
