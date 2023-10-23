import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeMettingButton extends StatelessWidget {
  final void Function()? tap;
  final String txt;
  final IconData icon;

  const HomeMettingButton(
      {Key? key, this.tap, required this.txt, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: tap,
      child: Column(
        children: [
          Container(
            width: size.width / 6,
            height: size.width / 6,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  size.width / 50,
                ),
              ),
            ),
            child: Center(
              child: Icon(
                icon,
                size: size.width / 13,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.width / 45,
            ),
            child: Text(
              txt,
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
