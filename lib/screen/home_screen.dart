import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_demo/resourses/jitsi_meet_methods.dart';

import '../widget/home_button_metting_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final JitsiMeetingMethoths _jitsiMeeting = JitsiMeetingMethoths();

  creatNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeeting.creatNewMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }
  joinMeeting(BuildContext context){
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMettingButton(
                txt: 'New Metting',
                tap: creatNewMeeting,
                icon: Icons.videocam,
              ),
              HomeMettingButton(
                txt: 'Join Meeting',
                tap: ()=>joinMeeting(context),
                icon: Icons.add_box,
              ),
              HomeMettingButton(
                txt: 'Schedule',
                tap: () {},
                icon: Icons.calendar_today,
              ),
              HomeMettingButton(
                txt: 'Share Screen',
                tap: () {},
                icon: Icons.arrow_upward_rounded,
              ),
            ],
          ),
          Expanded(
              child: Center(
            child: Text(
              'Creat/Join Meetings With Just a Click!',
              style: TextStyle(
                  fontSize: size.width / 22, color: Colors.grey.shade300),
            ),
          ))
        ],
      ),
    );
  }
}
