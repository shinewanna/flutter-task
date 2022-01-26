import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/config/app_color.dart';

class Avater extends Container {
  final String email;

  Avater({required this.email});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.s,
      child: Text(
        email[0].toUpperCase(),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
