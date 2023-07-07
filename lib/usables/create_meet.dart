import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:meet/usables/auth.dart';
import 'package:meet/usables/firestore_method.dart';

class NewMeet {
  final Authentication _authentication = Authentication();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  void createNew(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String name = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String naam;
      if (name.isEmpty) {
        naam = _authentication.user.displayName!;
      } else {
        naam = name;
      }
      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = naam
        ..userEmail = _authentication.user.email
        ..userAvatarURL = _authentication.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
