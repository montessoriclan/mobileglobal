import 'package:deernier/page/profile_page/ParentProfile.dart';
import 'package:flutter/material.dart';

import 'TeacherProfile.dart';
import 'VolunteerProfile.dart';

class hamburger extends StatelessWidget {
  const hamburger({super.key});

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Teacher Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherProfile()),
              );
            },
          ),
          ListTile(
            title: Text('Parent Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ParentProfileView(),
                  ));
            },
          ),
          ListTile(
            title: Text('Volunteer Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VolunteerProfile()),
              );
            },
          ),
        ],
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     home:
//     Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('UIA HACKATHON'),
//             ),
//             ListTile(
//               title: Text('Teacher profile'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => TeacherProfile()),
//                 );
//               },
//             ),
//             ListTile(
//               title: Text('Volunteer profile'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => VolunteerProfile()),
//                 );
//               },
//             ),
//             ListTile(
//               title: Text('Parent profile'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ParentProfile()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
