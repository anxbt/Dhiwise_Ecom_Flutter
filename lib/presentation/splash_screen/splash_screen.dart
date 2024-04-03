//import 'dart:js';



import 'package:anubrat_s_application2/presentation/dashboard_page/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:anubrat_s_application2/presentation/login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  static const String KEYLOGIN="login";








  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 1),
        (){
        //Navigate to the main screen
          Navigator.pushReplacementNamed(context, '/login_screen');

        },
    );

    //whereToGo();
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary.withOpacity(1),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.v),
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 72.adaptSize,
                width: 72.adaptSize,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void whereToGo () async{

    var sharedPref=await SharedPreferences.getInstance();
    var isLoggedIn=sharedPref.getBool(KEYLOGIN);


    Future.delayed(
      Duration(seconds: 1),
          (){
        if(isLoggedIn!=null){
          if(isLoggedIn){
            Navigator.pushReplacement(context as BuildContext,
                MaterialPageRoute(builder: (context)=>DashboardPage(),));
          }else{
            Navigator.pushReplacement(context as BuildContext,
              '/login_screen' as Route<Object?>);
          }
        }else{
          Navigator.pushReplacement(context as BuildContext,
              MaterialPageRoute(builder: (context)=>DashboardPage(),));
        }
        //Navigate to the main screen
        Navigator.pushReplacementNamed(context as BuildContext, '/login_screen');

      },
    );
  }
}