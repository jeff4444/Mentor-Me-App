import 'package:flutter/material.dart';
import 'package:mentor_mee/services/services.dart';
import 'package:mentor_mee/screens/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleAuth;
  SignIn({required this.toggleAuth});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email = '', password = '';
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      widget.toggleAuth();
                    },
                    icon: const Icon(Icons.person),
                    label: const Text('Register'))
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
                              dynamic user =
                                  await _auth.SignInUser(email, password);
                              if (user == null) {
                                setState(() {
                                  loading = false;
                                });
                                print('Failed to Sign in');
                              } else {
                                print('Success');
                              }
                            } else {
                              print(_formkey.currentState?.validate());
                            }
                          },
                          child: const Text('Sign In')),
                      ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            dynamic user = await _auth.SignInAnon();
                            if (user == null) {
                              setState(() {
                                loading = false;
                              });
                              print("Failed to sign in");
                            } else {
                              print("Signed In");
                              print(user);
                            }
                          },
                          child: const Text('Sign In Anon'))
                    ],
                  )
                ]),
              ),
            ),
          );
  }
}
