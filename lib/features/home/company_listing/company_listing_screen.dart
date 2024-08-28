import 'package:flutter/material.dart';
import 'package:garage/components/retry_widget.dart';
import 'package:garage/config/app_color.dart';
import 'package:garage/config/app_image.dart';
import 'package:garage/config/app_size.dart';
import 'package:garage/config/app_string.dart';
import 'package:garage/features/home/company_listing/company_listing_controller.dart';
import 'package:get/get.dart';

class CompanyListingScreen extends StatelessWidget {
  CompanyListingScreen({super.key});

  final CompanyListingController _controller =
      Get.put(CompanyListingController());

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
                      AppString.companies.tr,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.height20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSize.height20),
                  // searchService(context),
                  const SizedBox(height: AppSize.height20),
                  companyListView(),
                ],
              ),
            ),
          )),
    );
  }

  Widget companyListView() {
    return Obx(
      () => _controller.state.isLoading ? const Center(child: CircularProgressIndicator()) :
        !_controller.state.hasFailed ? ListView.builder(
          itemCount: _controller.state.companies.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var mData = _controller.state.companies[index];
            return Container(
              width: Get.width,
              padding: const EdgeInsets.all(AppSize.height12),
              margin: const EdgeInsets.only(bottom: AppSize.height18),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(AppSize.height12),
                border:
                    Border.all(color: Theme.of(context).cardTheme.shadowColor!),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      //mData.image!,
                      AppImage.carLogo,
                      fit: BoxFit.fill,
                      height: AppSize.height80,
                      width: AppSize.height80,
                    ),
                  ),
                  const SizedBox(width: AppSize.height14),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(mData.name,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle
                                    ?.color,
                                // fontFamily: FontFamily.mulishSemiBold,
                                fontWeight: FontWeight.w600,
                                fontSize: AppSize.height16)),
                        const SizedBox(height: AppSize.height6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                mData.state,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .titleTextStyle
                                        ?.color,
                                    // fontFamily: FontFamily.mulishSemiBold,
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppSize.height14)),
                            const SizedBox(width: AppSize.height6),
                            // Expanded(
                            //   child: GestureDetector(
                            //     onTap: () {
                            //
                            //     },
                            //     child: Padding(
                            //         padding: const EdgeInsets.only(
                            //             top: AppSize.height8,
                            //             right: AppSize.height8),
                            //         child: Align(
                            //           alignment: Alignment.centerRight,
                            //           child: Image.asset(
                            //             AppIcons.arrowRightIcon,
                            //             height: AppSize.height17,
                            //             width: AppSize.height17,
                            //             color: Theme.of(context)
                            //                 .appBarTheme
                            //                 .titleTextStyle
                            //                 ?.color,
                            //           ),
                            //         ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                        const SizedBox(height: AppSize.height16),
                        Text(
                          mData.country,
                          style: const TextStyle(
                            color: AppColor.primaryColorLightMode,
                            // fontFamily: FontFamily.mulishMedium,
                            fontWeight: FontWeight.w600,
                            fontSize: AppSize.height12)),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        ) : RetryWidget(onRetry: _controller.onRetry),
    );
  }
}
