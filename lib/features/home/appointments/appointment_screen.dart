import 'package:flutter/material.dart';
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
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildAppbar(context),
              const SizedBox(height: AppSize.height24),
              // buildPagerView(),
              // const SizedBox(height: AppSize.height8),
              // Obx(
              //       () => Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: List.generate(
              //       carouselSliderList.length,
              //           (int index) => buildDot(index: index),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: AppSize.height24),
              // searchService(context),
              // const SizedBox(height: AppSize.height40),
              serviceOperationsText(context),
              const SizedBox(height: AppSize.height22),
              SizedBox(height: 100, child: serviceOperationsList()),
              const SizedBox(height: AppSize.height40),
              companiesText(context),
              // const SizedBox(height: AppSize.height22),
              // popularServiceData(),
              // const SizedBox(height: AppSize.height40),
              // spaForWomenText(),
              // const SizedBox(height: AppSize.height22),
              // spaForWomenData(),
              // const SizedBox(height: AppSize.height40),
              // salonForKidsManText(),
              // const SizedBox(height: AppSize.height22),
              // salonForKidsManData(),
              // const SizedBox(height: AppSize.height40),
              // acRepairText(),
              // const SizedBox(height: AppSize.height22),
              // acRepairData(),
              // const SizedBox(height: AppSize.height40),
              // quickHomeRepairText(),
              // const SizedBox(height: AppSize.height14),
              // tapRepairData(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.height20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppSize.width18,
              ),
              Row(
                children: [
                  Text(
                    AppString.welcome.tr,
                    style: TextStyle(
                        // fontFamily: FontFamily.mulishMedium,
                        fontWeight: FontWeight.w500,
                        fontSize: AppSize.height14,
                        fontStyle: FontStyle.normal,
                        color: Theme.of(context).textTheme.titleMedium?.color),
                  ),
                  // Image.asset(
                  //   AppIcons.arrowDownIcon,
                  //   height: AppSize.height12,
                  //   width: AppSize.height12,
                  //   color: Theme.of(context).textTheme.titleMedium?.color,
                  // ),
                ],
              ),
              const SizedBox(height: AppSize.height4),
              Text(
                "Username",
                style: TextStyle(
                  // fontFamily: FontFamily.mulishExtraBold,
                  fontWeight: FontWeight.w800,
                  fontSize: AppSize.height22,
                  color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                ),
              )
            ],
          ),
          // const Spacer(),
          // GestureDetector(
          //   onTap: () {
          //     Get.to(NotificationScreen());
          //   },
          //   child: Container(
          //     padding: const EdgeInsets.all(AppSize.height13),
          //     margin: const EdgeInsets.only(top: 30),
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       border:
          //       Border.all(color: Theme.of(context).colorScheme.tertiary),
          //     ),
          //     child: Image.asset(
          //       ((Theme.of(context).extensions.values.firstWhere(
          //             (extension) => extension is RegistrationStyle,
          //         orElse: () => const RegistrationStyle(
          //             iconBuilder: "",
          //             logoBuilder: "",
          //             bannerBuilder: "",
          //             imageBuilder: "",
          //             radioBuilder2: "",
          //             radioBuilder: "",
          //             frameBuilder: '',
          //             checkBuilder: '',
          //             checkDoneBuilder: ''),
          //       ) as RegistrationStyle)
          //           .iconBuilder),
          //       height: AppSize.height20,
          //       width: AppSize.width20,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget companiesText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.height20),
      child: Row(
        children: [
          Text(
            AppString.companies.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: AppSize.height18,
                fontStyle: FontStyle.normal,
                // fontFamily: FontFamily.mulishBold,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).appBarTheme.titleTextStyle?.color),
          ),
          const Spacer(),
          Text(
            AppString.seeAll.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: AppSize.height14,
                fontStyle: FontStyle.normal,
                // fontFamily: FontFamily.mulishSemiBold,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColors),
          ),
        ],
      ),
    );
  }

  Widget serviceOperationsList() {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: _appointmentController.state.isLoading ? const Center(child: CircularProgressIndicator()) :
        !_appointmentController.state.hasError ? ListView.builder(
          itemCount: _appointmentController.state.appointments!.length,
          scrollDirection: Axis.horizontal,
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
        ) : const Center(child: Text("Error. Try again")),
      ));
    // return Padding(
    //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    //   child: ListView.builder(
    //     itemCount: 1,
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (context, index) {
    //       return GestureDetector(
    //         onTap: () {
    //
    //         },
    //         child: Container(
    //           padding: const EdgeInsets.only(top: AppSize.height10),
    //           height: AppSize.height102,
    //           width: AppSize.width102,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(12),
    //             color: AppColor.progressBarColor,
    //           ),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Image.asset(AppImage.googleLogo,
    //                   height: AppSize.height32, width: AppSize.width32),
    //               const SizedBox(height: AppSize.height16),
    //               const Text(
    //                 "Tank",
    //                 style: TextStyle(
    //                   // fontFamily: FontFamily.mulishSemiBold,
    //                   fontStyle: FontStyle.normal,
    //                   fontWeight: FontWeight.w600,
    //                   color: AppColor.secondaryColor,
    //                   fontSize: AppSize.height14,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
    // return GridView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   padding: const EdgeInsets.symmetric(horizontal: AppSize.height20),
    //   shrinkWrap: true,
    //   itemCount: _homeController.colorList.length,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3,
    //       crossAxisSpacing: AppSize.height22,
    //       mainAxisSpacing: AppSize.height20),
    //   itemBuilder: (context, index) {
    //     return GestureDetector(
    //       onTap: () {
    //         if (index == 0 && homeController.nameList[index] == 'Salon') {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => SalonScreen()),
    //           );
    //         }
    //       },
    //       child: Container(
    //         padding: const EdgeInsets.only(top: AppSize.height10),
    //         height: AppSize.height102,
    //         width: AppSize.width102,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(12),
    //           color: homeController.colorList[index],
    //         ),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Image.asset(homeController.imageList[index],
    //                 height: AppSize.height32, width: AppSize.width32),
    //             const SizedBox(height: AppSize.height16),
    //             Text(
    //               homeController.nameList[index],
    //               style: const TextStyle(
    //                 fontFamily: FontFamily.mulishSemiBold,
    //                 fontStyle: FontStyle.normal,
    //                 fontWeight: FontWeight.w600,
    //                 color: AppColor.secondaryColor,
    //                 fontSize: AppSize.height14,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  Widget serviceOperationsText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.height20),
      child: Row(
        children: [
          Text(
            AppString.serviceOperations.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: AppSize.height18,
                fontStyle: FontStyle.normal,
                // fontFamily: FontFamily.mulishBold,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).appBarTheme.titleTextStyle?.color),
          ),
          const Spacer(),
          Text(
            AppString.seeAll.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: AppSize.height14,
                fontStyle: FontStyle.normal,
                // fontFamily: FontFamily.mulishSemiBold,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColors),
          ),
        ],
      ),
    );
  }
}
