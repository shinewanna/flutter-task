import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/data/enums/shape_type.dart';

class NullImage extends Container {
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final ShapeType? shapeType;

  NullImage(
      {this.imageUrl,
      this.height,
      this.width,
      this.fit = BoxFit.cover,
      this.shapeType = ShapeType.none});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(shapeType == ShapeType.round
          ? 30
          : shapeType == ShapeType.curve
              ? 10
              : 0),
      child: Image.asset(
        imageUrl ?? AppConstant.file.user,
        fit: fit,
        height: height,
        width: width,
      ),
    );
  }
}
