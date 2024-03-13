import 'package:anubrat_s_application2/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class CategoriesgridItemWidget extends StatelessWidget {
  const CategoriesgridItemWidget({Key? key})
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
            imagePath: ImageConstant.imgManWorkEquipment,
          ),
        ),
        SizedBox(height: 8.v),
        Text(
          "Office Bag",
          style: CustomTextStyles.labelMediumBluegray300,
        ),
      ],
    );
  }
}
