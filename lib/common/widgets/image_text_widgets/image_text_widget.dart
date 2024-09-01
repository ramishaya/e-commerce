
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class VerticalImagesText extends StatelessWidget {
  const VerticalImagesText({
    super.key,
    required this.icon,
    required this.title,
     this.textColor=EColors.white,
    this.backgroundColor,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ESizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(ESizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor??(HelperFunctions.isDarkMode(context)?EColors.black : EColors.white ),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Icon(
                  icon,
                  color: HelperFunctions.isDarkMode(context) ? EColors.light : EColors.dark,
                ),
              ),
            ),
            const SizedBox(
              height: ESizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
