
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CardCounterIcon extends StatelessWidget {
  const CardCounterIcon({
    super.key,
    this.iconColor,
    required this.onPressed,
  });
  final Color? iconColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor?? (HelperFunctions.isDarkMode(context)?EColors.white : EColors.black     ),
          )),
      Positioned(
        right: 0,
        top: 3,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: EColors.black,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              '2',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: EColors.white, fontSizeFactor: 0.8),
            ),
          ),
        ),
      ),
    ]);
  }
}
