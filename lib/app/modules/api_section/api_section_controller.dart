import 'package:flutter_task/app/core/utils/app_util.dart';
import 'package:flutter_task/app/data/models/resp_model.dart';
import 'package:flutter_task/app/data/models/user_model.dart';
import 'package:flutter_task/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ApiSectionController extends GetxController {
  final resp = Resp().obs;
  final refreshController = RefreshController();
  final _repo = Get.find<UserRepository>();

  getUsers({bool isMore = false}) async {
    if (isMore) {
      final moreResp = await _repo.getUsers(page: AppUtil.getPage(resp));
      final items = resp.value.data as List<UserData>;
      items.addAll(moreResp.data as List<UserData>);
      moreResp.data = items;
      resp.value = moreResp;
      refreshController.loadComplete();
    } else {
      resp.value = await _repo.getUsers();
      refreshController.refreshCompleted();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }
}
