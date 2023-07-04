// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future SignInAnon() async {
    try {
      UserCredential res = await _auth.signInAnonymously();
      return res.user;
    } catch (e) {
      return null;
    }
  }

  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future SignInUser(email, password) async {
    try {
      UserCredential res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return res.user;
    } catch (e) {
      return null;
    }
  }

  Future Register(String email, String password, String name, String major,
      String clasification) async {
    try {
      UserCredential res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await DatabaseService(uid: res.user?.uid)
          .UpdateStudentCollection(name, major, clasification);
      return res.user;
    } catch (e) {
      return null;
    }
  }
}

class DatabaseService {
  final String? uid;

  DatabaseService({required this.uid});
  final CollectionReference studentCollection =
      FirebaseFirestore.instance.collection('students');

  Future UpdateStudentCollection(
      String name, String major, String classification) async {
    return await studentCollection
        .doc(uid)
        .set({'name': name, 'major': major, 'class': classification});
  }

  Stream<QuerySnapshot> get students {
    return studentCollection.snapshots();
  }

  Stream<DocumentSnapshot> get userData {
    return studentCollection.doc(uid).snapshots();
  }
}
