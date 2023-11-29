import 'package:get/get.dart';

class BNavController extends GetxController {
  RxInt currentIndex = 0.obs;

  void onChange(index) {
    currentIndex.value = index;

    print(currentIndex);
  }
}
