import 'package:flutter/material.dart';
import 'package:garage/components/retry_widget.dart';
import 'package:garage/config/app_image.dart';
import 'package:garage/features/home/appointments/appointment_controller.dart';
import 'package:get/get.dart';
import 'package:garage/config/app_size.dart';
import 'package:garage/config/app_string.dart';
import 'package:garage/config/app_color.dart';
import 'package:timeline_tile/timeline_tile.dart';

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
              appointmentList(),
            ],
          )
        ),
      ),
    );
  }

  Widget appointmentList() {
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
              child: TimelineTile(
                isFirst: index == 0,
                isLast: index == _appointmentController.state.appointments!.length,
                endChild: _appointmentTile(context),
              ),
            );
          },
        ) : RetryWidget(onRetry: _appointmentController.onRetry),
      ));
  }

  Widget _appointmentTile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColorLight, width: 2),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Column(
            children: [
              const Text(
                "Company Name", 
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Service Operation",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).textTheme.titleMedium!.color!,
                    ),
                  ),
                  Text(
                    "Due: 21-10-2024",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).textTheme.titleMedium!.color!,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
