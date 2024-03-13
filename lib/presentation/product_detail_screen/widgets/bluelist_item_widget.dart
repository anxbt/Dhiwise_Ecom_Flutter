import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class BluelistItemWidget extends StatelessWidget {
  const BluelistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: CustomImageView(
          imagePath: ImageConstant.imgGroup475,
          height: 48.adaptSize,
          width: 48.adaptSize,
        ),
      ),
    );
  }
}
