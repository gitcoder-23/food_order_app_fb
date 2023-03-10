// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:food_order_app_fb/screens/signup_screen.dart';
import 'package:food_order_app_fb/widget/text_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  // work in input field
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

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
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 160),
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                TextInputField(
                  hintText: 'Username/ Email',
                  prefixIcon: Icons.person_outline,
                  iconColor: Colors.white,
                  textEditingController: userName,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextInputField(
                  hintText: 'Password',
                  prefixIcon: Icons.lock_outline,
                  iconColor: Colors.white,
                  textEditingController: password,
                  obscureText: true,
                ),
              ],
            ),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  shadowColor: Colors.redAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                ),
                onPressed: () {},
                child: Wrap(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New User?',
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
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Please Register Now',
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
    );
  }
}
