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
    try {
      var response = await _apiService.getAppointments();
      if (response.isSuccessful) {
        List<dynamic> body = jsonDecode(response.bodyString);
        final appointments = GetAppointmentsApiResponse.fromList(body.cast<Map<String, dynamic>>());
        _state.value = _state.value.copy(isLoading: false, appointments: appointments);
      } else {
        _state.value = _state.value.copy(isLoading: false, hasError: true);
      }
    } catch (e) {
      _state.value = _state.value.copy(isLoading: false, hasError: true);
    }
  }

  void onRetry() {
    getAppointments();
  }
}