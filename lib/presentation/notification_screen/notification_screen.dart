import 'package:anubrat_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 12.v),
                child: Column(children: [
                  _buildNotificationOptionRow(context,
                      listIcon: ImageConstant.imgSort,
                      feedText: "Offer", onTapNotificationOptionRow: () {
                    onTapNotificationOptionRow(context);
                  }),
                  _buildNotificationOptionRow(context,
                      listIcon: ImageConstant.imgListIcon,
                      feedText: "Feed", onTapNotificationOptionRow: () {
                    onTapNotificationOptionRow1(context);
                  }),
                  SizedBox(height: 5.v),
                  _buildNotificationOptionRow(context,
                      listIcon: ImageConstant.imgNotificationIconPrimary,
                      feedText: "Acivity", onTapNotificationOptionRow: () {
                    onTapNotificationOptionRow2(context);
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
            text: "Notification", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildNotificationOptionRow(
    BuildContext context, {
    required String listIcon,
    required String feedText,
    Function? onTapNotificationOptionRow,
  }) {
    return GestureDetector(
        onTap: () {
          onTapNotificationOptionRow!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: listIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
                  child: Text(feedText,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))))
            ])));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the notificationOfferScreen when the action is triggered.
  onTapNotificationOptionRow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationOfferScreen);
  }

  /// Navigates to the notificationFeedScreen when the action is triggered.
  onTapNotificationOptionRow1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationFeedScreen);
  }

  /// Navigates to the notificationActivityScreen when the action is triggered.
  onTapNotificationOptionRow2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationActivityScreen);
  }
}
