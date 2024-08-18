import 'package:flutter/material.dart';
import 'package:garage/features/home/company_listing/company_listing_screen.dart';
import 'package:garage/features/home/appointments/appointment_screen.dart';
import 'package:garage/features/home/user_profile/profile_screen.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {

  RxList<Widget> pageList = [
    CompanyListingScreen(),
    AppointmentScreen(),
    const ProfileScreen()
  ].obs;
}