import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app_fb/constants/colors.dart';
import 'package:food_order_app_fb/screens/home_screen.dart';
import 'package:food_order_app_fb/screens/login_screen.dart';

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
        // primarySwatch: primeColor,
        // primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          color: appBarThemeColor,
        ),
      ),
      // home: const WelcomePage(),

      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapShot) {
          print("snapShot-user-logged--> ${snapShot.data}");
          if (snapShot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
