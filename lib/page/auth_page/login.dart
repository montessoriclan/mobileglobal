
import 'dart:developer';

import 'package:deernier/main.dart';
import 'package:deernier/model/login_model.dart';
import 'package:deernier/page/auth_page/profil.dart';
import 'package:deernier/page/auth_page/register.dart';
import 'package:deernier/service/auth_firebase_service.dart';
import 'package:deernier/service/email_service.dart';
import 'package:deernier/util/app_constant.dart';
import 'package:deernier/widget/k_button_primary.dart';
import 'package:deernier/widget/k_form_field.dart';
import 'package:deernier/widget/k_height.dart';
import 'package:deernier/widget/k_password_field.dart';
import 'package:deernier/widget/k_text.dart';
import 'package:deernier/widget/no_network.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  String? errorMessage = '';
  bool? isLoading = false;

  Future<void> login() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (conext) => AlertDialog(
              title: Column(children: const <Widget>[
                Text("please wait ..."),
                KHeight(height: 10),
                LinearProgressIndicator(),
              ]),
            ));
    try {
      await AuthService().signInWithEmailAndPassword(LoginModel(
          email: textEmailController.text,
          password: textPasswordController.text));
      navigatorKey.currentState!.popUntil((route) => route.isFirst);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Profil(),
          ));
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage.toString())));
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NoNetwork(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            child: Column(children: <Widget>[
              Row(
                children: const <Widget>[
                  KText(
                      text: "Login",
                      size: AppConstant.leadingText,
                      weight: FontWeight.bold),
                ],
              ),
              const KHeight(height: 20),
              Row(
                children: const <Widget>[
                  KText(
                      text: "login to access on your account",
                      size: AppConstant.titleText,
                      weight: FontWeight.w500),
                ],
              ),
              const KHeight(height: 40),
              KFormField(
                  controller: textEmailController,
                  hint: "Enter your email",
                  type: TextInputType.emailAddress),
              const KHeight(height: 10),
              KPasswordField(
                  text: "password",
                  type: TextInputType.text,
                  textcontroler: textPasswordController),
              const KHeight(height: 20),
              KButtonPrimary(text: "Login", function: login),
              const KHeight(height: 10),
              Column(
                children: const [Text("or")],
              ),
              const KHeight(height: 10),
              KButtonPrimary(
                text: "create a new account",
                function: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterView(),
                  ),
                ),
              ),
              KButtonPrimary(text: "Email",function: sendEmail,)
            ]),
          ),
        )),
      ),
    );
  }

  void sendEmail()async {
    try {
      await EmailService().send(body: "Body from Flutter App", subject: "Testing", recipients: ['abhisriram007@gmail.com'], attachmentPaths: []);
    } catch (e) {
      log(e.toString());
    }
  }
}
