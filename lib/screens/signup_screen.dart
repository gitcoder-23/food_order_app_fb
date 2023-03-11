// ignore_for_file: unnecessary_null_comparison
import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app_fb/screens/login_screen.dart';
import 'package:food_order_app_fb/widget/text_input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  final RegExp eRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  final RegExp pRegExp =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$');

  bool loading = false;
  UserCredential? userCredential;

  // work in input field
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void validationInput() {
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
      // globalKey.currentState;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("First name is empty"),
      ));
      return;
    }
    if (lastName.text.trim().isEmpty || lastName.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Last name is empty"),
      ));
      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Email is empty"),
      ));
      return;
    } else if (!eRegExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter vaild Email"),
      ));

      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password is empty"),
      ));
      return;
    } else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password must be 8 character long"),
      ));
      return;
    } else if (!pRegExp.hasMatch(password.text)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            "Must contain at least 1 uppercase letter, 1 lowercase letter, and 1 number"),
      ));

      return;
    }
    if (confirmPassword.text.trim().isEmpty ||
        confirmPassword.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Confirm password is empty"),
      ));
      return;
    }
    if (password.text != confirmPassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Missmatch password"),
      ));
      return;
    } else {
      signUpSubmit();
    }
  }

  Future<dynamic> signUpSubmit() async {
    setState(() {
      loading = true;
    });

    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user!.uid)
          .set({
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim(),
        'email': email.text.trim(),
        "userid": userCredential.user!.uid,
        'password': base64Url.encode(utf8.encode(password.text.trim())),
        // 'password': password.text.trim(),
      });
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("New user created"),
      ));
      Timer(
        const Duration(seconds: 1),
        () {
          clearTextField();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("The password provided is too weak"),
        ));
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("The account already exists for that email"),
        ));
      }
    } catch (e) {
      // print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  clearTextField() {
    firstName.clear();
    lastName.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
  }

  onBtnPressed(String btnName) {
    if (btnName == 'Register') {
      validationInput();
    } else {
      clearTextField();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextInputField(
                      textEditingController: firstName,
                      hintText: 'First Name',
                      prefixIcon: Icons.person_outline,
                      iconColor: Colors.white,
                      obscureText: false,
                    ),
                    TextInputField(
                      textEditingController: lastName,
                      hintText: 'Last Name',
                      prefixIcon: Icons.person_outline,
                      iconColor: Colors.white,
                      obscureText: false,
                    ),
                    TextInputField(
                      textEditingController: email,
                      hintText: 'Email',
                      prefixIcon: Icons.email_outlined,
                      iconColor: Colors.white,
                      obscureText: false,
                    ),
                    TextInputField(
                      textEditingController: password,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline,
                      iconColor: Colors.white,
                      obscureText: true,
                    ),
                    TextInputField(
                      textEditingController: confirmPassword,
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.lock_outline,
                      iconColor: Colors.white,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              loading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                          color: Colors.white70,
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          child: DynaButton(
                            btnName: 'Cancel',
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.grey,
                            shadowColor: Colors.grey,
                            textColor: Colors.black,
                            onBtnPressed: onBtnPressed,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 120,
                          child: DynaButton(
                            btnName: 'Register',
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            shadowColor: Colors.redAccent,
                            textColor: Colors.white,
                            onBtnPressed: onBtnPressed,
                          ),
                        ),
                      ],
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already Have Account?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Please Login',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget DynaButton({
    required String btnName,
    required Color foregroundColor,
    required Color backgroundColor,
    required Color shadowColor,
    required Color textColor,
    required Function onBtnPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          // side: const BorderSide(
          //   color: Colors.red,
          //   width: 2,
          // ),
        ),
      ),
      onPressed: () => onBtnPressed(btnName),
      child: Wrap(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                btnName,
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget TextInputField({
  //   required String hintText,
  //   required IconData prefixIcon,
  //   required Color iconColor,
  // }) {
  //   return TextFormField(
  //     style: const TextStyle(
  //       fontSize: 18.0,
  //       color: Colors.white,
  //     ),
  //     decoration: InputDecoration(
  //       prefixIcon: Icon(prefixIcon, color: iconColor),
  //       hintText: hintText,
  //       hintStyle: const TextStyle(
  //         color: Colors.grey,
  //       ),
  //       enabledBorder: const UnderlineInputBorder(
  //         borderSide: BorderSide(
  //           color: Colors.grey,
  //         ),
  //       ),
  //       focusedBorder: const UnderlineInputBorder(
  //         borderSide: BorderSide(
  //           color: Colors.green,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
