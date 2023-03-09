import 'package:flutter/material.dart';
import 'package:food_order_app_fb/screens/login_screen.dart';
import 'package:food_order_app_fb/screens/signup_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  onBtnPressed(String btnName) {
    if (btnName == 'Login') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Image.asset(
                  'assets/images/logo.jpg',
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Welcome To Tastee',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Column(
                    children: const [
                      Text("Order food form our restaueant and"),
                      Text("Make reservation in real- time")
                    ],
                  ),
                  SizedBox(
                    width: 300,
                    height: 45,
                    child: Button(
                      btnName: 'Login',
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      shadowColor: Colors.greenAccent,
                      txtColor: Colors.white,
                      onBtnPressed: onBtnPressed,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 45,
                    child: Button(
                      btnName: 'Signup',
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      shadowColor: Colors.white,
                      txtColor: Colors.green,
                      onBtnPressed: onBtnPressed,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Button({
    required String btnName,
    required Color foregroundColor,
    required Color backgroundColor,
    required Color shadowColor,
    required Color txtColor,
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
          side: const BorderSide(
            color: Colors.green,
            width: 2,
          ),
        ),
      ),
      onPressed: () {
        onBtnPressed(btnName);
      },
      child: Wrap(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                btnName,
                style: TextStyle(
                  fontSize: 20,
                  color: txtColor,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
