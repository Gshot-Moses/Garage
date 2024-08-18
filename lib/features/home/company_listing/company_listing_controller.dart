import 'package:get/get.dart';

class CompanyListingController extends GetxController {
  var _state = [].obs;

  List<dynamic> get state => _state.value;
}