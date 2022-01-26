import 'package:flutter/material.dart';

class Loading extends Container {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
