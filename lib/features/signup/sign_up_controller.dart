import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final RxBool isValid = false.obs;
  final RxBool isConfirmPasswordValid = false.obs;
  RxBool isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void togglePasswordVisibility2() {
    isConfirmPasswordValid.toggle();
  }
}