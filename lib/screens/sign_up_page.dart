import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components.dart';
import 'package:flutter_workshop_app/styles.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Sign Up',
          style: TextStyles.displayTextMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomTextField(
              controller: usernameController,
              type: CustomTextFieldType.login,
              labelText: 'Username, email or mobile number',
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: passwordController,
              type: CustomTextFieldType.password,
              labelText: 'Password',
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: confirmPasswordController,
              type: CustomTextFieldType.password,
              labelText: 'Confirm Password',
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: CustomButton(
                type: CustomButtonType.secondary,
                text: 'Sign Up',
                buttonColor: CustomColors.blue,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const BottomNavbar(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
