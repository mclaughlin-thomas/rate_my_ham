import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_ham/pages/terms_welcome.dart';
import 'package:rate_my_ham/pages/main_page.dart';
import 'package:rate_my_ham/pages/user_page.dart';
import 'package:rate_my_ham/pages/select_user_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
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
      home: TermsWelcome(),
      routes: {
        '/terms': (context) => TermsWelcome(),
        '/main': (context) => MainPage(),
        '/user': (context) => UserPage(),
        '/select_user_name': (context) => SelectUserName(),
      },
    );
  }
}
