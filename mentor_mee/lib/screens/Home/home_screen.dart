import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentor_mee/screens/loading.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentor_mee/services/services.dart';
import 'dart:core';

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
            dynamic name = 'user';
            try {
              name = userData['name'];
            } catch (e) {
              name = 'user';
            }

            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Welcome $name',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
