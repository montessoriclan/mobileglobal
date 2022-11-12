import 'package:flutter/material.dart';

import 'TeacherProfile.dart';
import 'hamburger.dart';

class VolunteerProfile extends StatelessWidget {
  const VolunteerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Volunteer profile';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: MyCustomForm(),
        drawer: hamburger(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final schoolController = TextEditingController();
  final locationController = TextEditingController();
  final specialisationController = TextEditingController();
  final experienceController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: genderController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Gender',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: schoolController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'School Name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: locationController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Location',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: specialisationController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Specialisation',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: experienceController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Tell us about yourself',
            ),
          ),
        ),
        Container(
          child: ElevatedButton(
            child: Text(
              'Upload your certificate',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {},
          ),
        ),
        Container(
          child: ElevatedButton(
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              print(nameController.text);
              print(genderController.text);
              print(schoolController.text);
              print(locationController.text);
              print(specialisationController.text);
              print(experienceController.text);
            },
          ),
        ),
      ],
    );
  }
}
