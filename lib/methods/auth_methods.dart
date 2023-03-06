import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/notes_screen.dart';
class AuthMethods{
final _auth=FirebaseAuth.instance;
final _storage=FirebaseStorage.instance;
final _picker=ImagePicker();
registerUser(String email,String password,String name,Uint8List image,BuildContext context)async{
try{
 var cred=await _auth.createUserWithEmailAndPassword(email: email, password: password);
var user=cred.user;
var ref=await _storage.ref("ProfilePics").child(email);
await ref.putData(image);
var url=await ref.getDownloadURL();
user!.updateDisplayName(name);
user.updatePhotoURL(url);
user.reload();
CustomUser usr=CustomUser();
usr.fromUser(user);
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NotesScreen(usr)));
return "Success";
}
on FirebaseAuthException catch (e){
  return e.code;
}
catch(e){
  print(e);
return "Internal Error";
}
}
loginUser(String email,String password,BuildContext context)async{
try{
var cred=await _auth.signInWithEmailAndPassword(email: email, password: password);
User? user=cred.user;

CustomUser usr=CustomUser();
usr.fromUser(user!);
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NotesScreen(usr)));
return "Success";
}
on FirebaseException catch(e){
  return e.code;
}
catch(e){
  return "Internal Error";
}
}
pickImage()async{
final img=await _picker.pickImage(source: ImageSource.gallery);
return img!.readAsBytes();
}
}