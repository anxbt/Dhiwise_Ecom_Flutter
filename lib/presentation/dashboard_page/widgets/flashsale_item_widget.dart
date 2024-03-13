import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class FlashsaleItemWidget extends StatelessWidget {
  FlashsaleItemWidget({
    Key? key,
    this.onTapProductItem,
  }) : super(
          key: key,
        );

  VoidCallback? onTapProductItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 141.h,
      child: GestureDetector(
        onTap: () {
          onTapProductItem!.call();
        },
        child: Container(
          padding: EdgeInsets.all(15.h),
          decoration: AppDecoration.outlineBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgProductImage,
                height: 109.adaptSize,
                width: 109.adaptSize,
                radius: BorderRadius.circular(
                  5.h,
                ),
              ),
              SizedBox(height: 7.v),
              SizedBox(
                width: 105.h,
                child: Text(
                  "FS - Nike Air Max 270 React...",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelLarge!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              SizedBox(height: 10.v),
              Text(
                "299,43",
                style: CustomTextStyles.labelLargePrimary,
              ),
              SizedBox(height: 9.v),
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
      ),
    );
  }
}
