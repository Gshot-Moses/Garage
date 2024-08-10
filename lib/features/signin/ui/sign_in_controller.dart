import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {

  RxBool isPasswordVisible = false.obs;
  RxBool isValid = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
}