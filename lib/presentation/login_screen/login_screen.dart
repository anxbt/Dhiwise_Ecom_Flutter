import 'package:anubrat_s_application2/services/auth_services.dart';
import 'package:anubrat_s_application2/widgets/custom_icon_button.dart';
import 'package:anubrat_s_application2/widgets/custom_text_form_field.dart';
import 'package:anubrat_s_application2/widgets/custom_elevated_button.dart';
import 'package:anubrat_s_application2/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/Shared_Preferences.dart';
import 'forgot_password.dart';
import "../splash_screen/splash_screen.dart";

final FirebaseAuth _auth = FirebaseAuth.instance;

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery
                            .of(context)
                            .viewInsets
                            .bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.only(
                                left: 16.h, top: 68.v, right: 16.h),
                            child: Column(children: [
                              _buildPageHeader(context),
                              SizedBox(height: 28.v),
                              CustomTextFormField(
                                  controller: emailController,
                                  hintText: "Your Email",
                                  textInputType: TextInputType.emailAddress,
                                  prefix: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          16.h, 12.v, 10.h, 12.v),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgEmailIcon,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize)),
                                  prefixConstraints:
                                  BoxConstraints(maxHeight: 48.v),
                                  contentPadding: EdgeInsets.only(
                                      top: 15.v, right: 30.h, bottom: 15.v)),
                              SizedBox(height: 10.v),
                              CustomTextFormField(
                                  controller: passwordController,
                                  hintText: "Password",
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  prefix: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          16.h, 12.v, 10.h, 12.v),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgLocation,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize)),
                                  prefixConstraints:
                                  BoxConstraints(maxHeight: 48.v),
                                  obscureText: true,
                                  contentPadding: EdgeInsets.only(
                                      top: 15.v, right: 30.h, bottom: 15.v)),
                              SizedBox(height: 16.v),
                              CustomElevatedButton(
                                text: "Sign In",
                                onPressed: () {
                                  onTapSignIn(context);
                                },
                              ),
                              SizedBox(height: 18.v),
                              _buildOrLine(context),
                              SizedBox(height: 16.v),
                              _buildSocialAuthentication(context),
                              SizedBox(height: 17.v),

                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return forgotpassword.forgotPassword();
                                    },
                                    ),
                                  );
                                },
                                  child: Text("Forgot Password?",
                                    style: CustomTextStyles.labelLargePrimary
                                   ),
                              ),
                              SizedBox(height: 7.v),
                              GestureDetector(
                                  onTap: () {
                                     onTapTxtDonthaveanaccount(context);},

                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Don’t have an account?",
                                            style: CustomTextStyles
                                                .bodySmallff9098b1),
                                        TextSpan(text: " "),
                                        TextSpan(
                                            text: "Register",
                                            style: CustomTextStyles
                                                .labelLargeff40bfff)
                                      ]),
                                      textAlign: TextAlign.left)),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  Widget _buildPageHeader(BuildContext context) {
    return Column(children: [
      CustomIconButton(
          height: 72.adaptSize,
          width: 72.adaptSize,
          padding: EdgeInsets.all(20.h),
          decoration: IconButtonStyleHelper.fillPrimary,
          child: CustomImageView(imagePath: ImageConstant.imgClose)),
      SizedBox(height: 16.v),
      Text("Welcome to E-com", style: theme.textTheme.titleMedium),
      SizedBox(height: 10.v),
      Text("Sign in to continue", style: theme.textTheme.bodySmall)
    ]);
  }

  /// Section Widget
  Widget _buildOrLine(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 10.v, bottom: 9.v),
          child: SizedBox(width: 134.h, child: Divider())),
      Text("OR", style: CustomTextStyles.titleSmallBluegray300_1),
      Padding(
          padding: EdgeInsets.only(top: 10.v, bottom: 9.v),
          child: SizedBox(width: 137.h, child: Divider()))
    ]);
  }

  /// Section Widget
  Widget _buildSocialAuthentication(BuildContext context) {
    return Column(children: [
      CustomOutlinedButton(
          text: "Login with Google",
          onPressed: () => AuthServices().signInWithGoogle(),
          leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              child: CustomImageView(
                  imagePath: ImageConstant.imgGoogleIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize))),
      SizedBox(height: 8.v),
      CustomOutlinedButton(
          text: "Login with Github",
          leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgGithubIcon,
                height: 24.adaptSize,
                width: 20.adaptSize),
          ))
    ]);
  }

  /// Navigates to the registerScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerScreen);
  }

  onTapSignIn(BuildContext context) async {
    print("hy");


    var sharedPref =await SharedPreferences.getInstance();
    sharedPref.setBool(SplashScreen.KEYLOGIN, true);`

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Show error message for empty fields
      return;
    }
    try {
      // Create user with email and password
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save login status in Shared Preferences
      await SharedPref.saveLoginStatus(true);

      // Handle successful registration (e.g., navigate to dashboard)
      Navigator.pushNamed(context, AppRoutes.dashboardContainerScreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$e.code'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The account already exists for that email.'),
          ),
        );
        Navigator.pushNamed(context, AppRoutes.loginScreen);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

}