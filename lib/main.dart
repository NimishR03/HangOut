import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meet/Needed/color.dart';
import 'package:meet/Pages/Home.dart';
import 'package:meet/Pages/call.dart';
import 'package:meet/Pages/login.dart';
import 'package:meet/usables/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meet App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/call': (context) => const CallScreen(),
      },
      home: StreamBuilder(
        stream: Authentication().authChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return const Home();
          }
          return const Login();
        },
      ),
    );
  }
}
