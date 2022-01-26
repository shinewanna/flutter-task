import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/data/providers/api_provider.dart';
import 'package:get/instance_manager.dart';

class DependencyInjection {
  DependencyInjection.injectDio() {
    final dioCacheManager = DioCacheManager(CacheConfig());
    final dio = Dio(BaseOptions(baseUrl: AppConstant.url.base));
    dio.interceptors.add(dioCacheManager.interceptor);
    Get.lazyPut(() => dio);
    Get.lazyPut(() => ApiProvider());
  }
}
