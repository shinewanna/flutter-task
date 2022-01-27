import 'package:flutter_task/app/core/utils/app_util.dart';
import 'package:flutter_task/app/data/enums/msg_state.dart';
import 'package:flutter_task/app/data/handlers/bounce_handler.dart';
import 'package:flutter_task/app/data/models/resp_model.dart';
import 'package:flutter_task/app/data/models/user_model.dart';
import 'package:flutter_task/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';
import 'package:print_color/print_color.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ApiSectionController extends GetxController {
  final resp = Resp().obs;
  final refreshController = RefreshController();
  final _repo = Get.find<UserRepository>();
  final _bounceHandler = BounceHandler();
  var _users = <UserData>[];

  getUsers({bool isMore = false}) async {
    if (isMore) {
      final moreResp = await _repo.getUsers(page: AppUtil.getPage(resp));
      final users = resp.value.data as List<UserData>;
      users.addAll(moreResp.data as List<UserData>);
      moreResp.data = users;
      resp.value = moreResp;
      _users = users;
      refreshController.loadComplete();
    } else {
      resp.value = await _repo.getUsers();
      _users = resp.value.data as List<UserData>;
      refreshController.refreshCompleted();
    }
  }

  search(String value) {
    _bounceHandler.run(() {
      final users = <UserData>[];
      if (value.isEmpty) {
        users.addAll(_users);
        resp.value = Resp(data: users, message: MsgState.data);
        return;
      }
      for (var user in _users) {
        if (_isMatch(value, user)) {
          users.add(user);
        }
      }
      resp.value = Resp(data: users, message: MsgState.data);
    });
  }

  bool _isMatch(String value, UserData user) {
    return '${user.firstName}${user.lastName}'
        .toLowerCase()
        .contains(value.toLowerCase());
  }

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }
}
