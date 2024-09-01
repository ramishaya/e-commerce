import 'package:ecommerce/common/widgets/image_text_widgets/image_text_widget.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HelperFunctions.screenWidtht() * 0.23,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return VerticalImagesText(
            icon: Iconsax.shop,
            title: "Shoes",
            onTap: () {},
          );
        },
      ),
    );
  }
}
