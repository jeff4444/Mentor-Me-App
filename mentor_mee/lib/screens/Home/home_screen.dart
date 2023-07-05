import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentor_mee/screens/loading.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentor_mee/services/services.dart';
// import 'package:mentor_mee/screens/Home/student_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return StreamBuilder<DocumentSnapshot>(
        stream: DatabaseService(uid: user?.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic userData = snapshot.data ?? '';
            return Center(
              child: Column(
                children: [
                  Text('Welcome ${userData['name']}'),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/courses.jpg'),
                    radius: 50.0,
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
