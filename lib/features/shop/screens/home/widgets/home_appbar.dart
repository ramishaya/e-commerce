import 'package:ecommerce/common/widgets/appBar/app_bar.dart';
import 'package:ecommerce/common/widgets/products/cart/cart_menu_icons.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EAppBar(
      showBackArrow: false,
      title: Column(
        children: [
          Text(
            "Good Day For Shooping",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: EColors.grey),
          ),
          Text(
            "Rami  shaya",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: EColors.white),
          ),
        ],
      ),
      actions: [
        CardCounterIcon(
          onPressed: () {},
        )
      ],
    );
  }
}
