import 'package:anubrat_s_application2/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class Categoriesgrid1ItemWidget extends StatelessWidget {
  const Categoriesgrid1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          height: 70.adaptSize,
          width: 70.adaptSize,
          padding: EdgeInsets.all(23.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgWomanTShirtIcon,
          ),
        ),
        SizedBox(height: 7.v),
        Text(
          "T-Shirt",
          style: CustomTextStyles.labelMediumBluegray300,
        ),
      ],
    );
  }
}
