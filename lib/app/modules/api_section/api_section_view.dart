import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/utils/output.dart';
import 'package:flutter_task/app/data/models/user_model.dart';
import 'package:flutter_task/app/data/providers/cache_provider.dart';
import 'package:flutter_task/app/modules/widgets/custom_textfield.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'api_section_controller.dart';

class ApiSectionView extends GetView<ApiSectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextField(
          hint: 'Search',
          onChanged: controller.search,
        ),
      ),
      body: Obx(
        () => Output(
          controller.resp.value,
          onData: (List<UserData> data) => SmartRefresher(
            controller: controller.refreshController,
            enablePullDown: false,
            enablePullUp: data.isCanLoadMore,
            onLoading: () => controller.getUsers(isMore: true),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final user = data[index];
                return ListTile(
                  title: Text('${user.firstName}${user.lastName}'),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: data.length,
            ),
          ),
        ),
      ),
    );
  }
}
