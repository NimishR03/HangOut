import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meet/usables/create_meet.dart';

import '../Button/homeButtons.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final NewMeet _newMeet = NewMeet();

  createNewMeeting() async {
    var random = Random();
    String newRoom = (random.nextInt(10000000) + 1000000).toString();
    _newMeet.createNew(
        roomName: newRoom, isAudioMuted: true, isVideoMuted: true);
  }

  JoinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            homeScreenButton(
              onPressed: createNewMeeting,
              text: 'New Meeting',
              data: Icons.videocam,
            ),
            homeScreenButton(
              onPressed: () => JoinMeeting(context),
              text: 'Join Meeting',
              data: Icons.add_box_rounded,
            ),
            homeScreenButton(
              onPressed: () {},
              text: '  Schedule  ',
              data: Icons.calendar_today,
            ),
            homeScreenButton(
              onPressed: () {},
              text: 'Share Screen',
              data: Icons.arrow_upward_rounded,
            ),
          ],
        ),
        Expanded(
            child: Center(
          child: Text('Create Or Join Meeting in a Click',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white.withOpacity(0.7),
              )),
        ))
      ],
    );
    ;
  }
}
