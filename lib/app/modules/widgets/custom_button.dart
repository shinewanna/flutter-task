import 'package:flutter/material.dart';

class CustomButton extends Container {
  final VoidCallback? onTap;
  final String buttonLabel;

  CustomButton({
    this.onTap,
    this.buttonLabel = 'button',
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          buttonLabel,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
      ),
    );
  }
}
