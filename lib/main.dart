import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/common/config_reader.dart';
import 'app/routes/app_pages.dart';
import 'initial_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ConfigReader.initialize();

  runApp(
    GetMaterialApp(
      title: 'FoodieFinds',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBindings(),
    ),
  );
}
