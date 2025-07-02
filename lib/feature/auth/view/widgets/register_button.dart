import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/feature/auth/cubit/auth_cubit.dart';
import 'package:el_wekala/feature/auth/cubit/auth_state.dart';
import 'package:el_wekala/feature/home/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.nationalIdController,
    required this.genderController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController nationalIdController;
  final TextEditingController genderController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAddSuccessState) {
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return HomeScreen();
                },
              ),
            );
          }
        }
      },
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: defaultColor),
        onPressed: () {
          context.read<AuthCubit>().authCubit(
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            nationalId: nationalIdController.text,
            gender: genderController.text,
            password: passwordController.text,
          );
        },
        child: Text("Register", style: TextStyle(color: white)),
      ),
    );
  }
}
