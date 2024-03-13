import 'package:anubrat_s_application2/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class ArrowrightItemWidget extends StatelessWidget {
  const ArrowrightItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(
          children: [
            CustomIconButton(
              height: 70.adaptSize,
              width: 70.adaptSize,
              padding: EdgeInsets.all(23.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
              ),
            ),
            SizedBox(height: 7.v),
            Text(
              "Man Shirt",
              style: CustomTextStyles.bodySmall10,
            ),
          ],
        ),
      ),
    );
  }
}
