import 'package:ecommerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // First Name Last Name Input Fields
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  expands: false,
                  decoration: const InputDecoration(
                    label: Text(ETexts.firstName),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  validator: (value) =>
                      EValidator.validateEmptyText("First Name", value),
                ),
              ),
              const SizedBox(
                width: ESizes.spaceBtwInputField,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  expands: false,
                  decoration: const InputDecoration(
                    label: Text(ETexts.lastName),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  validator: (value) =>
                      EValidator.validateEmptyText("Last Name", value),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: ESizes.spaceBtwInputField,
          ),

          // User Name Input Field
          TextFormField(
            controller: controller.userName,
            expands: false,
            decoration: const InputDecoration(
              label: Text(ETexts.userName),
              prefixIcon: Icon(Iconsax.user_edit),
            ),
            validator: (value) =>
                EValidator.validateEmptyText("User Name", value),
          ),
          const SizedBox(
            height: ESizes.spaceBtwInputField,
          ),

          // Email Field
          TextFormField(
            validator: (value) => EValidator.validateEmail(value),
            controller: controller.email,
            expands: false,
            decoration: const InputDecoration(
              label: Text(ETexts.email),
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          const SizedBox(
            height: ESizes.spaceBtwInputField,
          ),

          // Phone Number Field
          TextFormField(
            controller: controller.phoneNumber,
            expands: false,
            decoration: const InputDecoration(
              label: Text(ETexts.phoneNumber),
              prefixIcon: Icon(Iconsax.call),
            ),
            validator: (value) => EValidator.validatePhoneNumber(value),
          ),
          const SizedBox(
            height: ESizes.spaceBtwInputField,
          ),

          // Password Field
          Obx(
            () => TextFormField(
              controller: controller.password,
              expands: false,
              decoration: InputDecoration(
                label: const Text(ETexts.password),
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: controller.hidePassword.value
                        ? const Icon(Iconsax.eye_slash)
                        : const Icon(Iconsax.eye)),
              ),
              obscureText: controller.hidePassword.value,
              validator: (value) => EValidator.validatePassword(value),
            ),
          ),
          const SizedBox(
            height: ESizes.spaceBtwSections,
          ),

          const TermsConditionsCheckBox(),
          const SizedBox(
            height: ESizes.spaceBtwSections,
          ),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signUp(),
              child: const Text(ETexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
