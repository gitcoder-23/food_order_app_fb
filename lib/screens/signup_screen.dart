import 'package:flutter/material.dart';
import 'package:food_order_app_fb/screens/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      hintText: 'Name',
                      prefixIcon: Icons.person_outline,
                      iconColor: Colors.white,
                    ),
                    TextInputField(
                      hintText: 'User Name',
                      prefixIcon: Icons.person_outline,
                      iconColor: Colors.white,
                    ),
                    TextInputField(
                      hintText: 'Email',
                      prefixIcon: Icons.person_outline,
                      iconColor: Colors.white,
                    ),
                    TextInputField(
                      hintText: 'Password',
                      prefixIcon: Icons.person_outline,
                      iconColor: Colors.white,
                    ),
                    TextInputField(
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.person_outline,
                      iconColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Row(
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
      onPressed: () {},
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

  Widget TextInputField({
    required String hintText,
    required IconData prefixIcon,
    required Color iconColor,
  }) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 18.0,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: iconColor),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
