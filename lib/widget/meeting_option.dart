import 'package:flutter/material.dart';
import 'package:zoom_demo/utiles/colors.dart';

class MeetingOption extends StatelessWidget {
  final String txt;
  final bool isMute;
  final void Function(bool)? functionn;

  const MeetingOption(
      {Key? key, required this.txt, required this.isMute, this.functionn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height / 15,
      decoration: const BoxDecoration(color: seconderyBackgroundColor),
      child: Padding(
        padding: EdgeInsets.only(
          left: size.width / 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              style: TextStyle(
                color: Colors.white70,
                fontSize: size.width / 25,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: size.width / 25,
              ),
              child: Switch(
                value: isMute,
                onChanged: functionn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
