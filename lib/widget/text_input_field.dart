import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Color iconColor;
  final bool obscureText;
  final TextEditingController textEditingController;

  const TextInputField({
    required this.hintText,
    required this.prefixIcon,
    required this.iconColor,
    required this.obscureText,
    required this.textEditingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
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
