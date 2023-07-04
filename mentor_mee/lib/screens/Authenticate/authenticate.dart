import 'package:flutter/material.dart';
import 'package:mentor_mee/screens/Authenticate/register.dart';
import 'package:mentor_mee/screens/Authenticate/sign_in.dart';

class Auhenticate extends StatefulWidget {
  const Auhenticate({super.key});

  @override
  State<Auhenticate> createState() => _AuhenticateState();
}

class _AuhenticateState extends State<Auhenticate> {
  bool isSignIn = true;
  void ToggleAuth() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isSignIn
        ? SignIn(toggleAuth: ToggleAuth)
        : Register(toggleAuth: ToggleAuth);
  }
}
