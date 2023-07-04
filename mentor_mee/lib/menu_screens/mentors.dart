import 'package:flutter/material.dart';
import 'package:mentor_mee/screens/Home/student_list.dart';
// import 'package:mentor_mee/screens/Home/student_tile.dart';

class Mentors extends StatefulWidget {
  const Mentors({super.key});

  @override
  State<Mentors> createState() => _MentorsState();
}

class _MentorsState extends State<Mentors> {
  @override
  Widget build(BuildContext context) {
    return StudentList();
  }
}
