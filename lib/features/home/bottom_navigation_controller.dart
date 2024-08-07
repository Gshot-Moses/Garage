import 'package:flutter/material.dart';
import 'package:garage/features/home/company_listing/company_listing_screen.dart';
import 'package:garage/features/home/landing/home_screen.dart';
import 'package:garage/features/home/user_profile/profile_screen.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {

  RxList<Widget> pageList = [
    const HomeScreen(),
    const CompanyListingScreen(),
    const ProfileScreen()
  ].obs;
}