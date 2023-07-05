import 'package:flutter/material.dart';
import 'package:mentor_mee/constants/constants.dart';

class StudentInfo extends StatelessWidget {
  final studentData;
  StudentInfo({this.studentData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MentorMee'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: generateRandomColor(),
                radius: 50.0,
              ),
            ),
            Text(
              '${studentData['name']}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Text('Major: '),
                Text('${studentData['major']}'),
              ],
            ),
            Row(
              children: [
                Text('Classification: '),
                Text('${studentData['class']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
