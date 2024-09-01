import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/exceptions/firebase_auth_exception.dart';
import 'package:ecommerce/utils/exceptions/firebase_exception.dart';
import 'package:ecommerce/utils/exceptions/format_exception.dart';
import 'package:ecommerce/utils/exceptions/platform_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //Function to show the relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw EFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFireBaseException(e.code).message;
    } on FormatException catch (_) {
      throw EFormatException(_.toString());
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'there is some thing wrong , please try again';
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw EFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFireBaseException(e.code).message;
    } on FormatException catch (_) {
      throw EFormatException(_.toString());
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'there is some thing wrong , please try again';
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      //trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await _auth.signInWithCredential(credentials);
      
    } on FirebaseAuthException catch (e) {
      throw EFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFireBaseException(e.code).message;
    } on FormatException catch (_) {
      throw EFormatException(_.toString());
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'there is some thing wrong , please try again';
    }
  }

//[Email Verification]
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw EFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFireBaseException(e.code).message;
    } on FormatException catch (_) {
      throw EFormatException(_.toString());
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'there is some thing wrong , please try again';
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw EFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFireBaseException(e.code).message;
    } on FormatException catch (_) {
      throw EFormatException(_.toString());
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'there is some thing wrong , please try again';
    }
  }
}
