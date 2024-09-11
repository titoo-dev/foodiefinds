import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/mixins/api_request.dart';
import '../restaurant_for_listing_model.dart';
import '../restaurant_model.dart';

class RestaurantService extends GetxService with ApiRequest {
  final Dio client;

  final GetStorage storage;

  RestaurantService({required this.client, required this.storage});

  Future<List<RestaurantForListing>> getRestaurantsForListing() async {
    try {
      return await getRequest<List<RestaurantForListing>>(
        GetRequestParams(
          path: '/items/restaurants',
          onSuccess: (data) => (data['data'] as List)
              .map((restaurant) => RestaurantForListing.fromJson(restaurant))
              .toList(),
          queryParameters: const {
            'fields': 'id,name,description,address,rating,image,cuisine_type',
            'limit': 10,
          },
          client: client,
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Restaurant> getRestaurantById(int restaurantId) async {
    try {
      return await getRequest<Restaurant>(
        GetRequestParams(
          path: '/items/restaurants/$restaurantId',
          onSuccess: (data) => Restaurant.fromJson(data['data']),
          client: client,
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
