import 'package:anubrat_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'package:anubrat_s_application2/widgets/custom_text_form_field.dart';
import 'package:anubrat_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({Key? key}) : super(key: key);

  TextEditingController countryEditTextController = TextEditingController();

  TextEditingController firstNameEditTextController = TextEditingController();

  TextEditingController lastNameEditTextController = TextEditingController();

  TextEditingController streetAddressEditTextController =
      TextEditingController();

  TextEditingController streetAddressTwoEditTextController =
      TextEditingController();

  TextEditingController cityEditTextController = TextEditingController();

  TextEditingController oldPasswordEditTextController = TextEditingController();

  TextEditingController zipCodeEditTextController = TextEditingController();

  TextEditingController phoneNumberEditTextController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 10.v),
                    child: Column(children: [
                      SizedBox(height: 29.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 5.v),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.h),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Country or region",
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 11.v),
                                        _buildCountryEditText(context),
                                        SizedBox(height: 22.v),
                                        Text("First Name",
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 13.v),
                                        _buildFirstNameEditText(context),
                                        SizedBox(height: 22.v),
                                        Text("Last Name",
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 12.v),
                                        _buildLastNameEditText(context),
                                        SizedBox(height: 23.v),
                                        Text("Street Address",
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 12.v),
                                        _buildStreetAddressEditText(context),
                                        SizedBox(height: 21.v),
                                        Text("Street Address 2 (Optional)",
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 16.v),
                                        _buildStreetAddressTwoEditText(context),
                                        SizedBox(height: 22.v),
                                        Text("City",
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 11.v),
                                        _buildCityEditText(context),
                                        SizedBox(height: 23.v),
                                        Text("State/Province/Region",
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 12.v),
                                        _buildOldPasswordEditText(context),
                                        SizedBox(height: 24.v),
                                        Text("Zip Code",
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 11.v),
                                        _buildZipCodeEditText(context),
                                        SizedBox(height: 23.v),
                                        Text("Phone Number",
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 12.v),
                                        _buildPhoneNumberEditText(context)
                                      ]))))
                    ]))),
            bottomNavigationBar: _buildAddAddressButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "Add Address", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildCountryEditText(BuildContext context) {
    return CustomTextFormField(
        controller: countryEditTextController,
        hintText: "Enter the country or region",
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false);
  }

  /// Section Widget
  Widget _buildFirstNameEditText(BuildContext context) {
    return CustomTextFormField(
        controller: firstNameEditTextController,
        hintText: "Enter the first name",
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false);
  }

  /// Section Widget
  Widget _buildLastNameEditText(BuildContext context) {
    return CustomTextFormField(
        controller: lastNameEditTextController,
        hintText: "Enter the last name",
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false);
  }

  /// Section Widget
  Widget _buildStreetAddressEditText(BuildContext context) {
    return CustomTextFormField(
        controller: streetAddressEditTextController,
        hintText: "Enter the street address",
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false);
  }

  /// Section Widget
  Widget _buildStreetAddressTwoEditText(BuildContext context) {
    return CustomTextFormField(
        controller: streetAddressTwoEditTextController,
        hintText: "Enter the street address 2",
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false);
  }

  /// Section Widget
  Widget _buildCityEditText(BuildContext context) {
    return CustomTextFormField(
        controller: cityEditTextController,
        hintText: "Enter the city",
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false);
  }

  /// Section Widget
  Widget _buildOldPasswordEditText(BuildContext context) {
    return CustomTextFormField(
        controller: oldPasswordEditTextController,
        hintText: "Enter the state/province/region",
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false);
  }

  /// Section Widget
  Widget _buildZipCodeEditText(BuildContext context) {
    return CustomTextFormField(
        controller: zipCodeEditTextController,
        hintText: "Enter the zip code",
        textInputType: TextInputType.number,
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false);
  }

  /// Section Widget
  Widget _buildPhoneNumberEditText(BuildContext context) {
    return CustomTextFormField(
        controller: phoneNumberEditTextController,
        hintText: "Enter the phone number",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.phone,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 15.v),
        borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
        filled: false);
  }

  /// Section Widget
  Widget _buildAddAddressButton(BuildContext context) {
    return CustomElevatedButton(
        text: "Add Address",
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
