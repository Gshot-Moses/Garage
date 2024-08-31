import 'package:flutter/material.dart';
import 'package:garage/components/retry_widget.dart';
import 'package:garage/config/app_image.dart';
import 'package:garage/features/home/appointments/appointment_controller.dart';
import 'package:get/get.dart';
import 'package:garage/config/app_size.dart';
import 'package:garage/config/app_string.dart';
import 'package:garage/config/app_color.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});

  final AppointmentController _appointmentController = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
              centerTitle: false,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Text(
                    AppString.appointments.tr,
                    style: TextStyle(
                      // fontFamily: FontFamily.mulishBold,
                      fontSize: AppSize.height18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color:
                      Theme.of(context).appBarTheme.titleTextStyle?.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSize.height20),
              serviceOperationsList(),
            ],
          )
        ),
      ),
    );
  }

  Widget serviceOperationsList() {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: _appointmentController.state.isLoading ? const Center(child: CircularProgressIndicator()) :
        !_appointmentController.state.hasError ? ListView.builder(
          shrinkWrap: true,
          itemCount: _appointmentController.state.appointments!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {

              },
              child: Container(
                padding: const EdgeInsets.only(top: AppSize.height10),
                height: AppSize.height102,
                width: AppSize.width102,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.progressBarColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImage.googleLogo,
                        height: AppSize.height32, width: AppSize.width32),
                    const SizedBox(height: AppSize.height16),
                    Text(
                      _appointmentController.state.appointments![index].createdAt,
                      style: const TextStyle(
                        // fontFamily: FontFamily.mulishSemiBold,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: AppColor.secondaryColor,
                        fontSize: AppSize.height14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ) : RetryWidget(onRetry: _appointmentController.onRetry),
      ));
  }
}
