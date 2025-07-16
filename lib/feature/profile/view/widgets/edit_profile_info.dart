import 'package:el_wekala/core/elements/my_validators.dart';
import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/core/widgets/password_text_field.dart';
import 'package:el_wekala/feature/auth/view/widgets/input_text_button.dart';
import 'package:el_wekala/feature/profile/cubit/profile_cubit.dart';
import 'package:el_wekala/feature/profile/cubit/profile_state.dart';
import 'package:flutter/material.dart';

Widget editProfileInfo(ProfileGetDataSuccessState state, BuildContext context) {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
    child: Form(
      key: formKey,
      child: Column(
        children: [
          InputTextButton(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: state.model.name,
            hintText: state.model.name,
            obscureText: false,
            controller: nameController,
            validator: (_) =>
                MyValidators.displayNamevalidator(nameController.text),
            prefixIcon: Icons.person_outline,
          ),
          InputTextButton(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: state.model.email,
            hintText: state.model.email,
            obscureText: false,
            controller: emailController,
            validator: (_) => MyValidators.emailValidator(emailController.text),
            prefixIcon: Icons.mail_outline,
          ),
          InputTextButton(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: state.model.phone,
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
                  // if (!formKey.currentState!.validate()) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text("Please fix errors in the form"),
                  //       duration: Durations.medium4,
                  //     ),
                  //   );
                  //   return;
                  // }
                  ProfileCubit.get(context).updateProfile(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                  ); // wait a sec and look
                },
                child: Text("Save", style: TextStyle(color: white)),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
