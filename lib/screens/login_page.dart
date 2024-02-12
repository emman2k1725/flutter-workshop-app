import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_workshop_app/components.dart';
import 'package:flutter_workshop_app/styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.instagramLogo,
            ),
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
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: CustomButton(
                type: CustomButtonType.secondary,
                text: 'Log in',
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
            const SizedBox(height: 25),
            InkWell(
              onTap: () {},
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Do not have an account yet? ',
                        style:
                            TextStyles.bodyText.copyWith(color: Colors.grey)),
                    TextSpan(
                        text: 'SIGN UP',
                        style:
                            TextStyles.titleText.copyWith(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
