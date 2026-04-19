import 'package:client/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/auth/view/widgets/custom_field.dart';
import 'package:client/config/theme/color_palette.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up.",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            CustomField(hintText: "Name"),
            SizedBox(height: 15),
            CustomField(hintText: "Email"),
            SizedBox(height: 15),
            CustomField(hintText: "Password"),
            SizedBox(height: 20),
            AuthGradientButton(text: "Sign Up"),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    text: "Sign In",
                    style: TextStyle(
                      color: ColorPalette.gradient2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
