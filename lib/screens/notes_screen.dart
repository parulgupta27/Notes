import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:notes/main.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/models/user_model.dart';
import 'package:notes/widgets/custom_note_card.dart';
import 'package:notes/widgets/new_note_widget.dart';
class NotesScreen extends StatefulWidget {
  CustomUser user;
  NotesScreen(this.user);

  @override
  State<NotesScreen> createState() => _NotesScreenState(this.user);
}

class _NotesScreenState extends State<NotesScreen> {
  CustomUser? user;
  _NotesScreenState(this.user);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes",style: TextStyle(fontFamily: "Pacifico-Regular"),),centerTitle: false,
      actions: [
        Padding(
          padding:EdgeInsets.only(right: width*0.02),
          child: CircleAvatar(
            radius: height*0.018,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: height*0.016,
              backgroundColor:Colors.white,
              backgroundImage: NetworkImage(user!.photoUrl.toString()),
              ),
            
          ),
        ),
      ],),
      body: SafeArea(child:
      Padding(padding:EdgeInsets.symmetric(horizontal:width*0.01 ) ,child:Center(child:Column(
        children:[
        SizedBox(height: height*0.005,),
        NewNoteWidget(user),
        SizedBox(height: height*0.01,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Notes.. ",style: TextStyle(fontFamily: "Pacifico-Regular",fontSize: height*0.02),),
          Icon(Icons.edit,size: height*0.02,),
          ],
        ),
        SizedBox(height: height*0.01,),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection(user!.email.toString()).snapshots(),
          builder: (context,snapshot){
            if(snapshot.hasData)
          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
            Note note=Note();
            note.fromObj(snapshot.data!.docs[index]);
            return Column(children: [
              NoteCard(note, user!),
              SizedBox(height: height*0.01,),
            ],);
            }),
          );
          if(snapshot.hasError){
            return Center(child:Text("Some Error Occured"));
          }
          return Text("Loading...");
        })
        
        ],
      )),),),
    );
  }
}