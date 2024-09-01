import 'package:ecommerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ecommerce/utils/constants/images_strings.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/onboarding_next_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: (index) => controller.updatePageIndicator(index),
            children: const [
              OnBoardingPage(
                  image: EImages.onBoardingImage1,
                  title: ETexts.onBoardingTitle1,
                  subTitle: ETexts.onBoardingSubTitle1),
              OnBoardingPage(
                  image: EImages.onBoardingImage2,
                  title: ETexts.onBoardingTitle2,
                  subTitle: ETexts.onBoardingSubTitle2),
              OnBoardingPage(
                  image: EImages.onBoardingImage3,
                  title: ETexts.onBoardingTitle3,
                  subTitle: ETexts.onBoardingSubTitle3),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
