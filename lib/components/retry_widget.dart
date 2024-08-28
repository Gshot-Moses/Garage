import 'package:flutter/material.dart';
import 'package:garage/components/custom_button.dart';
import 'package:garage/components/custom_text.dart';
import 'package:garage/config/app_string.dart';
import 'package:garage/config/app_color.dart';
import 'package:garage/config/app_size.dart';
import 'package:get/get.dart';

class RetryWidget extends StatelessWidget {

  final VoidCallback onRetry;

  const RetryWidget({required this.onRetry, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomText(AppString.error.tr, 14.0, Theme.of(context).appBarTheme.titleTextStyle!.color!, FontWeight.w500),
          const SizedBox(height: AppSize.height10),
          CustomButton(
            onTap: onRetry,
            text: AppString.retry.tr,
            textColor: AppColor.whiteColor,
            buttonColor: AppColor.primaryColorLightMode,
            height: AppSize.height40,
            width: AppSize.height102,
          )
        ],
      ),
    );
  }
}
