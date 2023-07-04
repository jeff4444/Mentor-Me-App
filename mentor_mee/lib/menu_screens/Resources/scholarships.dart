import 'package:flutter/material.dart';

class Scolarships extends StatefulWidget {
  const Scolarships({super.key});

  @override
  State<Scolarships> createState() => _ScolarshipsState();
}

class _ScolarshipsState extends State<Scolarships> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MentorMee'),
      ),
      body: Center(
        child: Text("Scholarships page"),
      ),
    );
  }
}
