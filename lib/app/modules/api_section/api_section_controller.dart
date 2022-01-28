import 'package:flutter_task/app/core/utils/app_util.dart';
import 'package:flutter_task/app/data/enums/msg_state.dart';
import 'package:flutter_task/app/data/handlers/bounce_handler.dart';
import 'package:flutter_task/app/data/models/resp_model.dart';
import 'package:flutter_task/app/data/models/user_model.dart';
import 'package:flutter_task/app/data/providers/resp_cache_provider.dart';
import 'package:flutter_task/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ApiSectionController extends GetxController {
  final resp = Resp().obs;
  final refreshController = RefreshController();
  final _repo = Get.find<UserRepository>();
  final _bounceHandler = BounceHandler();
  final _respCacheProvider = RespCacheProvider();

  getUsers({bool isMore = false}) async {
    if (isMore) {
      final moreResp = await _repo.getUsers(page: AppUtil.getPage(resp));
      final users = resp.value.data as List<UserData>;
      users.addAll(moreResp.data as List<UserData>);
      moreResp.data = users;
      resp.value = moreResp;
      refreshController.loadComplete();
      if (resp.value.message.isData) {
        _respCacheProvider.setValues(users, RespCacheProvider.users);
      }
    } else {
      //* If cache exists show the cache first and then requset the fresh network data
      if (await _respCacheProvider.isExists(boxName: RespCacheProvider.users)) {
        resp.value = Resp(
          data: await _respCacheProvider
              .getValues<UserData>(RespCacheProvider.users),
          message: MsgState.data,
        );
      }
      resp.value = await _repo.getUsers();
      refreshController.refreshCompleted();
      if (resp.value.message.isData) {
        _respCacheProvider.setValues(
            resp.value.data as List<UserData>, RespCacheProvider.users);
      }
    }
  }

  search(String value) {
    //* Bounce is used for not searching in every search textfield onChanged
    _bounceHandler.run(() async {
      final allUsers =
          await _respCacheProvider.getValues<UserData>(RespCacheProvider.users);
      final filteredUsers = <UserData>[];
      //* If search value empty pass all users
      if (value.isEmpty) {
        filteredUsers.addAll(allUsers);
        resp.value = Resp(data: filteredUsers, message: MsgState.data);
        return;
      }
      //* Filtering
      for (var user in allUsers) {
        if (_isMatch(value, user)) {
          filteredUsers.add(user);
        }
      }
      resp.value = Resp(data: filteredUsers, message: MsgState.data);
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
