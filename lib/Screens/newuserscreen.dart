import 'package:chatapp/Model/user.dart';
import 'package:chatapp/Screens/Homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewUserScreen extends StatefulWidget {
  String userId;
  ChatUser user;

  NewUserScreen(this.userId, this.user);

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String selectedGender = 'Male'; //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Container(color: Colors.white,height: 90,width: 234,),
      backgroundColor: Color(0xff004AAD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //logo
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/img_3.png"),
                ),
              ),
            ),
            Text(
              "ENTER YOUR DETAILS",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  hintText: "FIRST NAME",
                ),
                maxLength: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  hintText: "LAST NAME",
                ),
                maxLength: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: "EMAIL ID"),
                maxLength: 27,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: 100,
              child: DropdownButtonFormField<String>(
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                value: selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
                items: <String>['Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.yellow),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  fillColor: Colors.yellow,
                  labelText: 'Gender',
                  icon: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                decoration: InputDecoration(hintText: "Age"),
                maxLength: 2,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                decoration: InputDecoration(hintText: "MOBILE NO."),
                maxLength: 18,
                keyboardType: TextInputType.number,
              ),
            ),*/
            TextButton(
                onPressed: () async {
                  var docs = await FirebaseFirestore.instance
                      .collection("users")
                      .where("id", isEqualTo: widget.userId)
                      .get();

                  widget.user.firstName = firstNameController.text;
                  widget.user.lastName = lastNameController.text;
                  widget.user.email = emailController.text;
                  widget.user.gender = selectedGender.toString();

                  print(docs.docs.first.id);
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(docs.docs.first.id)
                      .update(widget.user.toJson());
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Homescreen()));
                },
                child: Text(
                  "CONTINUE",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
