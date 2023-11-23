import 'package:flutter/material.dart';

class NewUserScreen extends StatefulWidget {

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(//drawer: Container(color: Colors.white,height: 90,width: 234,),
      backgroundColor: Color(0xff004AAD),
      body: SingleChildScrollView(
        child: Column(children: [

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
          Text("ENTER YOUR DETAILS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(decoration: InputDecoration(hintText: "FIRST NAME",),maxLength: 20,),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(decoration: InputDecoration(hintText: "LAST NAME",),maxLength: 20,),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(decoration: InputDecoration(hintText: "EMAIL ID"),maxLength: 27,keyboardType: TextInputType.number,),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(decoration: InputDecoration(hintText: "Age"),maxLength: 2,keyboardType: TextInputType.number,),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(decoration: InputDecoration(hintText: "MOBILE NO."),maxLength: 18,keyboardType: TextInputType.number,),
          ),
          TextButton(onPressed: (){}, child: Text("CONTINUE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),





        ],),
      ),
    );
  }
}
