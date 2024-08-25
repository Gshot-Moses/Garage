import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:garage/common/local_storage.dart';
import 'package:garage/config/app_theme.dart';
import 'package:garage/features/home/appointments/appointment_remote_api.dart';
import 'package:garage/features/home/bottom_navigation_screen.dart';
import 'package:garage/features/home/company_listing/company_remote_api.dart';
import 'package:garage/features/signin/api/sign_in_api.dart';
import 'package:garage/features/signin/ui/sign_in_screen.dart';
import 'package:garage/features/signup/api/sign_up_api.dart';
import 'package:garage/common/remote_api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var localStorage = Get.put(LocalStorage(preferences: SharedPreferencesAsync()));
  var token = await localStorage.getAccessToken();

  final ApiClient client = ApiClient(token: token ?? "");
  Get.lazyPut(() => client.getChopperService<SignInService>());
  Get.lazyPut(() => client.getChopperService<SignUpService>());
  Get.lazyPut(() => client.getChopperService<CompanyRemoteApi>());
  Get.lazyPut(() => client.getChopperService<AppointmentRemoteApi>());

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({required this.token, super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.light().themeData,
      home: token != null ? const BottomNavigationScreen() : SignInScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const SizedBox(),
    );
  }
}
