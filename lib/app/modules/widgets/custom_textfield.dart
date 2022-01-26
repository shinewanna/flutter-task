import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/utils/app_util.dart';

class CustomTextField extends Container {
  final TextEditingController? controller;
  final String? hint;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final String? value;
  final Function(String)? validator;
  final bool autoValidate;
  final int? maxLength;
  final Widget? trailing;
  final bool autoFocus;

  CustomTextField({
    this.controller,
    this.hint,
    this.onChanged,
    this.keyboardType = TextInputType.multiline,
    this.value,
    this.validator,
    this.autoValidate = true,
    this.maxLength,
    this.trailing,
    this.autoFocus = false,
  });
  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.only(left: 20.0),
      border: InputBorder.none,
      suffixIcon: trailing,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: null,
        decoration: decoration,
        onChanged: onChanged,
        initialValue: value,
        maxLength: maxLength,
        autofocus: autoFocus,
        validator: (text) => autoValidate
            ? AppUtil.validate(text!)
            : validator == null
                ? null
                : validator!(text!),
      ),
    );
  }
}
