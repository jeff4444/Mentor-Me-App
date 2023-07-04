import 'package:flutter/material.dart';
import 'package:mentor_mee/screens/Authenticate/authenticate.dart';
import 'package:mentor_mee/screens/Home/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return user == null ? Auhenticate() : Home();
  }
}
