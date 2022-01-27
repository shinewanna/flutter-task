import 'package:flutter/material.dart';
import 'package:flutter_task/app/data/providers/cache_provider.dart';
import 'package:flutter_task/app/modules/widgets/custom_button.dart';
import 'package:flutter_task/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FlutterLogo(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomButton(
            buttonLabel: 'API Section',
            onTap: () => Get.toNamed(Routes.API_SECTION),
          ),
          CustomButton(
            buttonLabel: 'Task Section',
            onTap: () {
              Get.toNamed(
                  (CacheProvider.myId.getValue() as String?).isEmptyOrNull
                      ? Routes.LOGIN
                      : Routes.TASK_SECTION);
            },
          )
        ],
      ),
    );
  }
}
