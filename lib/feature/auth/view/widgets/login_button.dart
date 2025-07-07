import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/feature/auth/cubit/auth_cubit.dart';
import 'package:el_wekala/feature/auth/cubit/auth_state.dart';
import 'package:el_wekala/feature/home/view/screens/navigator_page.dart';
import 'package:el_wekala/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });
  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccessState) {
          if (state.model.status == "error") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: red,
                content: Text(state.model.message),
              ),
            );
          }
          if (state.model.status == "success") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: green,
                content: Text(state.model.message),
              ),
            );
            context.read<ProfileCubit>().getProfileCubit(token: state.token);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return MainScreen();
                },
              ),
            );
          }
        }
      },
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: defaultColor),
        onPressed: () {
          if (!formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Please fix errors in the form")),
            );
            return;
          }
          context.read<AuthCubit>().loginCubit(
            email: emailController.text,
            password: passwordController.text,
          );
        },
        child: Text("Login", style: TextStyle(color: white)),
      ),
    );
  }
}
