import 'package:deernier/helper/firebase_helper.dart';
import 'package:deernier/model/student_model.dart';
import 'package:deernier/widget/k_form_field.dart';
import 'package:deernier/widget/k_height.dart';
import 'package:flutter/material.dart';



class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final contLastname = TextEditingController();
  final contFirstname = TextEditingController();
  final contLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
      
        elevation: 0,
        title: const Text("add a student"),
       
      ),
      body: SafeArea(child: SingleChildScrollView(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 50),child: Column(children: [
       KFormField(
        hint: "firstname",
        controller: contFirstname ,
       ),
       const KHeight(height: 10),
       KFormField(
        hint: "Lastname",
        controller:contLastname ,
       ),
       const KHeight(height: 10),
       KFormField(
        hint: "Location",
        controller: contLocation,
       ),
        ElevatedButton(onPressed: (){
          FirebaseHelper.create(StudentModel(firstname: contFirstname.text,lastname: contLastname.text,location: contLocation.text));
        }, child: const Text("Add"))
      ],),),)),
    );
  }
}