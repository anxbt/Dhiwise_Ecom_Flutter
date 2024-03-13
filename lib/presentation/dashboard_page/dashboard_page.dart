import 'package:anubrat_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:anubrat_s_application2/widgets/app_bar/appbar_trailing_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'widgets/offerbanner_item_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'widgets/arrowright_item_widget.dart';
import 'widgets/flashsale_item_widget.dart';
import 'widgets/megasale_item_widget.dart';
import 'widgets/products_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 27.v),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(children: [
                          _buildOfferBanner(context),
                          SizedBox(height: 16.v),
                          SizedBox(
                              height: 8.v,
                              child: AnimatedSmoothIndicator(
                                  activeIndex: sliderIndex,
                                  count: 1,
                                  axisDirection: Axis.horizontal,
                                  effect: ScrollingDotsEffect(
                                      spacing: 8,
                                      activeDotColor: theme.colorScheme.primary
                                          .withOpacity(1),
                                      dotColor: appTheme.blue50,
                                      dotHeight: 8.v,
                                      dotWidth: 8.h))),
                          SizedBox(height: 25.v),
                          _buildCategories(context),
                          SizedBox(height: 37.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: _buildFlashSaleHeader(context,
                                  flashSaleText: "Flash Sale",
                                  seeMoreText: "See More",
                                  onTapFlashSaleHeader: () {
                                onTapFlashSaleHeader(context);
                              })),
                          SizedBox(height: 12.v),
                          _buildFlashSale(context),
                          SizedBox(height: 23.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: _buildFlashSaleHeader(context,
                                  flashSaleText: "Mega Sale",
                                  seeMoreText: "See More")),
                          SizedBox(height: 10.v),
                          _buildMegaSale(context),
                          SizedBox(height: 29.v),
                          CustomImageView(
                              imagePath: ImageConstant.imgRecomendedProduct,
                              height: 206.v,
                              width: 343.h,
                              radius: BorderRadius.circular(5.h)),
                          SizedBox(height: 16.v),
                          _buildProducts(context)
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgRewind,
            margin: EdgeInsets.only(left: 32.h, top: 20.v, bottom: 20.v)),
        title: AppbarSubtitleOne(
            text: "Search Product",
            margin: EdgeInsets.only(left: 8.h),
            onTap: () {
              onTapSearchProduct(context);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLoveIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h),
              onTap: () {
                onTapLoveIcon(context);
              }),
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
  Widget _buildOfferBanner(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: CarouselSlider.builder(
            options: CarouselOptions(
                height: 206.v,
                initialPage: 0,
                autoPlay: true,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  sliderIndex = index;
                }),
            itemCount: 1,
            itemBuilder: (context, index, realIndex) {
              return OfferbannerItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildCategories(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(right: 16.h),
              child: _buildFlashSaleHeader(context,
                  flashSaleText: "Category",
                  seeMoreText: "More Category", onTapSeeMoreText: () {
                onTapTxtSeeMoreText(context);
              })),
          SizedBox(height: 10.v),
          SizedBox(
              height: 94.v,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12.h);
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ArrowrightItemWidget();
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildFlashSale(BuildContext context) {
    return SizedBox(
        height: 238.v,
        child: ListView.separated(
            padding: EdgeInsets.only(left: 16.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.h);
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return FlashsaleItemWidget(onTapProductItem: () {
                onTapProductItem(context);
              });
            }));
  }

  /// Section Widget
  Widget _buildMegaSale(BuildContext context) {
    return SizedBox(
        height: 238.v,
        child: ListView.separated(
            padding: EdgeInsets.only(left: 16.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.h);
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return MegasaleItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildProducts(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 283.v,
                crossAxisCount: 2,
                mainAxisSpacing: 13.h,
                crossAxisSpacing: 13.h),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ProductsItemWidget();
            }));
  }

  /// Common widget
  Widget _buildFlashSaleHeader(
    BuildContext context, {
    required String flashSaleText,
    required String seeMoreText,
    Function? onTapFlashSaleHeader,
    Function? onTapSeeMoreText,
  }) {
    return GestureDetector(
        onTap: () {
          onTapFlashSaleHeader!.call();
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(flashSaleText,
              style: theme.textTheme.titleSmall!
                  .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1))),
          GestureDetector(
              onTap: () {
                onTapSeeMoreText!.call();
              },
              child: Text(seeMoreText,
                  style: CustomTextStyles.titleSmallPrimary.copyWith(
                      color: theme.colorScheme.primary.withOpacity(1))))
        ]));
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapSearchProduct(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchScreen);
  }

  /// Navigates to the favoriteProductScreen when the action is triggered.
  onTapLoveIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.favoriteProductScreen);
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapImgNotificationIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationScreen);
  }

  /// Navigates to the listCategoryScreen when the action is triggered.
  onTapTxtSeeMoreText(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.listCategoryScreen);
  }

  /// Navigates to the superFlashSaleScreen when the action is triggered.
  onTapFlashSaleHeader(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.superFlashSaleScreen);
  }

  /// Navigates to the productDetailScreen when the action is triggered.
  onTapProductItem(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.productDetailScreen);
  }
}
