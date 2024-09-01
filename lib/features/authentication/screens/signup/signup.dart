import 'package:ecommerce/common/widgets/widgets_login_signup/form_divider.dart';
import 'package:ecommerce/common/widgets/widgets_login_signup/social_buttons.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/sign_up_form.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ETexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: ESizes.spaceBtwSections,
              ),

              ///Form
              const SignUpForm(),

              
              const SizedBox(
                height: ESizes.spaceBtwSections,
              ),

              /// Divider
              FormDivider(
                dividerText: ETexts.orSignInWith.capitalize!,
              ),
              const SizedBox(
                height: ESizes.spaceBtwSections,
              ),

              /// Social Buttons
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
