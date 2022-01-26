import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/data/models/resp_model.dart';
import 'package:flutter_task/app/data/models/user_model.dart';
import 'package:flutter_task/app/data/providers/api_provider.dart';
import 'package:get/instance_manager.dart';

class UserRepository {
  final _api = Get.find<ApiProvider>();

  Future<Resp> getUsers({int page = 1}) async {
    final resp = await _api.getReq(AppConstant.url.user, params: {
      'page': page,
      'limit': AppConstant.def.requestLimit,
    });

    if (resp.message.isError) {
      return resp;
    }
    final ob = User.fromJson(resp.data);
    resp.data = ob.data;
    return resp;
  }
}
