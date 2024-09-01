import 'package:ecommerce/bindings/general_bindings.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: GeneralBindings(),
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const Scaffold(
            backgroundColor: EColors.primary,
            //show Loader meanwhile the authentication repository is deciding to show relevant screen
            body: Center(
              child: CircularProgressIndicator(
                color: EColors.white,
              ),
            )));
  }
}
