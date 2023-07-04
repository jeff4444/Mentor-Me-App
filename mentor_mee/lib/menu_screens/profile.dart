import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentor_mee/screens/loading.dart';
import 'package:mentor_mee/services/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentor_mee/constants/constants.dart';
import 'package:flutter/services.dart';
// ignore: prefer_const_declarations

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formkey = GlobalKey<FormState>();
  String _userName = '';
  String _userMajor = '';
  String _userClass = '';
  // final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return StreamBuilder<DocumentSnapshot>(
        stream: DatabaseService(uid: user?.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic userData = snapshot.data ?? '';
            return SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 10.0),
                  child: Column(children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Update ur profile',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.deny(
                      //       RegExp('[ ]')), // Allowing backspace character
                      // ],
                      // controller: _controller,
                      autofocus: true,
                      initialValue:
                          _userName != '' ? _userName : userData['name'],
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _userName = value;
                        });
                      },
                      validator: (value) =>
                          (value != '') ? null : 'Enter a name',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    DropdownButtonFormField(
                      value: _userClass != '' ? _userClass : userData['class'],
                      decoration: const InputDecoration(labelText: 'Class'),
                      items: createDropDown(classifications),
                      onChanged: (val) {
                        setState(() {
                          _userClass = val ?? '';
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(labelText: 'Major'),
                      value: _userMajor != '' ? _userMajor : userData['major'],
                      items: createDropDown(majors),
                      onChanged: (val) {
                        setState(() {
                          _userMajor = val;
                          print(_userMajor);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              if (_formkey.currentState?.validate() != null) {
                                await DatabaseService(uid: user?.uid)
                                    .UpdateStudentCollection(
                                        _userName != ''
                                            ? _userName
                                            : userData['name'],
                                        _userMajor != ''
                                            ? _userMajor
                                            : userData['major'],
                                        _userClass != ''
                                            ? _userClass
                                            : userData['class']);
                              }
                            },
                            child: const Text('Update')),
                      ],
                    )
                  ]),
                ),
              ),
            );
          } else {
            return const Loading();
          }
        });
  }
}
