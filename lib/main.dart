import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/data/handlers/file_handler.dart';
import 'package:flutter_task/app/data/providers/cache_provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheProvider.open(await FileHandler().getPath);
  runApp(PrePage());
}

class PrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstant.def.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black54),
          titleTextStyle: TextStyle(
              color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
