import 'package:anubrat_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'widgets/creditcarditems_item_widget.dart';
import 'package:anubrat_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

class CreditCardAndDebitScreen extends StatelessWidget {
  const CreditCardAndDebitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 9.v),
                child: Column(children: [
                  SizedBox(height: 8.v),
                  _buildCreditCardItems(context),
                  Spacer()
                ])),
            bottomNavigationBar: _buildAddCard(context)));
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
            text: "Credit Card And Debit",
            margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildCreditCardItems(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 14.v);
            },
            itemCount: 2,
            itemBuilder: (context, index) {
              return CreditcarditemsItemWidget(onTapCreditCardItem: () {
                onTapCreditCardItem(context);
              });
            }));
  }

  /// Section Widget
  Widget _buildAddCard(BuildContext context) {
    return CustomElevatedButton(
        text: "Add Card",
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapAddCard(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the lailyfaFebrinaCardScreen when the action is triggered.
  onTapCreditCardItem(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.lailyfaFebrinaCardScreen);
  }

  /// Navigates to the addCardScreen when the action is triggered.
  onTapAddCard(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addCardScreen);
  }
}
