import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/ecommerce_app.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Initialize Local Storage
  await GetStorage.init();

  //-- await splash screen until other items loads

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Intialize FireBase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const ECommerceApp());
}
