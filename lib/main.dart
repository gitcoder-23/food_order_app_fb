import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app_fb/constants/colors.dart';
import 'package:food_order_app_fb/screens/welcome_page.dart';

// void main() {
//   runApp(const MyApp());
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Order App',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primarySwatch: primeColor,
        primaryColor: primaryColor,
        // scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      home: const WelcomePage(),
    );
  }
}
