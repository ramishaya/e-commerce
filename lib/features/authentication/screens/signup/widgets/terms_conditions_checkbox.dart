import 'package:ecommerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TermsConditionsCheckBox extends StatelessWidget {
  const TermsConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final isDarkMode = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) {
                  controller.privacyPolicy.value = value!;
                }))),
        const SizedBox(
          width: ESizes.spaceBtwItems,
        ),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: '${ETexts.isAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: '${ETexts.privarcyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: isDarkMode ? EColors.white : EColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          isDarkMode ? EColors.white : EColors.primary,
                    )),
            TextSpan(
                text: '${ETexts.and} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: '${ETexts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: isDarkMode ? EColors.white : EColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          isDarkMode ? EColors.white : EColors.primary,
                    )),
          ])),
        )
      ],
    );
  }
}
