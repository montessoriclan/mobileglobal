
import 'package:cloud_firestore/cloud_firestore.dart';
class RegisterModel{
  final String? email;
  final String? password;


  RegisterModel({
    this.email,
     this.password,

  });

  factory RegisterModel.fromSnapshot(DocumentSnapshot snap){
        var snapshot = snap.data() as Map<String,dynamic> ;
      return RegisterModel( 
        password: snapshot['password'],
        email: snapshot['email'],
      );
  }

  Map<String, dynamic> toJson() =>{
    "email":email,
    "password":password
  };
}