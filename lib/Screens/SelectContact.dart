import 'package:chatapp/CustomUI/ButtonCard.dart';
import 'package:chatapp/CustomUI/ContactCard.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Screens/CreateGroup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<Contact> contactsList = [];

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = List.generate(
        contactsList.length,
        (index) => ChatModel(
            name: contactsList[index].displayName,
            status: "New USer",
            phoneNumber: contactsList[index].phones.isNotEmpty == true
                ? contactsList[index].phones.first.number
                : ""));

    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${contactsList.length} contacts",
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {}),
            PopupMenuButton<String>(
              padding: EdgeInsets.all(0),
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  PopupMenuItem(
                    child: Text("Invite a friend"),
                    value: "Invite a friend",
                  ),
                  PopupMenuItem(
                    child: Text("Contacts"),
                    value: "Contacts",
                  ),
                  PopupMenuItem(
                    child: Text("Refresh"),
                    value: "Refresh",
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                    value: "Help",
                  ),
                ];
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => CreateGroup()));
                },
                child: ButtonCard(
                  icon: Icons.group,
                  name: "New group",
                ),
              ),
              ButtonCard(
                icon: Icons.person_add,
                name: "New contact",
              ),
              Column(
                children: List.generate(
                    contactsList.length,
                    (index) => ContactCard(
                          contact: contacts[index],
                        )),
              )
            ],
          ),
        ));
  }

  void getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      print("Get Contacts");
      contactsList = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true, withAccounts: true);
      print(contactsList);
      setState(() {});
    }
  }
}
