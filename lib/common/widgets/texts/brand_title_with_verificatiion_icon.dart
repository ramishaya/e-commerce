import 'package:ecommerce/common/widgets/texts/brand_title_text.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BrandTitleWithVerificationIcon extends StatelessWidget {
  const BrandTitleWithVerificationIcon(
      {super.key,
      this.textColor,
      this.maxLines = 1,
      required this.title,
      this.iconColor = EColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(
          height: ESizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: ESizes.iconXs,
        )
      ],
    );
  }
}
