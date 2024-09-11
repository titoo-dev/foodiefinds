import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../data/restaurant_for_listing_model.dart';
import '../../../data/services/restaurant_service.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final RestaurantService restaurantService;

  final GetStorage storage;

  final Logger logger;

  HomeController({
    required this.restaurantService,
    required this.storage,
    required this.logger,
  });

  // states
  final currentNavigationIndex = 0.obs;
  final List<RestaurantForListing> restaurants = [];

  // UI functions
  void navigate(int index) => currentNavigationIndex.value = index;

  void onRestaurantSelected(int restaurantId) {
    Get.toNamed(Routes.PRODUCT, arguments: restaurantId);
  }

  Future<bool> getRestaurants() async {
    try {
      final restaurants = await restaurantService.getRestaurantsForListing();
      this.restaurants.assignAll(restaurants);
      logger.i(restaurants);
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}
