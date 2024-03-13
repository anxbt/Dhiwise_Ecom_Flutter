import 'package:anubrat_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 36.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileRow(context),
                      SizedBox(height: 32.v),
                      _buildBirthdayRow(context,
                          dateIcon: ImageConstant.imgGenderIcon,
                          birthdayText: "Gender",
                          birthDateValue: "Male"),
                      _buildBirthdayRow(context,
                          dateIcon: ImageConstant.imgDateIcon,
                          birthdayText: "Birthday",
                          birthDateValue: "12-12-2000"),
                      _buildBirthdayRow(context,
                          dateIcon: ImageConstant.imgMessageIcon,
                          birthdayText: "Email",
                          birthDateValue: "rex4dom@gmail.com"),
                      _buildBirthdayRow(context,
                          dateIcon: ImageConstant.imgCreditCardIcon,
                          birthdayText: "Phone Number",
                          birthDateValue: "(307) 555-0133"),
                      SizedBox(height: 5.v),
                      _buildBirthdayRow(context,
                          dateIcon: ImageConstant.imgTrophy,
                          birthdayText: "Change Password",
                          birthDateValue: "•••••••••••••••••",
                          onTapBirthdayRow: () {
                        onTapBirthdayRow(context);
                      })
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "Profile", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildProfileRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: ImageConstant.imgProfilePicture72x72,
              height: 72.adaptSize,
              width: 72.adaptSize,
              radius: BorderRadius.circular(36.h)),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 9.v, bottom: 14.v),
              child: Column(children: [
                Text("Dominic Ovo", style: theme.textTheme.titleSmall),
                SizedBox(height: 8.v),
                Text("@dominic_ovo", style: theme.textTheme.bodySmall)
              ]))
        ]));
  }

  /// Common widget
  Widget _buildBirthdayRow(
    BuildContext context, {
    required String dateIcon,
    required String birthdayText,
    required String birthDateValue,
    Function? onTapBirthdayRow,
  }) {
    return GestureDetector(
        onTap: () {
          onTapBirthdayRow!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(children: [
              CustomImageView(
                  imagePath: dateIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 3.v, bottom: 2.v),
                  child: Text(birthdayText,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1)))),
              Spacer(),
              Padding(
                  padding: EdgeInsets.only(top: 2.v, bottom: 3.v),
                  child: Text(birthDateValue,
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: appTheme.blueGray300))),
              CustomImageView(
                  imagePath: ImageConstant.imgRightIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 16.h))
            ])));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the changePasswordScreen when the action is triggered.
  onTapBirthdayRow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.changePasswordScreen);
  }
}
