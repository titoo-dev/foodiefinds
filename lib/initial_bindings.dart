import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import 'app/common/config_reader.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put(Logger());
    Get.put(Dio(BaseOptions(
      baseUrl: ConfigReader.host,
    )));
    Get.put(GetStorage());
  }
}
