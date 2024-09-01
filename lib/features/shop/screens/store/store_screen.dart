import 'package:ecommerce/common/widgets/appBar/app_bar.dart';
import 'package:ecommerce/common/widgets/appBar/tab_bar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/brand/brand_card.dart';
import 'package:ecommerce/common/widgets/products/brand/brand_show_case.dart';
import 'package:ecommerce/common/widgets/products/cart/cart_menu_icons.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/images_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: EColors.black,
        appBar: EAppBar( 
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [CardCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: HelperFunctions.isDarkMode(context)
                      ? EColors.black
                      : EColors.white,
                  expandedHeight: HelperFunctions.screenHeight() * 2,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(ESizes.defaultSpace),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const SizedBox(
                          height: ESizes.spaceBtwItems,
                        ),
                        const SearchContainer(
                          text: "Search in Store",
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: ESizes.spaceBtwSections,
                        ),
                        SectionHeading(
                          title: "Featured Brands",
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: ESizes.spaceBtwItems / 1.5,
                        ),
                        GridLayout(
                            mainAxisExtent: 0.15,
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              return BrandCard(onTap: () {}, showBorder: true);
                            }),
                      ],
                    ),
                  ),
                  bottom: const ETabBar(
                    tabs: [
                      Tab(
                        child: Text("Sports"),
                      ),
                      Tab(
                        child: Text("Furniture"),
                      ),
                      Tab(
                        child: Text("Electronics"),
                      ),
                      Tab(
                        child: Text("Clothes"),
                      ),
                      Tab(
                        child: Text("Cosmetics"),
                      ),
                    ],
                  ),
                )
              ];
            },
            body: const TabBarView(children: [
              Padding(
                padding: EdgeInsets.all(ESizes.defaultSpace),
                child: Column(
                  children: [
                    BrandShowCase(
                      images: [
                        EImages.product6,
                        EImages.product7,
                        EImages.product5
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ESizes.defaultSpace),
                child: Column(
                  children: [
                    BrandShowCase(
                      images: [
                        EImages.product6,
                        EImages.product7,
                        EImages.product5
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ESizes.defaultSpace),
                child: Column(
                  children: [
                    BrandShowCase(
                      images: [
                        EImages.product6,
                        EImages.product7,
                        EImages.product5
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ESizes.defaultSpace),
                child: Column(
                  children: [
                    BrandShowCase(
                      images: [
                        EImages.product6,
                        EImages.product7,
                        EImages.product5
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ESizes.defaultSpace),
                child: Column(
                  children: [
                    BrandShowCase(
                      images: [
                        EImages.product6,
                        EImages.product7,
                        EImages.product5
                      ],
                    ),
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
