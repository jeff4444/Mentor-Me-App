import 'package:flutter/material.dart';
import 'package:mentor_mee/constants/constants.dart';

class StudentTile extends StatelessWidget {
  final student;
  StudentTile({required this.student});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: generateRandomColor(),
            radius: 20.0,
          ),
          title: Text(student?.data()['name'] ?? ''),
          subtitle: Text(
            "${student?.data()['major'] ?? ''} Major",
          ),
        ),
      ),
    );
  }
}
