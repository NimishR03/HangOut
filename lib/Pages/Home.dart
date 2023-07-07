import 'package:flutter/material.dart';
import 'package:meet/Button/loginbutton.dart';
import 'package:meet/Needed/color.dart';
import 'package:meet/Pages/History.dart';
import 'package:meet/Pages/Meeting.dart';
import 'package:meet/usables/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;
  pageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryScreen(),
    const Text('Contacts'),
    LoginButton(text: 'Log Out', onPressed: (() => Authentication().SignOut()))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meet & Chat'),
        centerTitle: true,
        backgroundColor: appBarcolor,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: footerButtonColor,
          unselectedItemColor: Colors.grey,
          onTap: pageChange,
          currentIndex: _page,
          selectedFontSize: 16,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: footerColor,
                icon: Icon(Icons.comment_bank),
                label: 'Meet and chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'Meeting'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Contacts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings'),
          ]),
    );
  }
}
