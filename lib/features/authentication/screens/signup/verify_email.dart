import 'package:ecommerce/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/images_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    final isDarkMode = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ///Image
                Center(
                    child: Image(
                  image: const AssetImage(EImages.onBoardingImage1),
                  width: HelperFunctions.screenWidtht() * 0.600,
                )),
                const SizedBox(
                  height: ESizes.spaceBtwSections,
                ),

                /// Title & SubTitle
                Text(
                  ETexts.verifyEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: ESizes.spaceBtwItems,
                ),
                Text(
                  email ?? "",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: ESizes.spaceBtwItems,
                ),
                Text(
                  ETexts.verifyEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: ESizes.spaceBtwSections,
                ),

                /// Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          controller.checkEmailVerificationStatus(),
                      child: const Text(ETexts.eContinue)),
                ),
                const SizedBox(
                  height: ESizes.spaceBtwItems,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendEmailVerification(),
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
        ),
      ),
    );
  }
}
