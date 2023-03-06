import 'package:flutter/material.dart';
import 'package:notes/main.dart';
import 'package:notes/methods/storage_methods.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/models/user_model.dart';
import 'package:notes/widgets/custom_button.dart';
import 'package:notes/widgets/custom_text_field.dart';
class AddNewNoteScreen extends StatefulWidget {
  CustomUser user;
  AddNewNoteScreen(this.user);

  @override
  State<AddNewNoteScreen> createState() => _AddNewNoteScreenState(this.user);
}

class _AddNewNoteScreenState extends State<AddNewNoteScreen> {
  CustomUser user;
  var _titleController=TextEditingController();
  var _contentController=TextEditingController();
  _AddNewNoteScreenState(this.user);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Add Note",style: TextStyle(fontSize: height*0.018,fontFamily: "Pacifico-Regular",color: Colors.white),),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width*0.02),
            child: CircleAvatar(
              radius: height*0.018,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: height*0.016,
                backgroundImage: NetworkImage(user.photoUrl.toString()),
              ),
            ),
          ),
        ]),
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CustomTextField(_titleController, false, Icons.title, "Title", 1),
          SizedBox(height: height*0.015,),
          CustomTextField(_contentController, false, Icons.text_fields_rounded, "Add note here", 10),
          SizedBox(height: height*0.015,),
          CustomButton(() async{
            Note note=Note(title: _titleController.text,content: _contentController.text,id:(9999999999999999-DateTime.now().microsecondsSinceEpoch).toString());
           var res= await StorageMethods().saveNote(note, user,context);
           print(res);
          }, "Add note"),

        ],),
      )),
    );
  }
}