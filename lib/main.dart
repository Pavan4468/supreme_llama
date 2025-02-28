import 'package:flutter/material.dart';
import 'sigin.dart';
import 'signup.dart';
import 'home.dart'; // Import your HomePage here
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PoorMartApp());
}

class PoorMartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-WAST',
      debugShowCheckedModeBanner: false,
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomeScreen(), // Add HomePage route here
      },
    );
  }
}
