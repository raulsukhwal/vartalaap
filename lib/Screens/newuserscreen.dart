import 'package:flutter/material.dart';

class NewUserScreen extends StatefulWidget {
  String userId;

  NewUserScreen(this.userId);


  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String selectedGender = 'Male'; // Default gender

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
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 100,
              child: DropdownButtonFormField<String>(style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
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
                    child: Text(value,style: TextStyle(color: Colors.yellow),),
                  );
                }).toList(),
                decoration: InputDecoration(fillColor: Colors.yellow,
                  labelText: 'Gender',
                  icon: Icon(Icons.people,color: Colors.white,),
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
                onPressed: () {},
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
