import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {

  RxBool isPasswordVisible = false.obs;
  RxBool isValid = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
}