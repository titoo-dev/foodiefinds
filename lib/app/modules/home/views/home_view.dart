import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FoodieFinds'),
        actions: [
          IconButton(
            icon: const CircleAvatar(child: Icon(Icons.person_outline)),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: const _NavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find your favorite restaurant!',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),

            // search bar
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for restaurants',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),

            const Expanded(
              child: _RestaurantList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _RestaurantList extends GetView<HomeController> {
  const _RestaurantList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getRestaurants(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (controller.restaurants.isEmpty) {
          return const Center(
            child: Text('Empty'),
          );
        }

        return ListView.separated(
          itemCount: controller.restaurants.length,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemBuilder: (context, index) {
            return ListTileTheme(
              child: ListTile(
                title: Text(controller.restaurants[index].name ?? 'unknown'),
                subtitle: Text(
                    controller.restaurants[index].cuisineType?.join(', ') ??
                        'unknown'),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_rounded),
                  onPressed: () => controller.onRestaurantSelected(index),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _NavBar extends GetView<HomeController> {
  const _NavBar();

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (state) {
      return BottomNavigationBar(
        currentIndex: state.currentNavigationIndex.value,
        onTap: controller.navigate,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      );
    });
  }
}
