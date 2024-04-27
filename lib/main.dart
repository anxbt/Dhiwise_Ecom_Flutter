import 'package:anubrat_s_application2/presentation/dashboard_page/dashboard_page.dart';
import 'package:anubrat_s_application2/presentation/login_screen/login_screen.dart';
import 'package:anubrat_s_application2/services/Shared_Preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/app_export.dart';
import 'package:firebase_core/firebase_core.dart';

import 'internet/dependency_injection.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  DependencyInjection.init();

  // Check login status
  final isLoggedIn = await SharedPref.getLoginStatus();
  print(isLoggedIn);

  // Update theme (adjust as needed)
  ThemeHelper().changeTheme('primary');

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          theme: theme,
          title: 'anubrat_s_application2',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashScreen,
          routes: AppRoutes.routes,
          home: isLoggedIn ? DashboardPage() : LoginScreen(),
        );
      },
    );
  }
}