import 'package:flutter/material.dart';
import 'package:garage/features/home/landing/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Landing"));
  }
}
