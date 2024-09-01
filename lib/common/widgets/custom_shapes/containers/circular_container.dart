import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = ESizes.cardRadiusLg,
      this.padding,
      this.child,
      this.backgroundColor,
      this.margin,
      this.showBorder = false,
      this.borderColor = EColors.grey});
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? padding;
  final Widget? child;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final bool showBorder;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          border: showBorder ? Border.all(color: borderColor!, width: 1) : null,
          borderRadius: BorderRadius.circular(
            radius,
          ),
          color: backgroundColor),
      child: child,
    );
  }
}
