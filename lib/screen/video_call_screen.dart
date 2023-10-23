import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_demo/resourses/auth_methods.dart';
import 'package:zoom_demo/resourses/jitsi_meet_methods.dart';
import 'package:zoom_demo/utiles/colors.dart';
import 'package:zoom_demo/widget/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController meetingNameController;
  final JitsiMeetingMethoths _jitsiMeetingMethoths = JitsiMeetingMethoths();

  bool isAudioMute = true;
  bool isVideoMute = true;

  joinMeeting() {
    _jitsiMeetingMethoths.creatNewMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMute,
      isVideoMuted: isVideoMute,
      userName: meetingNameController.text
     );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMute = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMute = val;
    });
  }

  @override
  void initState() {
    meetingIdController = TextEditingController();
    meetingNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    meetingNameController.dispose();
    meetingIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Join a Meeting',
          style: TextStyle(
            color: Colors.grey.shade300,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 25),
            child: SizedBox(
              width: size.width,
              height: size.height / 15,
              child: TextField(
                controller: meetingIdController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    hintText: 'Room ID',
                    hintStyle: TextStyle(),
                    filled: true,
                    fillColor: seconderyBackgroundColor,
                    border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height / 50,
                left: size.width / 25,
                right: size.width / 25),
            child: SizedBox(
              width: size.width,
              height: size.height / 15,
              child: TextField(
                controller: meetingNameController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    fillColor: seconderyBackgroundColor,
                    hintText: _authMethods.user.displayName,
                    filled: true,
                    border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height / 25),
            child: InkWell(
              onTap:  joinMeeting,
              child: Text(
                'Join',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: size.width / 25,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 25,
          ),
          MeetingOption(
            txt: 'Mute Audio',
            isMute: isAudioMute,
            functionn: (val) => onAudioMuted(val),
          ),
          MeetingOption(
            txt: 'Turn off my video',
            isMute: isVideoMute,
            functionn: (val) => onVideoMuted(val),
          )
        ],
      ),
    );
  }
}
