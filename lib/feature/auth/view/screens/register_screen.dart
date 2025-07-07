import 'package:el_wekala/core/elements/my_validators.dart';
import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/feature/auth/cubit/auth_cubit.dart';
import 'package:el_wekala/feature/auth/cubit/auth_state.dart';
import 'package:el_wekala/feature/auth/view/screens/login_screen.dart';
import 'package:el_wekala/feature/auth/view/widgets/image_picker.dart';
import 'package:el_wekala/feature/auth/view/widgets/input_text_button.dart';
import 'package:el_wekala/feature/auth/view/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController nationalIdController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Register", style: TextStyle(color: defaultColor)),
            centerTitle: true,
          ),
          body: Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ImagPickerWidget(cubit: cubit),

                    InputTextButton(
                      labelText: "Name",
                      hintText: "Name",
                      obscureText: false,
                      controller: nameController,
                      validator: (_) => MyValidators.displayNamevalidator(
                        nameController.text,
                      ),
                      prefixIcon: Icons.person_outline,
                    ),
                    InputTextButton(
                      labelText: "E-mail",
                      hintText: "user@gmail.com",
                      obscureText: false,
                      controller: emailController,
                      validator: (_) =>
                          MyValidators.emailValidator(emailController.text),
                      prefixIcon: Icons.mail_outline,
                    ),
                    InputTextButton(
                      labelText: "Phone",
                      hintText: "01011111111",
                      obscureText: false,
                      controller: phoneController,
                      validator: (_) =>
                          MyValidators.phoneValidator(phoneController.text,context),
                      prefixIcon: Icons.phone_outlined,
                    ),
                    InputTextButton(
                      labelText: "National ID",
                      hintText: "30121212121212",
                      obscureText: false,
                      controller: nationalIdController,
                      validator: (_) => MyValidators.nationalIdValidator(
                        nationalIdController.text,
                      ),
                      prefixIcon: Icons.badge_outlined,
                    ),
                    InputTextButton(
                      labelText: "Gendar",
                      hintText: "Female",
                      obscureText: false,
                      controller: genderController,
                      validator: (v) => MyValidators.genderValidator(value: v),
                      prefixIcon: Icons.female_outlined,
                    ),
                    InputTextButton(
                      labelText: "Password",
                      hintText: "********",
                      obscureText: true,
                      controller: passwordController,
                      validator: (v) => MyValidators.passwordValidator(v),
                      prefixIcon: Icons.password,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return LoginScreen();
                              },
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(color: textGreen),
                          ),
                        ),
                      ],
                    ),
                    RegisterButton(
                      nameController: nameController,
                      emailController: emailController,
                      phoneController: phoneController,
                      nationalIdController: nationalIdController,
                      genderController: genderController,
                      passwordController: passwordController, formKey: _formKey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
