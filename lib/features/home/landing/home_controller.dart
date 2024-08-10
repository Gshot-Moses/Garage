import 'package:garage/remote/remote_api.dart';
import 'package:get/get.dart';

import 'home_remote_api.dart';

class HomeController extends GetxController {

  HomeController();

  final ApiService _apiService = ApiClient().getChopperService<ApiService>();


  @override
  void onInit() {
    super.onInit();
    getCompanies();
  }

  Future<List<String>> getCompanies() async {
    var response = await _apiService.getCompanies();
    print(response.body);
    return [];
  }
}