import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_task/app/modules/widgets/nth.dart';

class ConnectivityLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        return connected
            ? Nth()
            : Container(
                height: 25,
                color: Colors.red,
                child: Center(
                  child: Text(
                    'No Internet',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
      },
      child: Nth(),
    );
  }
}
