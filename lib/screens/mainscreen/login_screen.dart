import 'package:flutter/material.dart';
import 'package:tec/gen/fonts.gen.dart';

import '../../gen/assets.gen.dart';
import '../../route/names.dart';
import '../../widgets/CustomTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: _topWidget(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _centerWidget(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 400,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: _bottomWidget(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            const Divider(thickness: 0.5, color: Color.fromRGBO(0, 0, 0, 0.2)),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 12),
              child: Text(
                'Instagram от Facebook',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: FontFamily.dana,
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _topWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Assets.images.back.image(),
    );
  }

  Widget _centerWidget() {
    return Column(
      children: [
        Assets.images.instagramLogo.image(),
        const SizedBox(
          height: 40,
        ),
        CustomTextField(
          hint: 'Username or Email',
          checkobscure: false,
        ),
        const SizedBox(
          height: 12,
        ),
        CustomTextField(
          hint: 'Password',
          checkobscure: true,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle:
                  const TextStyle(fontSize: 12, fontFamily: FontFamily.dana),
            ),
            onPressed: () {},
            child: const Text('Forgot password?'),
          ),
        ),
        SizedBox(
          height: 44,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Screens.mainScreen);
            },
            child: const Text('Log in'),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.facebookLogo.image(),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle:
                    const TextStyle(fontSize: 14, fontFamily: FontFamily.dana),
              ),
              onPressed: () {},
              child: const Text('Log in with Facebook'),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Divider(
                thickness: 0.5,
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
            ),
            Text(
              'OR',
              style: TextStyle(
                fontSize: 12,
                fontFamily: FontFamily.dana,
                color: Color.fromRGBO(0, 0, 0, 0.4),
              ),
            ),
            Flexible(
              child: Divider(
                thickness: 0.5,
                color: Color.fromRGBO(0, 0, 0, 0.2),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _bottomWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don’t have an account? ',
          style: TextStyle(
            fontSize: 14,
            fontFamily: FontFamily.dana,
            color: Color.fromRGBO(0, 0, 0, 0.4),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle:
                const TextStyle(fontSize: 14, fontFamily: FontFamily.dana),
          ),
          onPressed: () {},
          child: const Text('Sign up!'),
        ),
      ],
    );
  }
}
