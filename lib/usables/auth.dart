import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meet/Needed/snackbar.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChange => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  Future<bool> signInWithGoogle(BuildContext context) async {
    bool p = false;
    try {
      final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleauth =
          await googleuser?.authentication;

      final creds = GoogleAuthProvider.credential(
        accessToken: googleauth?.accessToken,
        idToken: googleauth?.idToken,
      );
      UserCredential usercreds = await _auth.signInWithCredential(creds);
      User? user = usercreds.user;

      if (user != null) {
        if (usercreds.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'user id': user.uid,
            'ProfilePic': user.photoURL,
          });
        }
        p = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      p = false;
    }
    return p;
  }

  void SignOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
