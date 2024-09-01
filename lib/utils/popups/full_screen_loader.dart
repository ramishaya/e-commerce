import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader{
  static void openLoadingDialog(String text) {
    showDialog(
        context: Get.overlayContext!,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: HelperFunctions.isDarkMode(Get.context!)
                  ? EColors.dark
                  : EColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(
                            color: EColors.primary,
                          ),
                          const SizedBox(
                            height: ESizes.defaultSpace,
                          ),
                          Text(
                            text,
                            style: Theme.of(Get.context!).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          )
                        ]),
                  )
                ],
              ),
            )));
  }

  static stopLoadingDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
