import 'dart:async';

class BounceHandler {
  Timer? _timer;

  BounceHandler();

  run(f) {
    if (_timer != null) _timer!.cancel();
    _timer = Timer(Duration(milliseconds: 400), f);
  }
}
