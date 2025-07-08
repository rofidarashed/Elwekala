import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  const PasswordTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: "********",
          labelStyle: TextStyle(color: defaultColor),
          floatingLabelStyle: TextStyle(color: defaultColor),
          labelText: widget.labelText,
          prefixIcon: IconButton(
            icon: Icon(
              _obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: _obscureText ? defaultColor : red,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: grayGreen0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: grayGreen, width: 2),
          ),
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          fillColor: white,
          hintStyle: TextStyle(color: textGreen),
        ),
        validator: widget.validator,
      ),
    );
  }
}
