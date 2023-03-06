import 'package:firebase_auth/firebase_auth.dart';
class CustomUser{
  String ? email;
  String ? name;
  String ? photoUrl;
  CustomUser({this.email,this.name,this.photoUrl});
  fromUser(User user){
  email=user.email;
  name=user.displayName;
  photoUrl=user.photoURL;
  }
}