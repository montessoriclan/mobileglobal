import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deernier/model/student_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class StudentHelper {
  static final _email = FirebaseAuth.instance.currentUser!.email;
  static final _firebaseAuth = FirebaseAuth.instance;
  static final _firebaseFirestore = FirebaseFirestore.instance;
  //
  static Future<UserCredential> loginStudent(
      {required String email, required String password}) async {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: _email!, password: _email!);
  }

  static Future<void> sendEmailRegisterLinkToStudent(
      {required String email}) async {
    
  }

  //request create
  static Future create(StudentModel user) async {
    final userCollection = FirebaseFirestore.instance.collection("student");

    final uid = userCollection.doc().id;

    final docRef = userCollection.doc(uid);

    final newUser = StudentModel(
            id: uid,
            lastname: user.lastname,
            firstname: user.firstname,
            location: user.location,
            tutorID: StudentHelper._email)
        .toJson();

    try {
      await docRef.set(newUser);
    } catch (e) {
      if (kDebugMode) {
        print("some error occured $e");
      }
    }
  }

// read
  static Stream<List<StudentModel>> read() {
    final userCollection = FirebaseFirestore.instance
        .collection("student")
        .where('tutorID', isEqualTo: StudentHelper._email);
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => StudentModel.fromSnapshot(e)).toList());
  }

// update
  static Future update(StudentModel user) async {
    final userCollection = FirebaseFirestore.instance.collection("student");

    final docRef = userCollection.doc(user.id);

    final newUser = StudentModel(
            id: user.id,
            lastname: user.lastname,
            firstname: user.firstname,
            location: user.location)
        .toJson();

    try {
      await docRef.update(newUser);
    } catch (e) {
      if (kDebugMode) {
        print("some error occured $e");
      }
    }
  }

  //delete
  static Future delete(StudentModel user) async {
    final userCollection = FirebaseFirestore.instance.collection("student");

    userCollection.doc(user.id).delete();
  }
}
