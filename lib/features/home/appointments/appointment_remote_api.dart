import 'package:chopper/chopper.dart';

part 'appointment_remote_api.chopper.dart';

@ChopperApi(baseUrl: "")
abstract class AppointmentRemoteApi extends ChopperService {

  static AppointmentRemoteApi create({ChopperClient? client}) => _$AppointmentRemoteApi(client);

  @Get(path: "/api/appointments")
  Future<Response> getAppointments();
}