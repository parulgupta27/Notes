import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:notes/main.dart';
import 'package:notes/models/user_model.dart';
import 'package:notes/screens/add_new_note_screen.dart';
class NewNoteWidget extends StatelessWidget {
  CustomUser? user;
  NewNoteWidget(this.user);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return  Container(
      height: height*0.25,
      width: double.infinity,
      
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewNoteScreen(user!)));
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 151, 178, 190),
        ),
        child: Center(child: Text("+ Add new note",style: TextStyle(fontFamily: "Pacifico-Regular",fontSize: height*0.02),))),
      
    );
  }
}