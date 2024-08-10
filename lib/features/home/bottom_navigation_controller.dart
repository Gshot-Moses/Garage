import 'package:flutter/material.dart';
import 'package:garage/features/home/company_listing/appointments_screen.dart';
import 'package:garage/features/home/landing/home_screen.dart';
import 'package:garage/features/home/user_profile/profile_screen.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {

  RxList<Widget> pageList = [
    HomeScreen(),
    const AppointmentsScreen(),
    const ProfileScreen()
  ].obs;
}