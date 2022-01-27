import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/app/data/enums/null_image_type.dart';
import 'package:flutter_task/app/data/enums/shape_type.dart';
import 'package:flutter_task/app/data/providers/cache_provider.dart';
import 'package:flutter_task/app/modules/widgets/loading.dart';
import 'package:flutter_task/app/modules/widgets/nth.dart';
import 'package:flutter_task/app/modules/widgets/null_image.dart';

class CacheImage extends Container {
  final String? baseUrl;
  final String? endUrl;
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? nullImageUrl;
  final NullImageType nullImageType;
  final FilterQuality filterQuality;
  final ShapeType shapeType;
  final BorderRadius? customBorderRadius;

  CacheImage({
    this.imageUrl,
    this.baseUrl,
    this.endUrl,
    this.width = double.infinity,
    this.height,
    this.fit = BoxFit.cover,
    this.nullImageUrl,
    this.nullImageType = NullImageType.defaultNullImage,
    this.filterQuality = FilterQuality.low,
    this.shapeType = ShapeType.none,
    this.customBorderRadius,
  });
  @override
  Widget build(BuildContext context) {
    return imageUrl.isEmptyOrNull ? tryWithSeperateUrl : cacheNetImg(imageUrl!);
  }

  get tryWithSeperateUrl => endUrl.isEmptyOrNull || baseUrl.isEmptyOrNull
      ? nullImage()
      : cacheNetImg('$baseUrl$endUrl');

  nullImage() {
    switch (nullImageType) {
      case NullImageType.nth:
        return Nth();
      case NullImageType.nthWithSize:
        return SizedBox(
          height: height,
          width: width,
        );
      case NullImageType.defaultNullImage:
        return NullImage(
          imageUrl: nullImageUrl,
          height: height,
          width: width,
          fit: fit,
          shapeType: shapeType,
        );
    }
  }

  Widget cacheNetImg(String url) {
    return ClipRRect(
      // ignore: prefer_if_null_operators
      borderRadius: customBorderRadius == null
          ? BorderRadius.circular(shapeType == ShapeType.round
              ? 30
              : shapeType == ShapeType.curve
                  ? 10
                  : 0)
          : customBorderRadius,

      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => SizedBox(
          width: width,
          height: height,
          child: Loading(size: 25),
        ),
        errorWidget: (context, url, error) => nullImage(),
        filterQuality: filterQuality,
        fit: fit,
        width: width,
        height: height,
      ),
    );
  }
}
