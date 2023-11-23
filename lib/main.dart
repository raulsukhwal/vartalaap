import 'package:chatapp/Screens/CameraScreen.dart';
import 'package:chatapp/Screens/Homescreen.dart';
import 'package:chatapp/Screens/LoginScreen.dart';
import 'package:chatapp/Screens/SignInScreen.dart';
import 'package:chatapp/Screens/newuserscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCh8QnIirXF9M47w1vdPI7cWbehfWfEIYE",
          appId: "1:117457126969:android:24cd9151b5643adaebafe8",
          messagingSenderId: "117457126969",
          projectId: "vartalaap-4df32"));

  // cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Color(0xff004AAD)),
          fontFamily: "OpenSans",
          primaryColor: Color(0xff004AAD),
          hintColor: Color(0xB3FFFFFF)),
      home: SignInScreen(),
    );
  }
}
