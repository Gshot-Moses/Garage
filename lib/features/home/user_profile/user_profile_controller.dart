import 'dart:convert';

import 'package:garage/common/local_storage.dart';
import 'package:garage/features/home/user_profile/models.dart';
import 'package:garage/features/home/user_profile/profile_state.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {

  final LocalStorage _localStorage = Get.find<LocalStorage>();

  final Rx<ProfileState> _state = ProfileState().obs;

  ProfileState get state => _state.value;

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    var userJson = await _localStorage.getUserInfo();
    var user = UserInfo.fromJson(jsonDecode(userJson!));
    _state.value = state.copy(userInfo: user);
  }
}