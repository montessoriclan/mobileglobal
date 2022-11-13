// ignore: file_names
import 'package:flutter/material.dart';

import 'Hamburger.dart';

class ParentProfileView extends StatefulWidget {
  const ParentProfileView({Key? key}) : super(key: key);

  @override
  State<ParentProfileView> createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfileView> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Parent profile';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const ParentProfileForm(),
        drawer: const Hamburger(),
      ),
    );
  }
}

class ParentProfileForm extends StatefulWidget {
  const ParentProfileForm({Key? key}) : super(key: key);

  @override
  State<ParentProfileForm> createState() => _ParentProfileFormState();
}

class _ParentProfileFormState extends State<ParentProfileForm> {
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

  String genderValue = 'Male';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
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
          child: DropdownButton<String>(
            value: genderValue,
            items: <String>['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                genderValue = newValue!;
              });
            },
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
        ElevatedButton(
          child: const Text(
            'Upload your certificate',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {},
        ),
        Container(
          child: ElevatedButton(
            child: const Text(
              'Submit',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              print(nameController.text);
              print(genderValue);
              print(schoolController.text);
              print(locationController.text);
              print(specialisationController.text);
              print(experienceController.text);
            },
          ),
        ),
      ],
    ));
  }
}
