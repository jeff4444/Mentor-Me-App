import 'package:flutter/material.dart';
import 'dart:math';

import 'package:mentor_mee/menu_screens/Resources/courses.dart';
import 'package:mentor_mee/menu_screens/Resources/full_time.dart';
import 'package:mentor_mee/menu_screens/Resources/internships.dart';
import 'package:mentor_mee/menu_screens/Resources/scholarships.dart';

const List<String> classifications = [
  'Freshman',
  'Sophomore',
  'Junior',
  'Senior'
];
const List<String> majors = [
  'Architecture',
  'Computer Engineering',
  'Computer Science',
  'Electrical Engineering',
  'Mechanical Engineering',
];

List<DropdownMenuItem> createDropDown(List<String> items) {
  return items
      .map((item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          ))
      .toList();
}

Color generateRandomColor() {
  Random random = Random();
  int r = random.nextInt(256);
  int g = random.nextInt(256);
  int b = random.nextInt(256);
  return Color.fromARGB(255, r, g, b);
}

const resources = [
  'Course Material',
  'Scholarship opportunities',
  'Internship opportunities',
  'Full time jobs',
];
const resourceWidgets = [Courses(), Scolarships(), Internships(), FullTime()];

const images = ['courses.jpg', 'scholarsips.jpg', 'internship.jpg', 'job.jpg'];
List<Widget> createTiles(context) {
  List<Widget> tiles = [];
  for (int i = 0; i < resources.length; i++) {
    tiles.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Card(
          child: ListTile(
            leading: SizedBox(
              width: 40.0,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/${images[i]}'),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            // leading: const CircleAvatar(
            //   backgroundColor: Colors.blue,
            //   radius: 20.0,
            // ),
            title: Text(resources[i].toString()),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => resourceWidgets[i]));
            },
          ),
        ),
      ),
    );
  }
  return tiles;
}
