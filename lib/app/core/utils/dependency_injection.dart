import 'package:dio/dio.dart';
import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/data/providers/api_provider.dart';
import 'package:get/instance_manager.dart';

class DependencyInjection {
  DependencyInjection.injectDio() {
    final dio = Dio(BaseOptions(baseUrl: AppConstant.url.base));
    Get.lazyPut(() => dio);
    Get.lazyPut(() => ApiProvider());
  }
}
