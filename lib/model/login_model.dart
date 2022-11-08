
import 'package:cloud_firestore/cloud_firestore.dart';
class LoginModel{
  final String? email;
  final String? password;


  LoginModel({
    this.email,
     this.password,

  });

  factory LoginModel.fromSnapshot(DocumentSnapshot snap){
        var snapshot = snap.data() as Map<String,dynamic> ;
      return LoginModel( 
        password: snapshot['password'],
        email: snapshot['email'],
      );
  }

  Map<String, dynamic> toJson() =>{
    "email":email,
    "password":password
  };
}