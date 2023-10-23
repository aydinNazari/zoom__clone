import 'package:flutter/material.dart';
import 'package:zoom_demo/screen/history_meeting_screen.dart';

import '../screen/home_screen.dart';



showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black26,
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white
        ),
      ),
    ),
  );
}

List<Widget> pageList=[
   HomeScreen(),
  const HistoryMeetingScreen(),
  const Text('Contact'),
  const Text('Setting'),
];
