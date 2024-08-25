import 'dart:convert';

import 'package:garage/features/home/appointments/appointment_state.dart';
import 'package:garage/features/home/appointments/models.dart';
import 'package:get/get.dart';

import 'appointment_remote_api.dart';

class AppointmentController extends GetxController {
  final AppointmentRemoteApi _apiService = Get.find<AppointmentRemoteApi>();

  AppointmentController();

  final Rx<AppointmentState> _state = const AppointmentState().obs;

  AppointmentState get state => _state.value;


  @override
  void onInit() {
    super.onInit();
    getAppointments();
  }

  Future<void> getAppointments() async {
    _state.value = _state.value.copy(isLoading: true);
    var response = await _apiService.getAppointments();
    if (response.isSuccessful) {
      print(response.bodyString);
      List<dynamic> body = jsonDecode(response.bodyString);
      final companies = GetAppointmentsApiResponse.fromList(body.cast<Map<String, dynamic>>());
      _state.value = _state.value.copy(isLoading: false, appointments: companies);
    } else {
      print(response.error);
      _state.value = _state.value.copy(isLoading: false, hasError: true);
    }
  }
}