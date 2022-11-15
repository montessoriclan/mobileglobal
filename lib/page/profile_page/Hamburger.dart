import '../auth_page/login.dart';
import '../auth_page/profil.dart';
import '../student/student_progress.dart';
import 'ParentProfile.dart';
import 'package:flutter/material.dart';

import 'TeacherProfile.dart';
import 'VolunteerProfile.dart';

class Hamburger extends StatelessWidget {
  const Hamburger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(  
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Teacher Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TeacherProfileView(),
                  ));
            },
          ),
          ListTile(
            title: const Text('Parent Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ParentProfileView(),
                  ));
            },
          ),
          ListTile(
            title: const Text('Volunteer Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VolunteerProfileView(),
                  ));
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ));
            },
          ),
          ListTile(
            title: const Text('Welcome Page'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profil(),
                  ));
            },
          ),
          ListTile(
            title: const Text('Student Progress'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentProgressView(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
