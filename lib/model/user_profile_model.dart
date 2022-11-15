import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileModel {
  final String? email;
  final String? name;
  final String? gender;
  final String? schoolName;
  final String? lang;
  final String? lat;
  final String? specialisation;
  final String? experirence;
  final String? certificateURL;

  UserProfileModel(this.email, this.name, this.gender, this.schoolName,
      this.lang, this.lat, this.specialisation, this.experirence,this.certificateURL);

  factory UserProfileModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserProfileModel(snapshot['email'], snapshot['name'], snapshot['gender'], snapshot['schoolName'], snapshot['lang'], snapshot['lat'], snapshot['specialisation'], snapshot['experirence'],snapshot['certificateURL']);
  }

  Map<String,dynamic> toJson() => {
    "email":email,
    "name":name,
    "gender":gender,
    "schoolName":schoolName,
    "lang":lang,
    "lat":lat,
    "specialisation":specialisation,
    "experirence": experirence,
    "certificateURL":certificateURL

  };
}
