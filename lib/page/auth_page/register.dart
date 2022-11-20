import 'dart:developer';

import 'package:deernier/page/auth_page/login.dart';
import 'package:deernier/service/enum/user_type_enum.dart';
import 'package:deernier/helper/user_profile_helper.dart';
import 'package:deernier/util/app_constant.dart';
import 'package:deernier/widget/k_button_primary.dart';
import 'package:deernier/widget/k_form_field.dart';
import 'package:deernier/widget/k_password_field.dart';
import 'package:deernier/widget/k_text.dart';
import 'package:deernier/widget/no_network.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../widget/k_height.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  bool? isLoading = false;
  String? errorMessage = '';
  final formKey = GlobalKey<FormState>();
  String userTypeString = "teacher";

  Future<void> register() async {

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
      // await AuthService().signUpWithEmailAndPassword(RegisterModel(
      //     email: textEmailController.text,
      //     password: textPasswordController.text));

      // Creating User in Firestore

      // UserType userType = UserType.values
      //     .firstWhere((element) => element.toString() == userTypeString);

      log(userTypeString);
      log(UserType.values.toString());

      await UserProfileHelper()
          .registerUser(textEmailController.text, userTypeString);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ));
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage.toString())));
    } on FirebaseException catch (e) {
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
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: const <Widget>[
                          KText(
                              text: "Create account",
                              size: AppConstant.leadingText,
                              weight: FontWeight.bold),
                        ],
                      ),
                      const KHeight(height: 20),
                      Row(
                        children: const <Widget>[
                          KText(
                              text:
                                  "create your account to access in your profil",
                              size: AppConstant.titleText,
                              weight: FontWeight.w500),
                        ],
                      ),
                      const KHeight(height: 40),
                      KFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter an email addresse";
                            }
                            return null;
                          },
                          controller: textEmailController,
                          hint: "Enter your email",
                          type: TextInputType.emailAddress),
                      const KHeight(height: 10),
                      DropdownButton<String>(
                        value: userTypeString,
                        items: <String>["teacher", "parent", "volunteer"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            userTypeString = newValue!;
                          });
                        },
                      ),
                      const KHeight(height: 10),
                      KPasswordField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter a password";
                            }
                            return null;
                          },
                          text: "password",
                          type: TextInputType.text,
                          textcontroler: textPasswordController),
                      const KHeight(height: 10),
                      KPasswordField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter a password";
                            }

                            return null;
                          },
                          text: "password confirmation",
                          type: TextInputType.text,
                          textcontroler: textPasswordController),
                      const KHeight(height: 20),
                      KButtonPrimary(
                          text: "Register",
                          function: () {
                            if (formKey.currentState!.validate()) {
                              register();
                            }
                          }),
                    ],
                  )),
              const KHeight(height: 10),
              Column(
                children: const [Text("or")],
              ),
              const KHeight(height: 10),
              KButtonPrimary(
                  text: "log in to your account",
                  function: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ))),
            ]),
          ),
        )),
      ),
    );
  }
}
