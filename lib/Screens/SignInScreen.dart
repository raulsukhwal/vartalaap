import 'package:chatapp/Screens/OtpScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
   SignInScreen();

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;
  TextEditingController phoneController = TextEditingController();

  Future<void> _verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Automatically sign in the user if the SMS code is sent successfully
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure (e.g., invalid phone number)
        print("Verification Failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        // Store the verification ID for later use
        _verificationId = verificationId;
        Navigator.push(context, MaterialPageRoute(builder:(_)=>OtpScreen(verificationId: _verificationId)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Called when the automatic code retrival times out
      },
    );

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff004AAD),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Column(
          children: [
             Container(//logo
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
              padding:EdgeInsets.all(14.0),
              child: Text("WELCOME TO VARTALAAP",style:TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
           Text("Provide your phone numbers, so we can \n be able to send you comfirmation code.",style:TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.white),)
           , Container(
              color: Color(0xff004AAD),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: InternationalPhoneNumberInput(//dialogConfig: DialogConfig(backgroundColor: Colors.black),
                  controller: phoneController,


                  countryConfig: CountryConfig(textStyle: TextStyle(color: Colors.white,backgroundColor: Colors.cyan),
                    flagSize: 30.0,
                    flatFlag: false,
                  ),
                  betweenPadding: 4,
                  height: 70,
                  phoneConfig: PhoneConfig(focusedColor: Colors.white,enabledColor: Colors.white,textStyle: TextStyle(color: Colors.white),
                    hintText: "      MOBILE NUMBER",
                  ),
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 100,vertical: 30),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.white,)
                  ,animationDuration: Duration(seconds: 3),
              ),
                onPressed: () {
                  // Get the entered phone number from the InternationalPhoneNumberInput widget
                  String phoneNumber = "+91"+phoneController.text;// get the phone number;
                  _verifyPhoneNumber(phoneNumber);
                  print(phoneNumber);


                },

                child: Center(
                  child: Text(
                    "CONTINUE",
                    style: TextStyle(
                      fontSize: 24,
                      color:Color(0xff004AAD),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
            ,//Text("WELCOME TO VARTALAAP",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
