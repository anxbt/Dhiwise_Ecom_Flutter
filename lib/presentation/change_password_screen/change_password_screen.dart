import 'package:anubrat_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'package:anubrat_s_application2/widgets/custom_text_form_field.dart';
import 'package:anubrat_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController newPasswordAgainController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 26.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Old Password",
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 12.v),
                                  _buildOldPassword(context),
                                  SizedBox(height: 23.v),
                                  Text("New Password",
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 12.v),
                                  _buildNewPassword(context),
                                  SizedBox(height: 24.v),
                                  Text("New Password Again",
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 11.v),
                                  _buildNewPasswordAgain(context),
                                  SizedBox(height: 5.v)
                                ]))))),
            bottomNavigationBar: _buildSave(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "Change Password", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildOldPassword(BuildContext context) {
    return CustomTextFormField(
        controller: oldPasswordController,
        hintText: "•••••••••••••••••",
        hintStyle: CustomTextStyles.labelLargeBluegray300,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 48.v),
        obscureText: true,
        contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false);
  }

  /// Section Widget
  Widget _buildNewPassword(BuildContext context) {
    return CustomTextFormField(
        controller: newPasswordController,
        hintText: "•••••••••••••••••",
        hintStyle: CustomTextStyles.labelLargeBluegray300,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 48.v),
        obscureText: true,
        contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false);
  }

  /// Section Widget
  Widget _buildNewPasswordAgain(BuildContext context) {
    return CustomTextFormField(
        controller: newPasswordAgainController,
        hintText: "•••••••••••••••••",
        hintStyle: CustomTextStyles.labelLargeBluegray300,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 48.v),
        obscureText: true,
        contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false);
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return CustomElevatedButton(
        text: "Save",
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
