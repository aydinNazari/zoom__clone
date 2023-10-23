import 'package:flutter/material.dart';
import 'package:zoom_demo/utiles/colors.dart';
import 'package:zoom_demo/utiles/utiles.dart';

class Meeting_screen extends StatefulWidget {
  const Meeting_screen({Key? key}) : super(key: key);

  @override
  State<Meeting_screen> createState() => _Meeting_screenState();
}

class _Meeting_screenState extends State<Meeting_screen> {
  int _page = 0;

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Meet & Chat',
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: size.width / 35,
        unselectedFontSize: size.width / 39,
        onTap: onPageChanged,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.comment_bank,
              ),
              label: 'Meet & Char'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lock_clock,
              ),
              label: 'Meetings'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: 'Settings')
        ],
      ),
      body: pageList[_page]
    );
  }
}
