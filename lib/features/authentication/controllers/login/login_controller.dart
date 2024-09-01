import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/utils/device/network_manger.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find<LoginController>();

  final localStorage = GetStorage();

  final rememberMe = false.obs;
  final hidePasword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (localStorage.read("REMEMBER_ME_EMAIL") != null) {
      email.text = localStorage.read("REMEMBER_ME_EMAIL");
    }
    if (localStorage.read("REMEMBER_ME_PASSWORD") != null) {
      password.text = localStorage.read("REMEMBER_ME_PASSWORD");
    }

    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      FullScreenLoader.openLoadingDialog("Logging you In .....");

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      //save user data
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      FullScreenLoader.stopLoadingDialog();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      Loaders.errorSnackBar(title: "Snap Out", message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      FullScreenLoader.openLoadingDialog("Logging you in ...");

      // check the InterNet Connection

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        
      }
    } catch (e) {
      Loaders.errorSnackBar(title: "OhSnap", message: e.toString());
    }
  }
}
