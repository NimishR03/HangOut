import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:meet/Button/Joinbutton.dart';
import 'package:meet/Button/options.dart';
import 'package:meet/Needed/color.dart';
import 'package:meet/usables/auth.dart';
import 'package:meet/usables/create_meet.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final Authentication _authentication = Authentication();
  late TextEditingController meetingId;
  late TextEditingController nameController;
  final NewMeet _newMeet = NewMeet();
  bool isAudioMute = true;
  bool isVideoMute = true;

  @override
  void initState() {
    meetingId = TextEditingController();
    nameController =
        TextEditingController(text: _authentication.user.displayName);
    super.initState();
  }

  @override
  void Dispose() {
    super.dispose();
    meetingId.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _newMeet.createNew(
        roomName: meetingId.text,
        isAudioMuted: isAudioMute,
        isVideoMuted: isVideoMute,
        name: nameController.text);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarcolor,
        title: const Text(
          'Join Meeting',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingId,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room ID',
                  contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 0)),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 0)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          JoinButton(text: 'Join', onPressed: _joinMeeting),
          const SizedBox(
            height: 20,
          ),
          Options(
            text: "Join Without Audio",
            isMute: isAudioMute,
            onChange: onAudioMuted,
          ),
          Options(
            text: "Join Without Video",
            isMute: isVideoMute,
            onChange: onVideoMuted,
          )
        ],
      ),
    );
  }
}
