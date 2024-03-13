import 'package:anubrat_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'package:anubrat_s_application2/widgets/custom_text_form_field.dart';
import '../filter_screen/widgets/conditionchipview_item_widget.dart';
import '../filter_screen/widgets/buyingformatchipview_item_widget.dart';
import '../filter_screen/widgets/itemlocationchipview_item_widget.dart';
import '../filter_screen/widgets/showonly_item_widget.dart';
import 'package:anubrat_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key}) : super(key: key);

  TextEditingController priceController = TextEditingController();

  TextEditingController priceController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 7.v),
                child: Column(children: [
                  SizedBox(height: 31.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              margin: EdgeInsets.only(bottom: 5.v),
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Price Range",
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 11.v),
                                    _buildPriceRow(context),
                                    SizedBox(height: 34.v),
                                    Text("Condition",
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 13.v),
                                    _buildConditionChipView(context),
                                    SizedBox(height: 24.v),
                                    Text("Buying Format",
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 11.v),
                                    _buildBuyingFormatChipView(context),
                                    SizedBox(height: 22.v),
                                    Text("Item Location",
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 13.v),
                                    _buildItemLocationChipView(context),
                                    SizedBox(height: 25.v),
                                    _buildShowOnlyColumn(context)
                                  ]))))
                ])),
            bottomNavigationBar: _buildApplyButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 42.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgCloseIcon,
            margin: EdgeInsets.only(left: 18.h, top: 16.v, bottom: 16.v)),
        title: AppbarSubtitle(
            text: "Filter Search", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildPriceRow(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(right: 6.h),
              child: CustomTextFormField(
                  controller: priceController,
                  hintText: "1.245",
                  hintStyle: CustomTextStyles.labelLargeBluegray300))),
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: CustomTextFormField(
                  controller: priceController1,
                  hintText: "9.344",
                  hintStyle: CustomTextStyles.labelLargeBluegray300,
                  textInputAction: TextInputAction.done)))
    ]);
  }

  /// Section Widget
  Widget _buildConditionChipView(BuildContext context) {
    return Wrap(
        runSpacing: 9.v,
        spacing: 9.h,
        children:
            List<Widget>.generate(3, (index) => ConditionchipviewItemWidget()));
  }

  /// Section Widget
  Widget _buildBuyingFormatChipView(BuildContext context) {
    return Wrap(
        runSpacing: 8.v,
        spacing: 8.h,
        children: List<Widget>.generate(
            5, (index) => BuyingformatchipviewItemWidget()));
  }

  /// Section Widget
  Widget _buildItemLocationChipView(BuildContext context) {
    return Wrap(
        runSpacing: 8.v,
        spacing: 8.h,
        children: List<Widget>.generate(
            4, (index) => ItemlocationchipviewItemWidget()));
  }

  /// Section Widget
  Widget _buildShowOnlyColumn(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Show Only", style: theme.textTheme.titleSmall),
      SizedBox(height: 10.v),
      Wrap(
          runSpacing: 8.v,
          spacing: 8.h,
          children: List<Widget>.generate(11, (index) => ShowonlyItemWidget()))
    ]);
  }

  /// Section Widget
  Widget _buildApplyButton(BuildContext context) {
    return CustomElevatedButton(
        text: "Apply",
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapApplyButton(context);
        });
  }

  /// Navigates to the searchResultScreen when the action is triggered.
  onTapApplyButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchResultScreen);
  }
}
