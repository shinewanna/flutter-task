import 'package:flutter_task/app/data/enums/msg_state.dart';
import 'package:flutter_task/app/data/models/resp_model.dart';
import 'package:flutter_task/app/data/models/user_model.dart';
import 'package:flutter_task/app/data/repositories/user_repository.dart';

class UserRepositoryMock implements UserRepository {
  @override
  Future<Resp> getUsers({int page = 1}) {
    List<UserData> users = [
      UserData(firstName: 'Shine', lastName: 'Wanna'),
      UserData(firstName: 'Jason', lastName: 'Derulo'),
    ];
    return Future.value(Resp(data: users, message: MsgState.data));
  }
}
