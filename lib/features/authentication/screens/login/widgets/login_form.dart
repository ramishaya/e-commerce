import 'package:ecommerce/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce/features/authentication/screens/password_configrution/forget_password.dart';
import 'package:ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: ESizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                validator: (value) => EValidator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: ETexts.email),
              ),
              const SizedBox(height: ESizes.spaceBtwInputField),
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  expands: false,
                  decoration: InputDecoration(
                    label: const Text(ETexts.password),
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePasword.value =
                            !controller.hidePasword.value,
                        icon: controller.hidePasword.value
                            ? const Icon(Iconsax.eye_slash)
                            : const Icon(Iconsax.eye)),
                  ),
                  obscureText: controller.hidePasword.value,
                  validator: (value) => EValidator.validatePassword(value),
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwInputField / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value,
                        ),
                      ),
                      const Text(ETexts.rememberMe)
                    ],
                  ),
                  TextButton(
                      onPressed: () =>
                          Get.to(() => const ForgetPasswordScreen()),
                      child: Text(
                        ETexts.forgetPassword,
                        style: Theme.of(context).textTheme.bodySmall,
                      ))
                ],
              ),
              const SizedBox(height: ESizes.spaceBtwSections),

              ///Sign In Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.emailAndPasswordSignIn(),
                      child: const Text(ETexts.signIn))),
              const SizedBox(
                height: ESizes.spaceBtwItems,
              ),

              ///Create Account In Button
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: const Text(ETexts.createAccount))),
              const SizedBox(
                height: ESizes.spaceBtwSections,
              ),
            ],
          ),
        ));
  }
}
