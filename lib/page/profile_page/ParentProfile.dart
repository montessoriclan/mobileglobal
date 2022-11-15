// ignore: file_names
import 'dart:developer';

import 'package:deernier/model/user_profile_model.dart';
import 'package:deernier/service/auth_firebase_service.dart';
import 'package:deernier/helper/user_profile_helper.dart';
import 'package:firebase_core/firebase_core.dart';
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
        body: const MyCustomForm(),
        drawer: const Hamburger(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

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
    genderController.dispose();
    schoolController.dispose();
    locationController.dispose();
    specialisationController.dispose();
    experienceController.dispose();
    super.dispose();
  }


  void profileSubmitHandler() async {
    try {
      String email = AuthService().getCurrentUser?.email ?? "no email";
      if (email == "no email") {
        log("no email");
        return;
      }

      UserProfileModel userProfileModel = UserProfileModel(
          email,
          nameController.text,
          genderValue,
          schoolController.text,
          locationController.text,
          locationController.text,
          specialisationController.text,
          experienceController.text,
          "Certificate URL");

      await UserProfileHelper().addProfile(userProfileModel);
      log({"message": "profile added"}.toString());
    } on FirebaseException catch (e) {
      log(e.toString());
      // Do something
    }
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
