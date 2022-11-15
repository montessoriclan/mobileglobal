import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deernier/model/user_profile_model.dart';
import 'package:deernier/service/enum/user_type_enum.dart';

class UserProfileHelper {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> registerUser(String email, String userType) {
    return _firebaseFirestore.collection('users').doc(email).set(
        {'email': email, 'createdAt': DateTime.now(), 'userType': userType});
  }

  Future<void> addProfile(UserProfileModel userProfileModel) {
    return _firebaseFirestore.collection('users').doc(userProfileModel.email).update(userProfileModel.toJson());
  }
}
