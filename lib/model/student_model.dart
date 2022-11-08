import 'package:cloud_firestore/cloud_firestore.dart';
class StudentModel{
  final String? id;
  final String? lastname;
  final String? firstname;
  final String? location;

  StudentModel({
    this.id,
    this.lastname,
    this.firstname,
    this.location
  });

  factory StudentModel.fromSnapshot(DocumentSnapshot snap){
        var snapshot = snap.data() as Map<String,dynamic> ;
      return StudentModel( 
        id: snapshot['id'],
        lastname: snapshot['lastname'],
        firstname: snapshot['firstname'],
        location: snapshot['location'],
   
      );
  }

  Map<String, dynamic> toJson() =>{
    "id":id,
    "lastname":lastname,
    "firstname":firstname,
    "location":location
  };
}