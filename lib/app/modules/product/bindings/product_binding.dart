import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(
        logger: Get.find(),
        restaurantService: Get.find(),
        storage: Get.find(),
      ),
    );
  }
}
