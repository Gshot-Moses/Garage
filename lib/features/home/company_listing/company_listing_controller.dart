import 'dart:convert';

import 'package:garage/features/home/company_listing/company_listing_state.dart';
import 'package:garage/features/home/company_listing/company_remote_api.dart';
import 'package:garage/features/home/company_listing/models.dart';
import 'package:get/get.dart';

class CompanyListingController extends GetxController {

  final Rx<CompanyListingState> _state = CompanyListingState(companies: []).obs;
  final CompanyRemoteApi _remoteApi = Get.find<CompanyRemoteApi>();

  CompanyListingState get state => _state.value;

  @override
  void onInit() {
    super.onInit();
    getCompanies();
  }

  Future<void> getCompanies() async {
    _state.value = _state.value.copy(isLoading: true);
    try {
      var response = await _remoteApi.getCompanies();
      if (response.isSuccessful) {
        var companies = CompanyApiResponse.fromList(jsonDecode(response.bodyString));
        _state.value = _state.value.copy(isLoading: false, companies: companies);
      } else {
        _state.value = _state.value.copy(isLoading: false, hasFailed: true);
        print(response.error);
      }
    } catch (e) {
      _state.value = _state.value.copy(isLoading: false, hasFailed: true);
    }
  }
}