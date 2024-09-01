import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/authentication/models/user_model.dart';
import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/utils/device/network_manger.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find<SignupController>();

  final Rx<bool> hidePassword = true.obs;
  final Rx<bool> privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form Key for Form validation

  Future<void> signUp() async {
    try {
      //Loading
      FullScreenLoader.openLoadingDialog("We Are Processing your information");

      //check For InterNet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      //Check Validation

      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                "In order to Create an Account you chould read and accept the privacy policy ");
        return;
      }
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          phonNumber: phoneNumber.text.trim(),
          userName: userName.text.trim(),
          profilePicture: "");

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      FullScreenLoader.stopLoadingDialog();

      Loaders.successSnackBar(
          title: "Congratulations", message: "Your Account has been created");

      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      Loaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
