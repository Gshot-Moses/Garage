// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_remote_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AppointmentRemoteApi extends AppointmentRemoteApi {
  _$AppointmentRemoteApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AppointmentRemoteApi;

  @override
  Future<Response<dynamic>> getAppointments() {
    final Uri $url = Uri.parse('/api/appointments');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
