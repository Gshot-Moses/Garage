import 'package:flutter/material.dart';
import 'package:garage/components/circular_loading_indicator.dart';
import 'package:garage/features/home/bottom_navigation_screen.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:garage/features/signin/ui/sign_in_controller.dart';
import 'package:garage/config/app_size.dart';
import 'package:garage/config/app_color.dart';
import 'package:garage/config/app_image.dart';
import 'package:garage/config/app_string.dart';
import 'package:garage/components/custom_text_field.dart';
import 'package:garage/components/custom_button.dart';
import 'package:garage/features/signup/ui/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({
    super.key,
  });

  final SignInController _signInController = Get.put(SignInController());

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var isLoadingChildren = [
      signInText(context),
      SizedBox(height: Get.height / 23),
      emailField(),
      SizedBox(height: Get.height / 43),
      passwordField(),
      SizedBox(height: Get.height / 22),
      signInButton(context),
      const SizedBox(height: AppSize.height30),
      const Align(child: CircularLoadingIndicator())
    ];
    var notIsLoadingChildren = [...isLoadingChildren]..removeAt(isLoadingChildren.length - 1)..addAll(
      [
        onLoginWithText(context),
        SizedBox(height: Get.height / 43),
        googleFbLogin(context),
        SizedBox(height: Get.height / 22),
        notHavingAccountText(context),
        SizedBox(height: Get.height / 30),
      ]
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Form(
          key: loginFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                bgImage(context),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppSize.width20,
                    right: AppSize.width20,
                    top: Get.height / 19,
                  ),
                  child: Obx(
                      () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _signInController.state.isLoading ? isLoadingChildren : notIsLoadingChildren
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget bgImage(BuildContext context) {
    return Container(
      color: AppColor.loginBgImageColor,
      height: Get.height / 4.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(
          //       right: AppSize.height20, bottom: AppSize.height10),
          //   child: Align(
          //     alignment: Alignment.topRight,
          //     child: GestureDetector(
          //         onTap: () {
          //           if (status == "true") {
          //             Get.offAll(const BottomScreen(initialIndex: 0));
          //           } else if (status == "false") {
          //             Navigator.of(context).pop();
          //           } else if (status == "onBoarding") {
          //             Get.offAll(const BottomScreen(initialIndex: 0));
          //           }
          //         },
          //         child: Image.asset(AppImage.cancelButton,
          //             height: AppSize.height13)),
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              AppImage.loginImage,
              height: Get.height / 5.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget signInText(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppString.signIn.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AppSize.height24,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).appBarTheme.titleTextStyle?.color),
        ),
        const SizedBox(height: AppSize.height6),
        Text(
          AppString.pleaseEnterBelowDetail.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AppSize.height14,
              fontWeight: FontWeight.w500,
              //fontFamily: FontFamily.mulishMedium,
              color: Theme.of(context).textTheme.titleMedium?.color),
        ),
      ],
    );
  }

  Widget emailField() {
    return CustomTextField(
      controller: _signInController.emailController,
      hintText: AppString.emailHintText.tr,
      contentPadding: const EdgeInsets.only(
        right: AppSize.width20,
        left: AppSize.width20,
        top: AppSize.height17,
        bottom: AppSize.height17,
      ),
      //fontFamily: FontFamily.mulishMedium,
      fontSize: AppSize.height14,
      fontWeight: FontWeight.w500,
      validator: (value) {
        if (!EmailValidator.validate(value ?? "")) {
          return AppString.pleaseEnterValidEmail.tr;
        } else {
          return null;
        }
      },
    );
  }

  Widget passwordField() {
    return Column(
      children: [
        Obx(
          () => CustomTextField(
            controller: _signInController.passwordController,
            hintText: AppString.passwordHintText.tr,
            obscureText: !_signInController.isPasswordVisible.value,
            contentPadding: const EdgeInsets.only(
              right: AppSize.width20,
              left: AppSize.width20,
              top: AppSize.height17,
              bottom: AppSize.height17,
            ),
            fontSize: AppSize.height14,
            //fontFamily: FontFamily.mulishMedium,
            fontWeight: FontWeight.w500,
            onTogglePasswordVisibility:
                _signInController.togglePasswordVisibility,
            validator: (value) {
              if (value!.isEmpty) {
                return AppString.pleaseEnterPassword.tr;
              } else {
                _signInController.isValid.value = true;
                return null;
              }
            },
            suffixIcon: GestureDetector(
              onTap: () {
                _signInController.togglePasswordVisibility();
              },
              child: Image.asset(
                _signInController.isPasswordVisible.value
                    ? AppImage.openEye
                    : AppImage.passwordVisibility,
                height: 0.1,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSize.height10),
        // Align(
        //   alignment: Alignment.bottomRight,
        //   child: GestureDetector(
        //     onTap: () {
        //       Get.to(EmailScreen());
        //     },
        //     child: const Text(
        //       AppString.forgotPassword,
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //         fontFamily: FontFamily.mulishSemiBold,
        //         fontWeight: FontWeight.w700,
        //         fontSize: AppSize.height15,
        //         color: AppColor.primaryColors,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget onLoginWithText(context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        AppString.orLogInWith.tr,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: AppSize.height16,
            //fontFamily: FontFamily.mulishMedium,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.titleMedium?.color),
      ),
    );
  }

  Widget googleFbLogin(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () { _signInController.onGoogleSignIn(); },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                vertical: AppSize.height18,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.height12),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImage.googleLogo,
                    height: AppSize.height20,
                  ),
                  const SizedBox(width: AppSize.width6),
                  Text(
                    AppString.google.tr,
                    style: TextStyle(
                      // fontFamily: FontFamily.mulishMedium,
                      color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                      fontWeight: FontWeight.w500,
                      fontSize: AppSize.height15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSize.height20),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppSize.height18,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.height12),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImage.facebookLogo,
                  height: AppSize.height22,
                  // color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                ),
                const SizedBox(width: AppSize.width6),
                Text(
                  AppString.facebook.tr,
                  style: TextStyle(
                    //fontFamily: FontFamily.mulishMedium,
                    color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSize.height15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget signInButton(context) {
    return Obx(
      () => CustomButton(
          onTap: () async {
            if (loginFormKey.currentState!.validate()) {
              Future.delayed(const Duration(milliseconds: 500), () {
                _signInController.emailController.clear();
                _signInController.passwordController.clear();
              });
              Get.off(const BottomNavigationScreen());
            }
          },
          text: AppString.signIn.tr,
          height: AppSize.height52,
          width: AppSize.width,
          buttonColor: _signInController.isValid.value
              ? AppColor.primaryColorLightMode
              : Theme.of(context).tabBarTheme.labelColor,
          borderColor: _signInController.isValid.value
              ? AppColor.primaryColorLightMode
              : Theme.of(context).tabBarTheme.labelColor,
          //fontFamily: FontFamily.mulishRegular,
          fontWeight: FontWeight.w600,
          fontSize: AppSize.height17,
          textColor: AppColor.whiteColor),
    );
  }

  Widget notHavingAccountText(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppString.alreadyHaveAnAccount.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AppSize.height14,
              //fontFamily: FontFamily.mulishMedium,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).unselectedWidgetColor),
        ),
        const SizedBox(width: AppSize.width1),
        GestureDetector(
          onTap: () {
            Get.off(SignUpScreen())?.then(
                (value) => FocusManager.instance.primaryFocus?.unfocus());
          },
          child: Text(
            AppString.signUp.tr,
            style: const TextStyle(
                fontSize: AppSize.height14,
                // fontFamily: FontFamily.mulishBold,
                fontWeight: FontWeight.w700,
                color: AppColor.primaryColors),
          ),
        ),
      ],
    );
  }
}
