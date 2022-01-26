import 'package:flutter/material.dart';

class LabelButton extends Container {
  final String text;
  final VoidCallback? onTap;

  LabelButton({
    this.text = 'Label Button',
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text),
    );
  }
}
