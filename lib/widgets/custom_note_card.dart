import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/methods/storage_methods.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/models/user_model.dart';
import '../main.dart';
class NoteCard extends StatelessWidget {
  Note note;
  CustomUser user;
  NoteCard(this.note,this.user);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return InkWell(
      child: Container(
      height: height*0.28,
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.blueGrey)),
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(radius: height*0.022,
          backgroundImage: NetworkImage(user.photoUrl!),),
          title: Text(user.name!),
          subtitle: Text(note.time!),
          trailing: PopupMenuButton(itemBuilder: (context){
            return [
              PopupMenuItem(child: ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit"),
              onTap: (){
                Navigator.pop(context);
              },
              )),
              PopupMenuItem(child: ListTile(
              leading: Icon(Icons.delete_forever),
              title: Text("Delete"),
              onTap: (){
                Navigator.pop(context);
                showDeleteConfirmation(context,user,note);
              },
              )),
            ];
          },)
        ),
        Container(
          height: height*0.002,
          width: double.infinity,
          color: Colors.blueGrey,
        ),
        SizedBox(height: height*0.003,),
        Container(
          height: height*0.02,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: RichText(text: TextSpan(text: note.title!,style:TextStyle(fontFamily: "Pacifico-Regular",color: Colors.blueGrey) ),)),
          ),
        ),
        SizedBox(height: height*0.007,),
        Container(
          height: height*0.002,
          width: double.infinity,
          color: Colors.blueGrey,
        ),
        Container(
          height: height*0.164,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.01),
            child: SingleChildScrollView(child: RichText(text: TextSpan(text: note.content,style: TextStyle(color: Colors.black)),)),
          ),
        ),
      ]),
      ),
    );
  }
}
showDeleteConfirmation(BuildContext context,CustomUser user , Note note){
  
  final alert= AlertDialog(
    elevation: 10,
    backgroundColor: Colors.white,
    content:  Text("Do you want to delete this note?"),
    actions: [
      TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text("Cancel")),
      TextButton(onPressed: ()async{
        await FirebaseFirestore.instance.collection(user.email.toString()).doc(note.id.toString()).delete();
        Navigator.pop(context);
      }, child: Text("Delete")),
    ],
  );
  showDialog(context: context, builder: (context){
    return alert;
  });
  
}