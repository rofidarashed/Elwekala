import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextButton extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final IconData? prefixIcon;
  final FloatingLabelBehavior? floatingLabelBehavior;
  const InputTextButton({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.validator,
    required this.obscureText,
    this.textInputType,
    this.textInputFormatter,
    this.prefixIcon, this.floatingLabelBehavior,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        keyboardType: textInputType,
        inputFormatters: textInputFormatter,
        decoration: InputDecoration(
          floatingLabelBehavior: floatingLabelBehavior ?? FloatingLabelBehavior.always,
          prefixIcon: Icon(prefixIcon, color: defaultColor),
          label: Text(labelText),
          labelStyle: TextStyle(color: defaultColor),
          floatingLabelStyle: TextStyle(color: defaultColor),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: grayGreen0),
          ),
          fillColor: white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: grayGreen),
          ),

          hintStyle: TextStyle(color: textGreen),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

