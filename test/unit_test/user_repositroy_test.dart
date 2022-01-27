import 'package:flutter_task/app/data/enums/msg_state.dart';
import 'package:flutter_task/app/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'user_repository_mock.dart';

void main() {
  test('User Repository Test', () async {
    final userRepo = UserRepositoryMock();
    final resp = await userRepo.getUsers();
    //* Expect the message is data
    expect(resp.message, MsgState.data);
    final users = resp.data as List<UserData>;
    //* Expect the first user's first name is Shine
    expect(users[0].firstName, 'Shine');
  });
}
