import 'package:chopper/chopper.dart' as chopper;
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:garage/common/local_storage.dart';
import 'package:garage/common/remote_api.dart';
import 'package:garage/features/home/bottom_navigation_screen.dart';
import 'package:garage/features/signin/api/sign_in_api.dart';
import 'package:garage/features/signin/ui/sign_in_state.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {

  final SignInService _signInService = Get.find<SignInService>();
  final LocalStorage _cache = Get.find<LocalStorage>();

  final chopper.ChopperClient _chopperClient = Get.find<chopper.ChopperClient>();

  RxBool isPasswordVisible = false.obs;
  RxBool isValid = false.obs;
  final Rx<SignInState> _state = SignInState().obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignInState get state => _state.value;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      isValid.value =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });

    passwordController.addListener(() {
      isValid.value =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  Future<void> onGoogleSignIn() async {
    String? userId;
    _state.value = _state.value.copy(isLoading: true);
    try {
      final result = await FlutterWebAuth.authenticate(
          url: "https://garage-floral-field-9662.fly.dev/auth/mgoogle",
          callbackUrlScheme: "com.gshot.garage"
      );
      var token = Uri.parse(result).queryParameters['token'];

      _chopperClient.interceptors.add(AuthorizationInterceptor(token: token!));

      userId = Uri.parse(result).queryParameters['userId'];
      await _cache.saveAccessToken(token);
      _state.value = _state.value.copy(accessToken: token);
    } catch(e) {
      _state.value = _state.value.copy(hasFailed: true);
    }
    if (!_state.value.hasFailed) {
      try {
        var response = await _signInService.getUserInfo(userId!);
        if (response.isSuccessful) {
          await _cache.storeUserInfo(response.bodyString);
          Get.to(const BottomNavigationScreen())?.then((value) => _state.value = _state.value.copy(isLoading: false));
        } else {
          _state.value = _state.value.copy(isLoading: false, hasFailed: true);
        }
      } catch(e) {
        _state.value = _state.value.copy(isLoading: false, hasFailed: true);
      }
    }
  }
}