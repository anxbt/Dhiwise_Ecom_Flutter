import 'package:anubrat_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_title_searchview.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/categoriesgrid_item_widget.dart';
import 'widgets/categoriesgrid1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 25.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Man Fashion", style: theme.textTheme.titleSmall),
                      SizedBox(height: 13.v),
                      _buildCategoriesGrid(context),
                      SizedBox(height: 37.v),
                      Text("Woman Fashion", style: theme.textTheme.titleSmall),
                      SizedBox(height: 13.v),
                      _buildCategoriesGrid1(context)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitleSearchview(
            margin: EdgeInsets.only(left: 16.h),
            hintText: "Search Product",
            controller: searchController),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLoveIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h)),
          Container(
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 32.h),
              child: Stack(alignment: Alignment.topRight, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgNotificationIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    alignment: Alignment.center,
                    onTap: () {
                      onTapImgNotificationIcon(context);
                    }),
                CustomImageView(
                    imagePath: ImageConstant.imgClosePink300,
                    height: 8.adaptSize,
                    width: 8.adaptSize,
                    alignment: Alignment.topRight,
                    margin:
                        EdgeInsets.only(left: 14.h, right: 2.h, bottom: 16.v))
              ]))
        ]);
  }

  /// Section Widget
  Widget _buildCategoriesGrid(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 94.v,
            crossAxisCount: 4,
            mainAxisSpacing: 21.h,
            crossAxisSpacing: 21.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return CategoriesgridItemWidget();
        });
  }

  /// Section Widget
  Widget _buildCategoriesGrid1(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 93.v,
            crossAxisCount: 4,
            mainAxisSpacing: 21.h,
            crossAxisSpacing: 21.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index) {
          return Categoriesgrid1ItemWidget();
        });
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapImgNotificationIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationScreen);
  }
}
