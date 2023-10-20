import 'package:flutter/material.dart';

import '../widget/coustom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: size.height / 15),
            child: Text(
              'Start or join a meeting',
              style: TextStyle(
                fontSize: size.width / 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          /*   Container(
              width: size.width,
              height: size.height/1.8,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(''))
              ),
            )*/
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: size.width,
              height: size.height / 2,
              child: Image.asset(
                'assets/images/onboarding.png',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height / 20,
            ),
            child: InkWell(
              child: CoustomButton(
                size: size,
                text: 'Log in',
              ),
            ),
          )
        ],
      ),
    );
  }
}
