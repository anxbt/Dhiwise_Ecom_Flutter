import 'package:anubrat_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 10.v),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(children: [
                          _buildCategoryOptionBikini(context,
                              bikiniIcon: ImageConstant.imgArrowRight,
                              bikiniText: "Shirt", onTapBikiniIcon: () {
                            onTapBikiniIcon(context);
                          }),
                          _buildCategoryOptionBikini(context,
                              bikiniIcon: ImageConstant.imgBikiniIcon,
                              bikiniText: "Bikini"),
                          _buildCategoryOptionBikini(context,
                              bikiniIcon: ImageConstant.imgDressIcon,
                              bikiniText: "Dress"),
                          _buildCategoryOptionBikini(context,
                              bikiniIcon: ImageConstant.imgManWorkEquipment,
                              bikiniText: "Work Equipment"),
                          _buildCategoryOptionBikini(context,
                              bikiniIcon: ImageConstant.imgManPantsIcon,
                              bikiniText: "Man Pants"),
                          _buildCategoryOptionBikini(context,
                              bikiniIcon: ImageConstant.imgManShoesIcon,
                              bikiniText: "Man Shoes"),
                          _buildCategoryOptionBikini(context,
                              bikiniIcon: ImageConstant.imgManUnderwearIcon,
                              bikiniText: "Man Underwear"),
                          _buildCategoryOptionBikini(context,
                              bikiniIcon: ImageConstant.imgManTShirtIcon,
                              bikiniText: "Man T-Shirt"),
                          _buildCategoryOptionBikini(context,
                              bikiniIcon: ImageConstant.imgWomanBagIcon,
                              bikiniText: "Woman Bag"),
                          _buildCategoryOptionBikini(context,
                              bikiniIcon: ImageConstant.imgWomanPantsIcon,
                              bikiniText: "Woman Pants"),
                          _buildCategoryOptionBikini(context,
                              bikiniIcon: ImageConstant.imgHighHeelsIcon,
                              bikiniText: "High Heels")
                        ]))))));
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
            text: "Category", margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildCategoryOptionBikini(
    BuildContext context, {
    required String bikiniIcon,
    required String bikiniText,
    Function? onTapBikiniIcon,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: bikiniIcon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              onTap: () {
                onTapBikiniIcon!.call();
              }),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
              child: Text(bikiniText,
                  style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(1))))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates back to the previous screen.
  onTapBikiniIcon(BuildContext context) {
    Navigator.pop(context);
  }
}
