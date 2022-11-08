import 'package:deernier/model/login_model.dart';
import 'package:deernier/model/register_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get getCurrentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(LoginModel user)async{
    await _firebaseAuth.signInWithEmailAndPassword(email: user.email.toString(), password: user.password.toString());
  }

  Future<void> signUpWithEmailAndPassword(RegisterModel user)async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: user.email.toString(), password: user.password.toString());
  }

  Future<void> logout()async{
    await _firebaseAuth.signOut();
  }
}