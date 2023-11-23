import 'dart:async';

import 'package:chatapp/Model/user.dart';
import 'package:chatapp/Screens/LoginScreen.dart';
import 'package:chatapp/Screens/newuserscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const OtpScreen(
      {Key? key, required this.verificationId, required this.phoneNumber})
      : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpFieldController otpController = OtpFieldController();
  String otp = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;

  Future<bool> _verifyOtp(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      // Successfully signed in with OTP
      if (_auth.currentUser?.uid != null) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(_auth.currentUser?.uid ?? "")
            .set(ChatUser(mobile: widget.phoneNumber).toJson());
      }
      return _auth.currentUser?.uid != null;
      print("User signed in with OTP");
    } catch (e) {
      return false;
      // Handle verification failure
      print("Verification Failed: ${e.toString()}");
    }
  }

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Color(0xff004AAD)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //logo
              height: 430,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/img_3.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                "VERIFICATION",
                style: GoogleFonts.acme(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.yellow[400]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                  child: Text(
                "We have sent you an SMS with a code \n   to the number that you provided.",
                style: GoogleFonts.alatsi(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: OTPTextField(
                otpFieldStyle: OtpFieldStyle(backgroundColor: Colors.white),
                spaceBetween: 1,
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 36,
                fieldStyle: FieldStyle.underline,
                style: TextStyle(fontSize: 28, color: Colors.black),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                onCompleted: (pin) {
                  otp = pin;
                  setState(() {});
                  print("Completed: " + pin);
                },
                controller: otpController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  )),
                  onPressed: () async {
                    if (await _verifyOtp(otp)) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  NewUserScreen(_auth.currentUser?.uid.toString() ?? "")),
                          (route) => false);
                    }
                  },
                  child: Text(
                    "FINISH",
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff004AAD),
                        fontWeight: FontWeight.bold),
                  )),
            ),
            TextButton(
                onPressed: enableResend ? _resendCode : null,
                child: Text("RESEND CODE",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
            Text(
              'after $secondsRemaining seconds',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer?.cancel();
    super.dispose();
  }
}
