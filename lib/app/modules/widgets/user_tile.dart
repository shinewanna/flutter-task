import 'package:flutter/material.dart';
import 'package:flutter_task/app/data/enums/shape_type.dart';
import 'package:flutter_task/app/data/models/user_model.dart';
import 'package:flutter_task/app/modules/widgets/cache_image.dart';

class UserTile extends Container {
  final UserData user;

  UserTile({required this.user});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CacheImage(
        imageUrl: user.picture,
        width: 60,
        height: 60,
        shapeType: ShapeType.round,
      ),
      title: Text('${user.firstName}${user.lastName}'),
    );
  }
}
