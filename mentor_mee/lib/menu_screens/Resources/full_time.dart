import 'package:flutter/material.dart';

class FullTime extends StatefulWidget {
  const FullTime({super.key});

  @override
  State<FullTime> createState() => _FullTimeState();
}

class _FullTimeState extends State<FullTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MentorMee'),
      ),
      body: Center(
        child: Text("Full Time page"),
      ),
    );
  }
}
