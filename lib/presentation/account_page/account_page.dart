import 'package:anubrat_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_title.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 11.v),
                child: Column(children: [
                  _buildAccountOptionOrder(context,
                      bagIcon: ImageConstant.imgLockPrimary,
                      order: "Profile", onTapAccountOptionOrder: () {
                    onTapAccountOptionOrder(context);
                  }),
                  _buildAccountOptionOrder(context,
                      bagIcon: ImageConstant.imgBagIcon, order: "Order"),
                  _buildAccountOptionOrder(context,
                      bagIcon: ImageConstant.imgLinkedin, order: "Address"),
                  SizedBox(height: 5.v),
                  _buildAccountOptionOrder(context,
                      bagIcon: ImageConstant.imgCreditCardIcon,
                      order: "Payment", onTapAccountOptionOrder: () {
                    onTapAccountOptionOrder1(context);
                  })
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title:
            AppbarTitle(text: "Account", margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotificationIcon,
              margin: EdgeInsets.fromLTRB(13.h, 15.v, 13.h, 16.v),
              onTap: () {
                onTapNotificationIcon(context);
              })
        ]);
  }

  /// Common widget
  Widget _buildAccountOptionOrder(
    BuildContext context, {
    required String bagIcon,
    required String order,
    Function? onTapAccountOptionOrder,
  }) {
    return GestureDetector(
        onTap: () {
          onTapAccountOptionOrder!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: bagIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
                  child: Text(order,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))))
            ])));
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapNotificationIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationScreen);
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapAccountOptionOrder(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileScreen);
  }

  /// Navigates to the addPaymentScreen when the action is triggered.
  onTapAccountOptionOrder1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addPaymentScreen);
  }
}
