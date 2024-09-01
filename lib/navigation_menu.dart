import 'package:ecommerce/features/shop/screens/home/home_screen.dart';
import 'package:ecommerce/features/shop/screens/store/store_screen.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());
    final isDarkMode = HelperFunctions.isDarkMode(context);
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            backgroundColor: isDarkMode? EColors.black : EColors.white,
            indicatorColor: isDarkMode? EColors.white.withOpacity(0.1): EColors.black.withOpacity(0.1) ,
            height: HelperFunctions.screenHeight() * 0.09,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.changeIndex(index),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: "WishList"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]));
  }
}

class NavigationMenuController extends GetxController {
  static NavigationMenuController get instance =>
      Get.find<NavigationMenuController>();

  Rx<int> selectedIndex = 0.obs;

  void changeIndex(int index) => selectedIndex.value = index;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];
}
