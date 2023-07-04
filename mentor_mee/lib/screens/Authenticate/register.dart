import 'package:flutter/material.dart';
import 'package:mentor_mee/services/services.dart';
import 'package:mentor_mee/screens/loading.dart';
import 'package:mentor_mee/constants/constants.dart';

class Register extends StatefulWidget {
  final Function toggleAuth;
  const Register({required this.toggleAuth});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  String email = '', password = '', name = '', classification = '', major = '';
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              elevation: 0.0,
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      widget.toggleAuth();
                    },
                    icon: const Icon(Icons.person),
                    label: const Text('Sign In'))
              ],
              title: const Text('MentorMee'),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: Form(
                key: _formkey,
                child: Column(children: [
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(hintText: 'Full Name'),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    validator: (value) => (value != '') ? null : 'Enter a name',
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      hintText: 'Classification',
                    ),
                    items: createDropDown(classifications),
                    onChanged: (val) {
                      setState(() {
                        classification = val ?? '';
                      });
                    },
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      hintText: 'Major',
                    ),
                    items: createDropDown(majors),
                    onChanged: (val) {
                      setState(() {
                        major = val ?? '';
                      });
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(hintText: 'Email'),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (value) =>
                        (value != '') ? null : 'Enter an email address',
                  ),
                  TextFormField(
                    autofocus: true,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Password'),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    validator: (value) => (value == null || value.length < 5)
                        ? 'Password must be atleast 5 chars long'
                        : null,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState?.validate() != null) {
                              setState(() {
                                loading = true;
                              });
                              dynamic user = await _auth.Register(
                                  email, password, name, major, classification);
                              if (user == null) {
                                setState(() {
                                  loading = false;
                                });
                                print('Failed to register');
                              } else {
                                print('Success');
                              }
                            } else {
                              print(_formkey.currentState?.validate());
                            }
                          },
                          child: const Text('Register')),
                    ],
                  )
                ]),
              ),
            ),
          );
  }
}
