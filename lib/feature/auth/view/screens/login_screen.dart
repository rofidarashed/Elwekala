import 'package:el_wekala/core/elements/my_validators.dart';
import 'package:el_wekala/core/utils/colors/colors.dart';
import 'package:el_wekala/core/widgets/password_text_field.dart';
import 'package:el_wekala/feature/auth/view/widgets/input_text_button.dart';
import 'package:el_wekala/feature/auth/view/widgets/login_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: defaultColor)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputTextButton(
                labelText: "E-mail",
                hintText: "user@gmail.com",
                obscureText: false,
                controller: emailController,
                validator: (_) =>
                    MyValidators.emailValidator(emailController.text),
                prefixIcon: Icons.mail_outline,
              ),
             PasswordTextField(controller: passwordController, labelText: "Password"),
              SizedBox(height: 100),
              LoginButton(
                emailController: emailController,
                passwordController: passwordController,
                formKey: _formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
