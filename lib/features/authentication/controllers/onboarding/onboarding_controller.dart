import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  // here we define a getter  for the property (instance)
  static OnBoardingController get instance => Get.find<OnBoardingController>();

  final pageController = PageController();

  // here we define a reactive variable that holds an integer
  // .obs is a method in Getx that turns a regular data type into a  observable data type
  //This is key to how GetX manages state reactively.
  //the integer 0 becomes a reactive or observable integer.
  // this allows Getx to monitor the value for changes
  // this is called Reactive State Management , any part of the app that depends on the currentPageIndex will be reRendered when the value   changes
  Rx<int> currentPageIndex = 0.obs;

  /// variables

  /// Update  page index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  ///Update current Index & jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
    
      storage.write("isFirstTime", false);
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  ///Update current Index & jump to the last page

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
