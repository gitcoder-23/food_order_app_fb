import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  onBtnPressed() {
    print('Hi');
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
        // minimumSize: const Size(100, 40),
      ),
      onPressed: () => onBtnPressed(),
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
