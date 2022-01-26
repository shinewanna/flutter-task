import 'package:flutter_task/app/data/enums/msg_state.dart';

class Resp {
  dynamic data;
  MsgState message;

  Resp({
    this.data,
    this.message = MsgState.loading,
  });
}

extension MsgStateExt on MsgState {
  bool get isError => this == MsgState.error;
  bool get isData => this == MsgState.data;
}
