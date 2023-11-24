import 'package:flutter/material.dart';

class NewUserScreen extends StatefulWidget {
  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String selectedGender = 'Male'; // Default gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: (Color(0xff004AAD)),


    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
      TextField(style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
      controller: nameController,
      decoration: InputDecoration(
      labelText: 'Name',
      icon: Icon(Icons.person,color: Colors.white,),
      ),
      ),
      SizedBox(height: 20),
      TextField(style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
      controller: phoneNumberController,
      decoration: InputDecoration(
      labelText: 'Phone Number',
      icon: Icon(Icons.phone,color: Colors.white,),
      ),
      keyboardType: TextInputType.phone,
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
      SizedBox(height: 40),
      ElevatedButton(
      onPressed: () {
      // Handle saving new user details
      String name = nameController.text;
      String phoneNumber = phoneNumberController.text;

      // You can add logic here to save the details or navigate to another screen
      // For now, let's print the details
      print('Name: $name, Phone Number: $phoneNumber');
      },
      child: Text('Save',style: TextStyle(fontWeight: FontWeight.bold,color:  (Color(0xff004AAD))),),
      style: ElevatedButton.styleFrom(
      primary: Colors.white,
      ),
      ),
      ],
      ),
    ),
    )
    );
  }
}
