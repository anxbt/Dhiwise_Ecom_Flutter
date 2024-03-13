import 'package:anubrat_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'package:anubrat_s_application2/widgets/custom_text_form_field.dart';
import 'package:anubrat_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AddCardScreen extends StatelessWidget {
  AddCardScreen({Key? key}) : super(key: key);

  TextEditingController cardNumberEditTextController = TextEditingController();

  TextEditingController expirationDateEditTextController =
      TextEditingController();

  TextEditingController securityCodeEditTextController =
      TextEditingController();

  TextEditingController cardHolderEditTextController = TextEditingController();

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
                                horizontal: 16.h, vertical: 27.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Card Number",
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 12.v),
                                  _buildCardNumberEditText(context),
                                  SizedBox(height: 24.v),
                                  Text("Expiration Date",
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 11.v),
                                  _buildExpirationDateEditText(context),
                                  SizedBox(height: 29.v),
                                  Text("Security Code",
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 11.v),
                                  _buildSecurityCodeEditText(context),
                                  SizedBox(height: 23.v),
                                  Text("Card Holder",
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 12.v),
                                  _buildCardHolderEditText(context),
                                  SizedBox(height: 5.v)
                                ]))))),
            bottomNavigationBar: _buildAddCardButton(context)));
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
            text: "Add Card", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildCardNumberEditText(BuildContext context) {
    return CustomTextFormField(
        controller: cardNumberEditTextController,
        hintText: "Enter Card Number",
        textInputType: TextInputType.number);
  }

  /// Section Widget
  Widget _buildExpirationDateEditText(BuildContext context) {
    return CustomTextFormField(
        controller: expirationDateEditTextController,
        hintText: "Expiration Date");
  }

  /// Section Widget
  Widget _buildSecurityCodeEditText(BuildContext context) {
    return CustomTextFormField(
        controller: securityCodeEditTextController, hintText: "Security Code");
  }

  /// Section Widget
  Widget _buildCardHolderEditText(BuildContext context) {
    return CustomTextFormField(
        controller: cardHolderEditTextController,
        hintText: "Enter Card Number",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.number);
  }

  /// Section Widget
  Widget _buildAddCardButton(BuildContext context) {
    return CustomElevatedButton(
        text: "Add Card",
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapAddCardButton(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the creditCardAndDebitScreen when the action is triggered.
  onTapAddCardButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.creditCardAndDebitScreen);
  }
}
