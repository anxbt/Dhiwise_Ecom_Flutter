import 'package:anubrat_s_application2/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class SuperflashsaleItemWidget extends StatelessWidget {
  SuperflashsaleItemWidget({
    Key? key,
    this.onTapProductItem,
  }) : super(
          key: key,
        );

  VoidCallback? onTapProductItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapProductItem!.call();
      },
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.outlineBlue50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgProductImage3,
              height: 133.adaptSize,
              width: 133.adaptSize,
              radius: BorderRadius.circular(
                5.h,
              ),
            ),
            SizedBox(height: 8.v),
            SizedBox(
              width: 107.h,
              child: Text(
                "Nike Air Max 270 React ENG",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelLarge!.copyWith(
                  height: 1.50,
                ),
              ),
            ),
            SizedBox(height: 4.v),
            CustomRatingBar(
              ignoreGestures: true,
              initialRating: 4,
            ),
            SizedBox(height: 18.v),
            Text(
              "299,43",
              style: CustomTextStyles.labelLargePrimary,
            ),
            SizedBox(height: 5.v),
            Row(
              children: [
                Text(
                  "534,33",
                  style: CustomTextStyles.bodySmall10.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    "24% Off",
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
