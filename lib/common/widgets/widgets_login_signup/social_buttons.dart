import 'package:ecommerce/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/images_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: EColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: ()=> controller.googleSignIn(),
              icon: const Image(
                  width: ESizes.iconMd,
                  height: ESizes.iconMd,
                  image: AssetImage(EImages.google))),
        ),
        const SizedBox(
          width: ESizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: EColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: ESizes.iconMd,
                  height: ESizes.iconMd,
                  image: AssetImage(EImages.faceBook))),
        ),
      ],
    );
  }
}
