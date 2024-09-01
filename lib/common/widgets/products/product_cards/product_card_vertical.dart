import 'package:ecommerce/common/styles/shadow_style.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce/common/widgets/icons/circular_icon.dart';
import 'package:ecommerce/common/widgets/images/rounded_images.dart';
import 'package:ecommerce/common/widgets/texts/brand_title_with_verificatiion_icon.dart';
import 'package:ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/images_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(ESizes.productImageRadius),
            color: isDarkMode ? EColors.darkGrey : EColors.white),
        child: Column(
          children: [
            CircularContainer(
              height: 180,
              padding: const EdgeInsets.all(ESizes.sm),
              backgroundColor: isDarkMode ? EColors.dark : EColors.light,
              child: Stack(
                children: [
                  const RoundedImage(
                    width: double.infinity,
                    image: EImages.product7,
                    borderRadius: ESizes.md,
                    applyImageRadius: true,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 12,
                    child: CircularContainer(
                      backgroundColor: EColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: ESizes.sm, vertical: ESizes.xs),
                      child: Text(
                        "25%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: EColors.black),
                      ),
                    ),
                  ),
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: CircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: ESizes.spaceBtwItems / 2,
            ),
            const Padding(
              padding: EdgeInsets.only(left: ESizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: "Biker Leather Jacket",
                    smallSize: true,
                  ),
                  SizedBox(
                    height: ESizes.spaceBtwItems / 2,
                  ),
                  BrandTitleWithVerificationIcon(title: 'Nike',)
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: ESizes.sm),
                  child: ProductPriceText(
                    price: '36.6',
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: EColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(ESizes.cardRadiusMd),
                        bottomRight: Radius.circular(ESizes.productImageRadius),
                      )),
                  child: const SizedBox(
                      width: ESizes.iconLg * 1.2,
                      height: ESizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(
                        Iconsax.add,
                        color: EColors.white,
                      ))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
