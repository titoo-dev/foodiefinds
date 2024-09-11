import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'app/common/config_reader.dart';
import 'app/data/services/restaurant_service.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put(Logger());
    Get.put(Dio(BaseOptions(
      baseUrl: ConfigReader.host,
    ))
      ..interceptors.add(PrettyDioLogger()));
    Get.put(GetStorage());
    Get.put(RestaurantService(client: Get.find(), storage: Get.find()));
  }
}
