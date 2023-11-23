import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Screens/Homescreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel? sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
      name: "Divyanshi ",
      isGroup: false,
      currentMessage: "project k kitne pese hue",
      time: "4:00",
      icon: "person.svg",
      id: 1,
    ),
    ChatModel(
      name: "Shourya",
      isGroup: false,
      currentMessage: "bhai back end kitna huaa",
      time: "13:00",
      icon: "person.svg",
      id: 2,
    ),

    ChatModel(
      name: "Himakshi",
      isGroup: false,
      currentMessage: "2k bheju na",
      time: "8:00",
      icon: "person.svg",
      id: 3,
    ),

    ChatModel(
      name: "Vipul",
      isGroup: false,
      currentMessage: "jagdish mandir chale",
      time: "2:00",
      icon: "person.svg",
      id: 4,
    ),

    // ChatModel(
    //   name: "NodeJs Group",
    //   isGroup: true,
    //   currentMessage: "New NodejS Post",
    //   time: "2:00",
    //   icon: "group.svg",
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Homescreen(chatmodels: chatmodels, sourchat: sourceChat,);
    // return Scaffold(
    //  body: ListView.builder(
    //      itemCount: chatmodels.length,
    //      itemBuilder: (contex, index) => InkWell(
    //            onTap: () {
    //              sourceChat = chatmodels.removeAt(index);
    //               Navigator.pushReplacement(
    //                  context,
    //                   MaterialPageRoute(
    //                       builder: (builder) => Homescreen(
    //                             chatmodels: chatmodels,
    //                             sourchat: sourceChat,
    //                           )));
    //             },
    //            child: ButtonCard(
    //               name: chatmodels[index].name,
    //               icon: Icons.person,
    //            ),
    //          )),
    //);
  }
}
