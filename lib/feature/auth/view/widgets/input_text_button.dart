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
  const InputTextButton({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.validator,
    required this.obscureText,
    this.textInputType,
    this.textInputFormatter,
    this.prefixIcon,
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
          prefixIcon: Icon(prefixIcon, color: defaultColor),
          filled: true,
          fillColor: grayGreen,
          label: Text(labelText),
          labelStyle: TextStyle(color: textGreen),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hintText,
          hintStyle: TextStyle(color: gray1),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
