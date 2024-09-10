import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentNavigationIndex = 0.obs;

  void navigate(int index) => currentNavigationIndex.value = index;
}
