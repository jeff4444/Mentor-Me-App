import 'package:flutter/material.dart';

class Internships extends StatefulWidget {
  const Internships({super.key});

  @override
  State<Internships> createState() => _InternshipsState();
}

class _InternshipsState extends State<Internships> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MentorMee'),
      ),
      body: Center(
        child: Text("Internships page"),
      ),
    );
  }
}
