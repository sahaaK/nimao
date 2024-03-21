import 'package:flutter/material.dart';
import 'package:sbi/pages/auth/gradient_button.dart';
import 'package:sbi/pages/auth/login.dart';

import 'login_field.dart';
import 'social_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/signin_balls.png',
                height: 120,
              ),
              const Text(
                'Sign Up.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 15),
              LoginField(
                hintText: 'Full Name',
                controller: fullNameController,
                obscureText: false,
              ),
              const SizedBox(height: 15),
              LoginField(
                hintText: 'Phone number',
                controller: phoneNumberController,
                obscureText: false,
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              LoginField(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true),
              const SizedBox(height: 20),
              GradientButton(
                text: 'Sign Up',
                onPressed: () {},
              ),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 20),
              const SocialButton(
                iconPath: 'assets/g_logo.svg',
                label: 'Continue with Google',
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Text("already have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "login",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
