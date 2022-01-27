import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/config/app_color.dart';
import 'package:loading_animations/loading_animations.dart';

class Loading extends Container {
  final double size;

  Loading({this.size = 40});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingBouncingGrid.square(
        size: size,
        backgroundColor: AppColor.p,
      ),
    );
  }
}
