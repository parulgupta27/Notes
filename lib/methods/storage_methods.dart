import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/models/user_model.dart';

class StorageMethods{
  final _firestore=FirebaseFirestore.instance;
  saveNote(Note note, CustomUser user,BuildContext context)async{
    try{
  var ref=_firestore.collection(user.email!).doc(note.id.toString());
  await ref.set(note.toObj());
  Navigator.pop(context);
  return "Success";
  }
  on FirebaseException catch (e){
    return e.code;
  }
  catch(e){
    return "Internal Error";
  }
  }
  removeNote(CustomUser user , Note note)async{
  await FirebaseFirestore.instance.collection(user.email!).doc(note.id).delete();
  }
}