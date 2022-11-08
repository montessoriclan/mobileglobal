import 'package:deernier/page/auth_page/login.dart';
import 'package:deernier/page/student/simple_curd.dart';
import 'package:deernier/service/auth_firebase_service.dart';
import 'package:deernier/util/app_constant.dart';
import 'package:deernier/widget/k_button_primary.dart';
import 'package:deernier/widget/k_height.dart';
import 'package:deernier/widget/k_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final User? user = AuthService().getCurrentUser;
    String? errorMessage = '';

  void logout()async{

    try {
       await AuthService().logout();
         // ignore: use_build_context_synchronously
         Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView(),));
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("you are logged out")));
    }on FirebaseAuthException catch (e) {
       errorMessage = e.message;
        ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage.toString())));
    }
     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
            padding:   const EdgeInsets.symmetric(horizontal: 16 , vertical: 50),
            child: Column(
             
              children: <Widget> [
                Row(
                  children: const [
                      KText(
                            text: "Welcome",
                            size: AppConstant.leadingText,
                            weight: FontWeight.bold),
                  ],
                ),
                const KHeight(height: 20),
                Row(
                  children: [
                      KText(
                            text:
                                user!.email ?? 'User Email',
                            size: AppConstant.titleText,
                            weight: FontWeight.w500),
                  
                  ],
                ),
                const KHeight(height: 40),
               KButtonPrimary(text:"Go to Student managment",function: (){
Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleCrud(),
                    ));
               },),
                const KHeight(height: 20),
               KButtonPrimary(text:"logout",function: logout,)
              ],
            )),
      )),
    );
  }
}
