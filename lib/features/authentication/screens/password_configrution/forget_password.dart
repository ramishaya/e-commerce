import 'package:ecommerce/features/authentication/screens/password_configrution/reset_password.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ETexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: ESizes.spaceBtwItems,
              ),
              Text(
                ETexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: ESizes.spaceBtwItems * 2,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text(ETexts.email),
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
              const SizedBox(
                height: ESizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.off(() => const ResetPasswordScreen()),
                    child: const Text(ETexts.submit)),
              )
            ],
          ),
        ));
  }
}
