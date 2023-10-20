import 'package:flutter/material.dart';
import 'package:zoom_demo/utiles/colors.dart';

class CoustomButton extends StatelessWidget {
  final String text;
  final Size size;
  final void Function()? onPeress;

  const CoustomButton({Key? key, required this.text, required this.size, this.onPeress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height / 16,
      child: Padding(
        padding:  EdgeInsets.only(left: size.width/35,right: size.width/35),
        child: InkWell(
          onTap: onPeress,
          child: Container(
            width: size.width,
            height: size.height / 17,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  size.width / 50,
                ),
              ),
            ),
            child: Center(
              child: Text(text,style: TextStyle(
                color: Colors.white,
                fontSize: size.width/20,
                fontWeight: FontWeight.w500
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
