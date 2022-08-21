import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? label;
  final Key? key;
  final String? hintText;
  final String? errorText;
  final Icon? prefixIcon;
  final double? borderRadius;
  final String? initialValue;
  final int? maxLine;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Function(String? value)? onSaved;
  final Function(String? value)? onChanged;
  final String? Function(String? value)? validator;
  const InputField({
    this.key,
    this.label,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.borderRadius = 15,
    this.initialValue,
    this.textInputAction = TextInputAction.done,
    this.maxLine,
    this.obscureText = false,
    this.keyboardType = TextInputType.emailAddress,
    this.controller,
    this.onSaved,
    this.onChanged,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        errorText: errorText,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        prefixIcon: prefixIcon,
        prefixStyle: const TextStyle(
          color: Colors.red,
        ),
        alignLabelWithHint: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorLight,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorLight,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
      ),
      
      textInputAction: textInputAction,
      maxLines: maxLine,
      obscureText: obscureText,
      initialValue: initialValue,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
