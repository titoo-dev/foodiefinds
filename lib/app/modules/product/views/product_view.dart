import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    final int restaurantId = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductView'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getRestaurantById(restaurantId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          return Column(
            children: [
              Text(controller.restaurant?.name ?? 'unknown'),
              Text(controller.restaurant?.description ?? 'unknown'),
              Text(controller.restaurant?.address ?? 'unknown'),
              Text(controller.restaurant?.rating?.toString() ?? 'unknown'),
              Text(controller.restaurant?.cuisineType?.join(', ') ?? 'unknown'),
            ],
          );
        },
      ),
    );
  }
}
