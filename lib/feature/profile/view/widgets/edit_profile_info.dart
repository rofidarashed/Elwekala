import 'package:el_wekala/core/elements/my_validators.dart';
import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/core/widgets/password_text_field.dart';
import 'package:el_wekala/feature/auth/view/widgets/input_text_button.dart';
import 'package:el_wekala/feature/profile/cubit/profile_cubit.dart';
import 'package:el_wekala/feature/profile/cubit/profile_state.dart';
import 'package:flutter/material.dart';

Widget editProfileInfo(
  ProfileGetDataSuccessState state,
  BuildContext context,
) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
    child: Column(
      children: [
        InputTextButton(
          labelText: "Name",
          hintText: state.model.name,
          obscureText: false,
          controller: nameController,
          validator: (_) =>
              MyValidators.displayNamevalidator(nameController.text),
          prefixIcon: Icons.person_outline,
        ),
        InputTextButton(
          labelText: "E-mail",
          hintText: state.model.email,
          obscureText: false,
          controller: emailController,
          validator: (_) => MyValidators.emailValidator(emailController.text),
          prefixIcon: Icons.mail_outline,
        ),
        InputTextButton(
          labelText: "Phone",
          hintText: state.model.phone,
          obscureText: false,
          controller: phoneController,
          validator: (_) =>
              MyValidators.phoneValidator(phoneController.text, context),
          prefixIcon: Icons.phone_outlined,
        ),
        PasswordTextField(
          controller: passwordController,
          labelText: "Password",
          validator: (_) =>
              MyValidators.passwordValidator(passwordController.text),
        ),
        PasswordTextField(
          controller: confirmPasswordController,
          labelText: "Confirm password",
          validator: (_) => MyValidators.repeatPasswordValidator(
            password: passwordController.text,
            value: confirmPasswordController.text,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 0),
              onPressed: () {
                ProfileCubit.get(context).cancelEdit();
              },
              child: Text("Cancel", style: TextStyle(color: defaultColor)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: defaultColor),
              onPressed: () {
              
                ProfileCubit.get(context).updateProfileCubit(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                );
              },
              child: Text("Save", style: TextStyle(color: white)),
            ),
          ],
        ),
      ],
    ),
  );
}
