import 'dart:async';

import 'package:ecommerce/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/utils/constants/images_strings.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance =>
      Get.find<VerifyEmailController>();

// send the Email Whenever the verify screen appers  & set timer for auto redirect

  @override
  void onInit() {
    sendEmailVerification();
     setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
          title: "Email Sent",
          message: "Please check Your Inbox and verify your email");
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(() => SuccessScreen(
              image: EImages.onBoardingImage2,
              title: "Congrats",
              subTitle: "Your Account has been created succeesfuly",
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect()));
        }
      },
    );
  }
   //Manually check if the user is Loged in
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: EImages.onBoardingImage2,
          title: "Congrats",
          subTitle: "Your Account has been created succeesfuly",
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
