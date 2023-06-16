import 'dart:developer';

// import 'package:beegains/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final firebaseAuth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  Stream<User?> get user => firebaseAuth.authStateChanges();

  Future<void> loginWithGoogle() async {
    try {
      //Login with google
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception('No user found for that email.');
        case 'user-disabled':
          throw Exception('User disabled.');
        case 'invalid-credential':
          throw Exception('Invalid credential.');
      }
      log('Error: ${e.code}');
    } catch (e) {
      log('Error: $e');
    }
    return;
  }

  //Login with mobile
  Future<void> loginWithMobile(String phone) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredential) async {
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (verificationFailed) {
          throw Exception(verificationFailed.message);
        },
        codeSent: (verificationId, resendingToken) async {
          // //Show dialog to user to enter the otp
          // var smsCode = '';
          // //Create a manual controller to get the otp from the user
          // final smsCodeController = TextEditingController();
          // //Show the dialog to the user
          // await showDialog(
          //   context: null!,
          //   barrierDismissible: false,
          //   builder: (context) => AlertDialog(
          //     title: Text('Enter SMS Code'),
          //     content: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         TextField(
          //           controller: smsCodeController,
          //           keyboardType: TextInputType.number,
          //           onChanged: (value) {
          //             smsCode = value;
          //           },
          //         ),
          //       ],
          //     ),
          //     actions: [
          //       TextButton(
          //         onPressed: () async {
          //           final code = smsCodeController.text.trim();
          //           var credential = PhoneAuthProvider.credential(
          //             verificationId: verificationId,
          //             smsCode: code,
          //           );
          //           await firebaseAuth.signInWithCredential(credential);
          //         },
          //         child: Text('Done'),
          //       ),
          //     ],
          //   ),
          // );
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception('No user found for that email.');
        case 'user-disabled':
          throw Exception('User disabled.');
        case 'invalid-credential':
          throw Exception('Invalid credential.');
      }
      log('Error: ${e.code}');
    }
    return;
  }

  Future<void> logout() async {
    await firebaseAuth.signOut();
    return;
  }
}
