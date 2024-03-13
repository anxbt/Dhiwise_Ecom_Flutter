import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class WidgetItemWidget extends StatelessWidget {
  const WidgetItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgProductImage238x375,
      height: 238.v,
      width: 375.h,
    );
  }
}
