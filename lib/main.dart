import 'package:flutter/material.dart';
import 'package:zoom_demo/resourses/auth_methods.dart';
import 'package:zoom_demo/screen/meeting_screen.dart';
import 'package:zoom_demo/screen/login_screen.dart';
import 'package:zoom_demo/screen/video_call_screen.dart';
import 'package:zoom_demo/utiles/colors.dart';
import 'package:firebase_core/firebase_core.dart';

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
      title: 'Zoom Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: baclgroundColor,
        useMaterial3: true,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const Meeting_screen(),
        '/video-call': (context) => const VideoCallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData){
            return const Meeting_screen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
