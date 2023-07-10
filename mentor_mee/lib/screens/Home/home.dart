import 'package:flutter/material.dart';
import 'package:mentor_mee/menu_screens/mentors.dart';
import 'package:mentor_mee/menu_screens/profile.dart';
import 'package:mentor_mee/menu_screens/resources.dart';
import 'package:mentor_mee/screens/Home/home_screen.dart';
import 'package:mentor_mee/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:mentor_mee/screens/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int _currentPageIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    Mentors(),
    Resources(),
    Profile(),
  ];
  // final DatabaseService _user = DatabaseService(uid: _auth.user.uid)
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      initialData: null,
      value: DatabaseService(uid: '').students,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('MentorMee'),
          actions: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserSettings()));
                });
              },
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    )),
                onPressed: () {
                  dynamic res = _auth.SignOut();
                  if (res == null) {
                    print("Could not sign out");
                  }
                },
                icon: Icon(Icons.person),
                label: Text('Sign Out')),
          ],
        ),
        body: _pages[_currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentPageIndex,
            onTap: (value) {
              setState(() {
                _currentPageIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: 'Mentors',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.folder),
                label: 'Resources',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'My Profile',
              ),
            ]),
      ),
    );
  }
}
