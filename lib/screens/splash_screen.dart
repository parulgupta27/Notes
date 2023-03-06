import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/main.dart';
import 'package:notes/models/user_model.dart';
import 'package:notes/screens/login_screen.dart';
import 'package:notes/screens/notes_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int count=0;
    var _auth=FirebaseAuth.instance;
    if(_auth.currentUser!=null){
    count=1;
    }
    Timer(Duration(seconds: 3), () {
      if(count==0){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      }
      else{
      CustomUser user=CustomUser();
      user.fromUser(_auth.currentUser!);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NotesScreen(user)));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text("Notes.. ",style: TextStyle(fontFamily: "Pacifico-Regular",fontSize: height*0.04,color: Colors.blueGrey),),
            Icon(Icons.edit,size: height*0.04,color: Colors.blueGrey,)
            ],)
          ],),
      )),
    );
  }
}