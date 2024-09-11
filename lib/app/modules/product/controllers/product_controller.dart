import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../data/restaurant_model.dart';
import '../../../data/services/restaurant_service.dart';

class ProductController extends GetxController {
  final RestaurantService restaurantService;

  final GetStorage storage;

  final Logger logger;

  ProductController({
    required this.restaurantService,
    required this.storage,
    required this.logger,
  });

  // states
  Restaurant? restaurant;

  // UI functions
  Future<bool> getRestaurantById(int restaurantId) async {
    try {
      final restaurant =
          await restaurantService.getRestaurantById(restaurantId);
      this.restaurant = restaurant;
      logger.i(restaurant);
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}
