import 'package:ecommerce/common/styles/spacing_styles.dart';
import 'package:ecommerce/common/widgets/widgets_login_signup/form_divider.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/widgets_login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyles.paddingWithAppBarHeight,
          child: const Column(
            children: [
              //Screen Header
              LoginHeader(),

              LoginForm(),

              ///Divider
              FormDivider( dividerText: ETexts.signIn),
              SizedBox(
                height: ESizes.spaceBtwSections,
              ),

              SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
