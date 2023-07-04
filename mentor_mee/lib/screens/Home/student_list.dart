import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'student_tile.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    final students = Provider.of<QuerySnapshot?>(context);
    // print(students?.docs);
    // if (students?.docs != null) {
    //   for (var doc in students?.docs ?? []) {
    //     print(doc.data()['name']);
    //   }
    // }
    // print(students?.docs.length);

    return ListView.builder(
      itemCount: students?.docs.length,
      itemBuilder: (context, index) {
        return StudentTile(student: students?.docs[index]);
      },
    );
  }
}
