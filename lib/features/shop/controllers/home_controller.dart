import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find<HomeController>();
  Rx<int> carouselCurrentIndex = 0.obs;

  void updatePageIndicator(int index) => carouselCurrentIndex.value = index;
}
