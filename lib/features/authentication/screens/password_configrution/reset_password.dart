import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/images_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(ESizes.defaultSpace),
            child: Column(
              children: [
                Center(
                    child: Image(
                  image: const AssetImage(EImages.onBoardingImage3),
                  width: HelperFunctions.screenWidtht() * 0.6,
                )),
                const SizedBox(
                  height: ESizes.spaceBtwSections,
                ),

                /// Title & SubTitle
                Text(
                  ETexts.resetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: ESizes.spaceBtwItems,
                ),
                Text(
                  ETexts.resetPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: ESizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => 2, child: const Text(ETexts.done)),
                ),
                const SizedBox(
                  height: ESizes.spaceBtwItems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        ETexts.resendEmail,
                        style: TextStyle(
                            color: isDarkMode ? EColors.white : EColors.black),
                      )),
                ),
                const SizedBox(
                  height: ESizes.spaceBtwItems,
                ),
              ],
            ),
          ),
        ));
  }
}
