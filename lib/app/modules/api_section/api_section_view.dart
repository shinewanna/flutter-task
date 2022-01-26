import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'api_section_controller.dart';

class ApiSectionView extends GetView<ApiSectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ApiSectionView'),
      ),
      body: Center(
        child: Text(
          'ApiSectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
