import 'package:flutter/material.dart';
import 'package:meet/Button/loginbutton.dart';
import 'package:meet/usables/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Authentication _authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Nimish Meet',
            style: const TextStyle(
              fontSize: 36,
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
          child: Image.asset('assets/image/login.jpg'),
        ),
        LoginButton(
          text: 'Google Sign In',
          onPressed: () async {
            bool p = await _authentication.signInWithGoogle(context);
            if (p) {
              Navigator.pushNamed(context, '/home');
            }
          },
        )
      ],
    ));
  }
}
