import 'package:flutter/material.dart';
import 'package:garage/features/home/user_profile/user_profile_controller.dart';
import 'package:get/get.dart';
import 'package:garage/config/app_size.dart';
import 'package:garage/config/app_string.dart';
import 'package:garage/components/custom_text.dart';
import 'package:garage/config/app_icons.dart';
import 'package:garage/config/app_color.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final UserProfileController _controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).appBarTheme.shadowColor!,
                spreadRadius: AppSize.height0,
                blurRadius: AppSize.height14,
                offset: const Offset(
                  AppSize.height0,
                  AppSize.height4,
                ),
              ),
            ],
          ),
          child: AppBar(
            scrolledUnderElevation: 0.0,
            shadowColor: Theme.of(context).appBarTheme.shadowColor,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                AppString.profile.tr,
                style: TextStyle(
                  // fontFamily: FontFamily.mulishBold,
                  fontSize: AppSize.height18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.height20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSize.height24),
              editCard(context),
              // const SizedBox(height: AppSize.height16),
              // bookingCard(context),
              // const SizedBox(height: AppSize.height16),
              // languageCard(context),
              // const SizedBox(height: AppSize.height16),
              // settingCard(context),
              const SizedBox(height: AppSize.height30),
              logOutText(context),
              const SizedBox(height: AppSize.height30),
            ],
          ),
        ),
      ),
    );
  }

  editCard(context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(AppSize.height12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppSize.height12),
        border: Border.all(color: Theme.of(context).cardTheme.shadowColor!),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).cardTheme.shadowColor!,
            spreadRadius: AppSize.height0,
            blurRadius: AppSize.height18,
            offset: const Offset(
              AppSize.height0,
              AppSize.height4,
            ),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  "Hello ${_controller.state.userInfo!.firstName}",
                  AppSize.height16,
                  Theme.of(context).appBarTheme.titleTextStyle!.color!,
                  // FontFamily.mulishMedium,
                  FontWeight.w500),
              GestureDetector(
                  onTap: () {
                    // Get.to(EditProfileScreen());
                  },
                  child: Image.asset(
                    AppIcons.arrowIcon,
                    height: AppSize.height14,
                    width: AppSize.height14,
                  ))
            ],
          ),
          const SizedBox(height: AppSize.height6),
          CustomText(
              _controller.state.userInfo!.email,
              AppSize.height14,
              Theme.of(context).textTheme.titleMedium!.color!,
              // FontFamily.mulishRegular,
              FontWeight.w400),
        ],
      ),
    );
  }

  logOutText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // logOutBottomSheet(context);
      },
      child: const Center(
        child: Text("Logout",
            style: TextStyle(
                color: AppColor.logOutColor,
                // fontFamily: FontFamily.mulishMedium,
                fontWeight: FontWeight.w500,
                fontSize: AppSize.height16)),
      ),
    );
  }
}
