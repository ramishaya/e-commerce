import 'package:ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/images_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CurvedEdgesWidget(
              child: PrimaryHedaerContainer(
                child: Column(
                  children: [
                    HomeAppBar(),
                    SizedBox(
                      height: ESizes.spaceBtwSections,
                    ),
                    SearchContainer(
                      text: "Search in Store ",
                    ),
                    SizedBox(
                      height: ESizes.spaceBtwSections,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: ESizes.defaultSpace),
                      child: Column(
                        children: [
                          SectionHeading(
                            title: "Popular Categories",
                            showActionButton: false,
                            textColor: EColors.white,
                          ),
                          SizedBox(
                            height: ESizes.spaceBtwItems,
                          ),
                          HomeCategories()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(ESizes.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(
                    banners: [
                      EImages.bannerImage2,
                      EImages.bannerImage3,
                    ],
                  ),

                  const SizedBox(
                    height: ESizes.spaceBtwSections,
                  ),
                  const SectionHeading(
                      showActionButton: true, title: "Popular Products"),
                  const SizedBox(
                    height: ESizes.spaceBtwItems,
                  ),
                  //Popular Products Layout
                  GridLayout(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const ProductCardVertical();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
