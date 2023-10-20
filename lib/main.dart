import 'package:flutter/material.dart';
import 'package:zoom_demo/screen/login_screen.dart';
import 'package:zoom_demo/utiles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: baclgroundColor,
        useMaterial3: true,
      ),
      routes: {
        '/login' : (context) => const LoginScreen(),
      },
      home: const LoginScreen(),
    );
  }
}
